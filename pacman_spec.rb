require "pacman"

describe Pacman do
  before(:each) do
    @pacman = Pacman.new("\r\n<DIV class=pcm-ac id=actor0 style=\"LEFT: 272px; OVERFLOW: hidden; TOP: 120px\"><IMG style=\"DISPLAY: block; LEFT: -2px; POSITION: relative; TOP: -2px\" src=\"http://www.google.com/logos/pacman10-hp-sprite.png\"></DIV>")
  end

  it "should extract it's coordinates from it's HTML" do
    @pacman.coordinates.should == [272, 120]
  end
  it "should extract left coordinate from it's HTML" do
    @pacman.coordinate("LEFT: ").should == 272
    @pacman.left.should == 272
  end
  it "should extract top coordinate from it's HTML" do
    @pacman.coordinate("TOP: ").should == 120
  end
end
