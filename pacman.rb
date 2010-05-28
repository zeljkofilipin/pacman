def tab(browser)
  browser.send_keys "{TAB}"
end
def go(browser, direction)
  output(browser, direction)
  browser.send_keys "{#{direction.upcase}}"
end
def output(browser, direction)
  puts "pacmans: #{pacmans(browser)}, score: #{score(browser)}, direction: #{direction}, position: #{pacman_position(browser)}"
end
def pacmans(browser)
  browser.div(:id => "pcm-li").divs.size
end
def pacman_visible?(browser)
  pacman_html(browser) !~ /LEFT: -62px/
end
def pacman_position(browser)
  "#{pacman_horizontal_position(browser)} #{pacman_vertical_position(browser)}"
end
# 8-120
def pacman_vertical_position(browser)
  pacman_html(browser).split("TOP: ")[1].split("px")[0].to_i
end
# 8-448
def pacman_horizontal_position(browser)
  pacman_html(browser).split("LEFT: ")[1].split("px")[0].to_i
end
def pacman_html(browser)
  browser.div(:id => "actor0").html
end
def score(browser)
  score = []
  for position in 0..9
    score << digit(browser, position)
  end
  score
end
def digit(browser, position)
  if digit_visible?(browser, position)
  px = digit_html(browser, position).split("LEFT: -")[1].split("px")[0]
  (px.to_i - 12)/10
  else
    nil
  end
end
def digit_visible?(browser, position)
  digit_html(browser, position) !~ /TOP: -2px/
end
def digit_html(browser, position)
  browser.div(:id => "pcm-sc-1-#{position}").html
end
def even?(number)
  number % 2 == 0
end

require "rubygems"
require "watir"
browser = Watir::Browser.start "http://www.google.com/pacman/"

# start the game
browser.button(:value => "Insert Coin").click

# move focus to the game
sleep 1
7.times {tab(browser)}

directions = {
  1 => "right",
  2 => "up",
  3 => "left",
  4 => "down"}
previous_direction_number = 0

# pacman is not visible when the game is over, but also when it dies, so do not
# stop until there are not more pacmans left
while pacman_visible?(browser) or pacmans(browser) > 0 do
  # get random number from 1 to 4
  direction_number = 1 + rand(4)

  # decide if you will go in that direction
  next if even?(direction_number) == even?(previous_direction_number)
  next if pacman_vertical_position(browser) == 120 and direction_number == 4
  previous_direction_number = direction_number

  # go to random direction
  direction = directions[direction_number]
  go(browser, direction)
end
