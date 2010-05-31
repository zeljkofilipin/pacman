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
end
