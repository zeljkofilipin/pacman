def go(browser, direction)
  output(direction)
  browser.send_keys direction.to_sym
end
def output(direction)
  puts ">#{direction}"
end
def pacmans(browser)
  browser.div(:id => "pcm-li").divs.size
end
def pacman_visible?(browser)
  pacman_html(browser) !~ /left: -62px/
end
def pacman_vertical_position(browser) # 8-top, 120-bottom
  pacman_html(browser).split("top: ")[1].split("px")[0].to_i
end
def pacman_horizontal_position(browser) # 8-left, 448-right
  pacman_html(browser).split("left: ")[1].split("px")[0].to_i
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
  px = digit_html(browser, position).split("left: -")[1].split("px")[0]
  (px.to_i - 12)/10
  else
    nil
  end
end
def digit_visible?(browser, position)
  digit_html(browser, position) !~ /top: -2px/
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

  direction_number = return_1_or_2
  direction = directions[direction_number]

  go(browser, direction)
  go(browser, "up")
  go(browser, direction)
  go(browser, "up")
end
# get random number from 1 to 2
def return_1_or_2
  1 + rand(2)
end
def at_default_positions?(horizontal, vertical)
  (horizontal == 272 or horizontal == 296) and at_bottom?(vertical)
end
def at_top?(vertical)
  vertical == 8
end
def at_bottom?(vertical)
  vertical == 120
end
def at_far_left?(horizontal)
  horizontal == 8
end
def at_far_right?(horizontal)
  horizontal == 448
end
def move_away_from_corner(browser, horizontal, vertical)
  puts "*moving away from corner"

  direction_number = return_1_or_2

  if at_top_left?(horizontal, vertical)
    puts "!top left"
    directions = {1 => "right", 2 => "down"}
  end
  if at_top_right?(horizontal, vertical)
    puts "!top right"
    directions = {1 => "left",  2 => "down"}
  end
  if at_bottom_left?(horizontal, vertical)
    puts "!bottom left"
    directions = {1 => "right", 2 => "up"}
  end
  if at_bottom_right?(horizontal, vertical)
    puts "!bottom right"
    directions = {1 => "left",  2 => "up"}
  end

  direction = directions[direction_number]
  go(browser, direction)
end
def in_the_corner?(horizontal, vertical)
  at_top_left?(horizontal, vertical) or
    at_top_right?(horizontal, vertical) or
    at_bottom_left?(horizontal, vertical) or
    at_bottom_right?(horizontal, vertical)
end
def at_top_left?(horizontal, vertical)
  at_top?(vertical) and at_far_left?(horizontal)
end
def at_top_right?(horizontal, vertical)
  at_top?(vertical) and at_far_right?(horizontal)
end
def at_bottom_left?(horizontal, vertical)
  at_bottom?(vertical) and at_far_left?(horizontal)
end
def at_bottom_right?(horizontal, vertical)
  at_bottom?(vertical) and at_far_right?(horizontal)
end
def moving?(previous_horizontal, horizontal, previous_vertical, vertical)
  (previous_horizontal != horizontal) or (previous_vertical != vertical)
end
def play
  require "watir-webdriver"

  while true do
    puts "========================="
    puts "new game"
    puts "========================="
    browser = Watir::Browser.start "http://www.google.com/pacman/"


    directions = {
        1 => "right",
        2 => "up",
        3 => "left",
        4 => "down"}

    # initialize fake stuff from previous step (that does not exist yet)
    previous_direction_number = 0
    previous_horizontal = 0
    previous_vertical = 0

    # pacman is not visible when the game is over, but also when it dies, so do not
    # stop until there are not more pacmans left
    while pacman_visible?(browser) or pacmans(browser) > 0 do
      horizontal = pacman_horizontal_position(browser)
      vertical = pacman_vertical_position(browser)

      move_away_from_default_position(browser) if at_default_positions?(horizontal, vertical)

      move_away_from_corner(browser, horizontal, vertical) if in_the_corner?(horizontal, vertical)

      # get random number from 1 to 4
      direction_number = 1 + rand(4)
      direction = directions[direction_number]
      previous_direction = directions[previous_direction_number]

      next if at_bottom?(vertical) and direction == "down"
      next if at_top?(vertical) and direction == "up"
      next if at_far_left?(horizontal) and direction == "left"
      next if at_far_right?(horizontal) and direction == "right"

      if moving?(previous_horizontal, horizontal, previous_vertical, vertical)
        next if direction == previous_direction

        # to grab more pills, do not go in opposite direction of the current one
        # horizontal directions are odd numbers, vertical are even
        # check if previous and current direction are both odd or even
        next if even?(direction_number) == even?(previous_direction_number)
      else
        puts "!not moving"
      end

      # remember stuff from previous step
      previous_horizontal = horizontal
      previous_vertical = vertical
      previous_direction_number = direction_number

      # go to direction
      go(browser, direction)
    end
    browser.close
  end
end

play
