require "pacman"

describe Pacman do
  before(:each) do
    @pacman = Pacman.new("<div xmlns=\"http://www.w3.org/1999/xhtml\" class=\"pcm-ac\" id=\"actor0\" style=\"background-image: url(&quot;http://www.google.com/logos/pacman10-hp-sprite-2.png&quot;); background-position: -2px -2px; background-repeat: no-repeat; left: 272px; top: 120px;\"></div>")
  end

  it "should extract it's coordinates from it's HTML" do
    @pacman.coordinates.should == [272, 120]
  end
  it "should extract left coordinate from it's HTML" do
    @pacman.coordinate("left: ").should == 272
    @pacman.left.should == 272
  end
  it "should extract top coordinate from it's HTML" do
    @pacman.coordinate("top: ").should == 120
    @pacman.top.should == 120
  end
  it "should know is it located on a position" do
    @pacman.on_position.should == true
  end
  it "should know it's moves" do
    @pacman.moves.should == [:up]
  end

  # slow, touches browser
  it "should know it's yummy moves" do
    @pacman.yummy_moves.should == [:up]
  end
end
