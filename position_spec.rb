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
    @position.neighbors_coordinates.should == {:top => [8, 24], :left => [0, 32], :right => [16, 32], :down => [8, 40]}
  end
  it "should know it's neighbors" do
    @position.neighbors.should == {:top => "pcm-e", :right => "pcm-d"}
  end
  it "should know if it's neighbors are empty or not" do
    pending
    @position.neighbors_empty_or_not.should == [false, nil, false, nil]
  end
  it "should know it's moves" do
    pending
    @position.moves.should == [:up, :right]
  end
  it "should know it's nonempty moves" do
    pending
    @position.nonempty_moves.should == [:up, :right]
  end
  it "should know is it empty" do
    html = "\r\n<DIV class=pcm-d id=pcm-d32-40 style=\"LEFT: 8px; TOP: 32px\"></DIV>"
    @position.empty?(html).should == false

    html = "\r\n<DIV class=pcm-d id=pcm-d120-304 style=\"DISPLAY: none; LEFT: 272px; TOP: 120px\"></DIV>"
    @position.empty?(html).should == true
  end
end
