def tab(b)
  b.send_keys "{TAB}"
end
def right(b)
  b.send_keys "{RIGHT}"
end
def left(b)
  b.send_keys "{LEFT}"
end
def up(b)
  b.send_keys "{UP}"
end
def down(b)
  b.send_keys "{DOWN}"
end

require "watir"
b = Watir::Browser.start "http://www.google.com/pacman/"

# start the game
b.button(:value => "Insert Coin").click

# move focus to the game
sleep 1
7.times {tab(b)}

# move in all directions
right(b)
sleep 1
left(b)
sleep 1
up(b)
sleep 1
down(b)
