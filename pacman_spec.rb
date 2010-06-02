require "pacman"

describe Pacman do
  before(:each) do
    @pacman = Pacman.new("\r\n<DIV class=pcm-ac id=actor0 style=\"LEFT: 272px; OVERFLOW: hidden; TOP: 120px\"><IMG style=\"DISPLAY: block; LEFT: -2px; POSITION: relative; TOP: -2px\" src=\"http://www.google.com/logos/pacman10-hp-sprite.png\"></DIV>")
  end

  it "should extract it's position from it's HTML" do
    @pacman.extract_positions_from_html.should == [272, 120]
  end
  it "should extract left position from it's HTML" do
    @pacman.extract_position_from_html("LEFT: ").should == 272
  end
  it "should extract top position from it's HTML" do
    @pacman.extract_position_from_html("TOP: ").should == 120
  end
end

