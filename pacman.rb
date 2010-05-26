def tab(browser)
  browser.send_keys "{TAB}"
end
def go(browser, direction)
  puts direction
  browser.send_keys "{#{direction.upcase}}"
end

require "watir"
browser = Watir::Browser.start "http://www.google.com/pacman/"

# start the game
browser.button(:value => "Insert Coin").click

# move focus to the game
sleep 1
7.times {tab(browser)}

# move around randomly
directions = {
  1 => "right",
  2 => "left",
  3 => "up",
  4 => "down"}

1000.times do
  # get random number from 1 to 4
  direction = directions[1 + rand(4)]

  # go to random direction
  go(browser, direction)
end
