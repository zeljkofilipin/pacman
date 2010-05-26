require "watir"

b = Watir::Browser.start "http://www.google.com/pacman/"
b.button(:value => "Insert Coin").click
sleep 5
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{TAB}"
b.send_keys "{RIGHT}"
