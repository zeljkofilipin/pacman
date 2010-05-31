require "position"

describe Position do
  before(:each) do
    @position = Position.new
    @position_html = "\r\n<DIV class=pcm-d id=pcm-d8-40 style=\"LEFT: 8px; TOP: 8px\"></DIV>"
  end

  it "should extract it's class from it's HTML" do
    @position.extract_class_from_html(@position_html).should == "pcm-d"
  end
  it "should extract it's left position from it's HTML" do
    @position.extract_position_from_html(@position_html, "LEFT: ").should == 8
  end
end
