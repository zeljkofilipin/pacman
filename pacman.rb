require "watir"
b = Watir::Browser.start "http://www.google.com/pacman/"

# start the game
b.button(:value => "Insert Coin").click

# move focus to the game
sleep 1
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"

# move in all directions
b.send_keys "{RIGHT}"
sleep 1
b.send_keys "{LEFT}"
sleep 1
b.send_keys "{UP}"
sleep 1
b.send_keys "{DOWN}"
