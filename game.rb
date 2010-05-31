class Game
  def initialize
    # require rubygems and watir
    require "rubygems"
    require "watir"

    # open browser and go to google.com/pacman
    @browser = Watir::Browser.start "http://www.google.com/pacman/"

    # insert coin
    @browser.button(:value => "Insert Coin").click

    # move focus to the game (press tab 7 times)
    7.times {@browser.send_keys "{TAB}"}
  end
end
