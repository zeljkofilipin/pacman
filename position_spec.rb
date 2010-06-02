require "position"

describe Position do
  before(:each) do
    @position = Position.new("\r\n<DIV class=pcm-d id=pcm-d32-40 style=\"LEFT: 8px; TOP: 32px\"></DIV>")
  end

  it "should extract it's class from it's HTML" do
    @position.extract_class_from_html.should == "pcm-d"
  end
  it "should extract it's left position from it's HTML" do
    @position.extract_position_from_html("LEFT: ").should == 8
  end
  it "should extract it's top position from it's HTML" do
    @position.extract_position_from_html("TOP: ").should == 32
  end
  it "should calculate it's id from it's left and top position" do
    @position.calculate_id_from_positions.should == "pcm-d32-40"
  end
  it "should know it's neighbors coordinates" do
    @position.neighbours_coordinates.should == [[8, 24], [0, 32], [16, 32], [8, 40]]
  end
  it "should know it's neighbors type" do
    @position.neighbours_type.should == ["pcm-e", nil, "pcm-d", nil]
  end
end
