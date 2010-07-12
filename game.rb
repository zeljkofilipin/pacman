class Game
  def initialize
    # require rubygems and watir
    require "rubygems"
    require "watir-webdriver"

    # open browser and go to google.com/pacman
    $browser = Watir::Browser.start "http://www.google.com/pacman/"

    # insert coin
    $browser.button(:value => "Insert Coin").click
    sleep 10

    # move pacman
    require "pacman"
    pacman = Pacman.new($browser.div(:id => "actor0").html)
    while true do
      pacman.move
      pacman.new_coordinates
    end
  end
end
