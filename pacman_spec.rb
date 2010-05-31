require "pacman"

describe Pacman do
  before(:each) do
    @pacman = Pacman.new
  end

  it "should extract it's position from it's HTML" do
    pending
    position_html = "\r\n<DIV class=pcm-ac id=actor0 style=\"LEFT: 272px; OVERFLOW: hidden; TOP: 120px\"><IMG style=\"DISPLAY: block; LEFT: -2px; POSITION: relative; TOP: -2px\" src=\"http://www.google.com/logos/pacman10-hp-sprite.png\"></DIV>"
    @pacman.position(position_html).should == [272, 120]
  end
  it "should extract left position from it's HTML" do
    position_html = "\r\n<DIV class=pcm-ac id=actor0 style=\"LEFT: 272px; OVERFLOW: hidden; TOP: 120px\"><IMG style=\"DISPLAY: block; LEFT: -2px; POSITION: relative; TOP: -2px\" src=\"http://www.google.com/logos/pacman10-hp-sprite.png\"></DIV>"
    @pacman.left_position(position_html).should == 272
  end
end

