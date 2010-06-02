require "position"

describe Position do
  before(:each) do
    @position = Position.new([8, 32], "pcm-d")
  end

  it "should know it's class" do
    @position.klass.should == "pcm-d"
  end
  it "should know it's left coordinate" do
    @position.left.should == 8
  end
  it "should know it's top coordinate" do
    @position.top.should == 32
  end
  it "should know it's coordinates" do
    @position.coordinates.should == [8, 32]
  end
  it "should know it's id" do
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
  it "should know is it empty" do
    html = "\r\n<DIV class=pcm-d id=pcm-d32-40 style=\"LEFT: 8px; TOP: 32px\"></DIV>"
    @position.empty?(html).should == false

    html = "\r\n<DIV class=pcm-d id=pcm-d120-304 style=\"DISPLAY: none; LEFT: 272px; TOP: 120px\"></DIV>"
    @position.empty?(html).should == true
  end
end
