def tab(b)
  b.send_keys "{TAB}"
end
def go(b, direction)
  puts direction
  b.send_keys "{#{direction.upcase}}"
end

require "watir"
b = Watir::Browser.start "http://www.google.com/pacman/"

# start the game
b.button(:value => "Insert Coin").click

# move focus to the game
sleep 1
7.times {tab(b)}

# move around randomly
directions = {
  1 => "right",
  2 => "left",
  3 => "up",
  4 => "down"}

100.times do
  # get random number from 1 to 4
  direction = directions[1 + rand(4)]

  # go to random direction
  go(b, direction)
end
