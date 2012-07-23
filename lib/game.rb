class Game
  def initialize
    require "watir-webdriver"

    # open browser and go to google.com/pacman
    $browser = Watir::Browser.start "http://www.google.com/pacman/"

    # insert coin
    $browser.button(:value => "Insert Coin").click

    # move focus to the game (press tab 7 times)
    7.times {$browser.send_keys "{TAB}"}

    # move pacman
    require_relative "pacman"
    pacman = Pacman.new($browser.div(:id => "actor0").html)
    while true do
      pacman.move
      pacman.new_coordinates
    end
  end
end
