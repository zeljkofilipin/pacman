def tab(browser)
  browser.send_keys "{TAB}"
end
def go(browser, direction)
  output(direction)
  browser.send_keys "{#{direction.upcase}}"
end
def output(direction)
  puts ">#{direction}"
end
def pacmans(browser)
  browser.div(:id => "pcm-li").divs.size
end
def pacman_visible?(browser)
  pacman_html(browser) !~ /LEFT: -62px/
end
def pacman_vertical_position(browser) # 8-top, 120-bottom
  pacman_html(browser).split("TOP: ")[1].split("px")[0].to_i
end
def pacman_horizontal_position(browser) # 8-left, 448-right
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
def move_away_from_default_position(browser)
  puts "*moving away from default position"

  directions = {
  1 => "right",
  2 => "left"}

  # get random number from 1 to 2
  direction_number = 1 + rand(2)
  direction = directions[direction_number]

  go(browser, direction)
  go(browser, "up")
  go(browser, direction)
  go(browser, "up")
end
def at_default_positions?(horizontal, vertical)
  (horizontal == 272 or horizontal == 296) and vertical == 120
end

require "rubygems"
require "watir"

while true do
  puts "========================="
  puts "new game"
  puts "========================="
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
    horizontal = pacman_horizontal_position(browser)
    vertical = pacman_vertical_position(browser)

    move_away_from_default_position(browser) if at_default_positions?(horizontal, vertical)

    # get random number from 1 to 4
    direction_number = 1 + rand(4)
    direction = directions[direction_number]
    previous_direction = directions[previous_direction_number]

    puts "!at the top" if vertical == 4
    puts "!at the bottom" if vertical == 120

    if vertical == 120 and direction_number == 4
      puts "-already down"
      next
    end
    if vertical == 8 and direction_number == 2
      puts "-already up"
      next
    end

    puts "!at the far left" if horizontal == 8
    puts "!at the far right" if horizontal == 448

    if horizontal == 8 and direction_number == 3
      puts "-already left"
      next
    end
    if horizontal == 448 and direction_number == 1
      puts "-already right"
      next
    end

    if direction_number == previous_direction_number
      puts "-already going #{direction}"
      next
    end
    if even?(direction_number) == even?(previous_direction_number)
      puts "-will not go #{direction} because I am going #{previous_direction}"
      next
    end

    previous_direction_number = direction_number

    # go to random direction
    go(browser, direction)
  end

  puts "========================="
  puts "score: #{score(browser)}"
  puts "========================="

  browser.close
end