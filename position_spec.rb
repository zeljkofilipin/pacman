require "position"

describe Position do
  before(:each) do
    @position = Position.new("\r\n<DIV class=pcm-d id=pcm-d32-40 style=\"LEFT: 8px; TOP: 32px\"></DIV>")
  end

  it "should extract it's class from it's HTML" do
    @position.klass.should == "pcm-d"
  end
  it "should extract it's left coordinate from it's HTML" do
    @position.coordinate("LEFT: ").should == 8
    @position.left.should == 8
  end
  it "should extract it's top coordinate from it's HTML" do
    @position.coordinate("TOP: ").should == 32
    @position.top.should == 32
  end
  it "should extract it's coordinates from it's HTML" do
    @position.coordinates.should == [8, 32]
  end
  it "should calculate it's id from it's left and top position" do
    @position.id.should == "pcm-d32-40"
  end
  it "should know it's neighbors coordinates" do
    @position.neighbours_coordinates.should == [[8, 24], [0, 32], [16, 32], [8, 40]]
  end
  it "should know it's neighbors type" do
    @position.neighbours_type.should == ["pcm-e", nil, "pcm-d", nil]
  end
  it "should know it's moves" do
     @position.moves.should == [:up, :right]
  end
end
