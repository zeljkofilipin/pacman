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
    positions =
      {[8, 8] => 'pcm-d',
      [16, 8] => 'pcm-d',
      [24, 8] => 'pcm-d',
      [32, 8] => 'pcm-d',
      [40, 8] => 'pcm-d',
      [48, 8] => 'pcm-d',
      [56, 8] => 'pcm-d',
      [64, 8] => 'pcm-d',
      [72, 8] => 'pcm-d',
      [80, 8] => 'pcm-d',
      [88, 8] => 'pcm-d',
      [96, 8] => 'pcm-d',
      [104, 8] => 'pcm-d',
      [112, 8] => 'pcm-d',
      [120, 8] => 'pcm-d',
      [128, 8] => 'pcm-d',
      [136, 8] => 'pcm-d',
      [144, 8] => 'pcm-d',
      [152, 8] => 'pcm-d',
      [160, 8] => 'pcm-d',
      [168, 8] => 'pcm-d',
      [176, 8] => 'pcm-d',
      [184, 8] => 'pcm-d',
      [192, 8] => 'pcm-d',
      [200, 8] => 'pcm-d',
      [208, 8] => 'pcm-d',
      [216, 8] => 'pcm-d',
      [224, 8] => 'pcm-d',
      [232, 8] => 'pcm-d',
      [240, 8] => 'pcm-d',
      [248, 8] => 'pcm-d',
      [256, 8] => 'pcm-d',
      [264, 8] => 'pcm-d',
      [272, 8] => 'pcm-d',
      [280, 8] => 'pcm-d',
      [288, 8] => 'pcm-d',
      [296, 8] => 'pcm-d',
      [304, 8] => 'pcm-d',
      [312, 8] => 'pcm-d',
      [320, 8] => 'pcm-d',
      [328, 8] => 'pcm-d',
      [336, 8] => 'pcm-d',
      [344, 8] => 'pcm-d',
      [352, 8] => 'pcm-d',
      [360, 8] => 'pcm-d',
      [368, 8] => 'pcm-d',
      [376, 8] => 'pcm-d',
      [384, 8] => 'pcm-d',
      [392, 8] => 'pcm-d',
      [400, 8] => 'pcm-d',
      [408, 8] => 'pcm-d',
      [416, 8] => 'pcm-d',
      [424, 8] => 'pcm-d',
      [432, 8] => 'pcm-d',
      [440, 8] => 'pcm-d',
      [448, 8] => 'pcm-d',
      [8, 16] => 'pcm-d',
      [40, 16] => 'pcm-d',
      [120, 16] => 'pcm-d',
      [248, 16] => 'pcm-d',
      [352, 16] => 'pcm-d',
      [400, 16] => 'pcm-d',
      [448, 16] => 'pcm-d',
      [8, 24] => 'pcm-e',
      [40, 24] => 'pcm-d',
      [120, 24] => 'pcm-d',
      [248, 24] => 'pcm-d',
      [352, 24] => 'pcm-d',
      [400, 24] => 'pcm-d',
      [448, 24] => 'pcm-e',
      [8, 32] => 'pcm-d',
      [16, 32] => 'pcm-d',
      [24, 32] => 'pcm-d',
      [32, 32] => 'pcm-d',
      [40, 32] => 'pcm-d',
      [120, 32] => 'pcm-d',
      [128, 32] => 'pcm-d',
      [136, 32] => 'pcm-d',
      [144, 32] => 'pcm-d',
      [152, 32] => 'pcm-d',
      [160, 32] => 'pcm-d',
      [168, 32] => 'pcm-d',
      [176, 32] => 'pcm-d',
      [184, 32] => 'pcm-d',
      [192, 32] => 'pcm-d',
      [200, 32] => 'pcm-d',
      [208, 32] => 'pcm-d',
      [216, 32] => 'pcm-d',
      [224, 32] => 'pcm-d',
      [232, 32] => 'pcm-d',
      [240, 32] => 'pcm-d',
      [248, 32] => 'pcm-d',
      [352, 32] => 'pcm-d',
      [360, 32] => 'pcm-d',
      [368, 32] => 'pcm-d',
      [376, 32] => 'pcm-d',
      [384, 32] => 'pcm-d',
      [392, 32] => 'pcm-d',
      [400, 32] => 'pcm-d',
      [408, 32] => 'pcm-d',
      [416, 32] => 'pcm-d',
      [424, 32] => 'pcm-d',
      [432, 32] => 'pcm-d',
      [440, 32] => 'pcm-d',
      [448, 32] => 'pcm-d',
      [40, 40] => 'pcm-d',
      [72, 40] => 'pcm-d',
      [80, 40] => 'pcm-d',
      [88, 40] => 'pcm-d',
      [96, 40] => 'pcm-d',
      [104, 40] => 'pcm-d',
      [112, 40] => 'pcm-d',
      [120, 40] => 'pcm-d',
      [184, 40] => 'pcm-d',
      [352, 40] => 'pcm-d',
      [416, 40] => 'pcm-d',
      [40, 48] => 'pcm-d',
      [72, 48] => 'pcm-d',
      [120, 48] => 'pcm-d',
      [184, 48] => 'pcm-d',
      [352, 48] => 'pcm-d',
      [416, 48] => 'pcm-d',
      [40, 56] => 'pcm-d',
      [72, 56] => 'pcm-d',
      [120, 56] => 'pcm-d',
      [184, 56] => 'pcm-d',
      [352, 56] => 'pcm-d',
      [416, 56] => 'pcm-d',
      [40, 64] => 'pcm-d',
      [72, 64] => 'pcm-d',
      [80, 64] => 'pcm-d',
      [88, 64] => 'pcm-e',
      [120, 64] => 'pcm-d',
      [184, 64] => 'pcm-d',
      [352, 64] => 'pcm-d',
      [416, 64] => 'pcm-d',
      [40, 72] => 'pcm-d',
      [120, 72] => 'pcm-d',
      [184, 72] => 'pcm-d',
      [352, 72] => 'pcm-d',
      [384, 72] => 'pcm-d',
      [392, 72] => 'pcm-d',
      [400, 72] => 'pcm-d',
      [408, 72] => 'pcm-d',
      [416, 72] => 'pcm-d',
      [40, 80] => 'pcm-d',
      [120, 80] => 'pcm-d',
      [184, 80] => 'pcm-d',
      [352, 80] => 'pcm-d',
      [416, 80] => 'pcm-d',
      [40, 88] => 'pcm-d',
      [120, 88] => 'pcm-d',
      [184, 88] => 'pcm-d',
      [352, 88] => 'pcm-d',
      [416, 88] => 'pcm-d',
      [8, 96] => 'pcm-d',
      [16, 96] => 'pcm-d',
      [24, 96] => 'pcm-d',
      [32, 96] => 'pcm-d',
      [40, 96] => 'pcm-d',
      [48, 96] => 'pcm-d',
      [56, 96] => 'pcm-d',
      [64, 96] => 'pcm-d',
      [72, 96] => 'pcm-d',
      [80, 96] => 'pcm-d',
      [88, 96] => 'pcm-d',
      [96, 96] => 'pcm-d',
      [104, 96] => 'pcm-d',
      [112, 96] => 'pcm-d',
      [120, 96] => 'pcm-d',
      [128, 96] => 'pcm-d',
      [136, 96] => 'pcm-d',
      [144, 96] => 'pcm-d',
      [152, 96] => 'pcm-d',
      [160, 96] => 'pcm-d',
      [168, 96] => 'pcm-d',
      [176, 96] => 'pcm-d',
      [184, 96] => 'pcm-d',
      [192, 96] => 'pcm-d',
      [200, 96] => 'pcm-d',
      [208, 96] => 'pcm-d',
      [216, 96] => 'pcm-d',
      [224, 96] => 'pcm-d',
      [232, 96] => 'pcm-d',
      [240, 96] => 'pcm-d',
      [248, 96] => 'pcm-d',
      [320, 96] => 'pcm-d',
      [328, 96] => 'pcm-d',
      [336, 96] => 'pcm-d',
      [344, 96] => 'pcm-d',
      [352, 96] => 'pcm-d',
      [360, 96] => 'pcm-d',
      [368, 96] => 'pcm-d',
      [376, 96] => 'pcm-d',
      [384, 96] => 'pcm-d',
      [392, 96] => 'pcm-d',
      [400, 96] => 'pcm-d',
      [408, 96] => 'pcm-d',
      [416, 96] => 'pcm-d',
      [424, 96] => 'pcm-d',
      [432, 96] => 'pcm-d',
      [440, 96] => 'pcm-d',
      [448, 96] => 'pcm-d',
      [8, 104] => 'pcm-d',
      [48, 104] => 'pcm-d',
      [136, 104] => 'pcm-d',
      [160, 104] => 'pcm-d',
      [248, 104] => 'pcm-d',
      [256, 104] => 'pcm-d',
      [264, 104] => 'pcm-d',
      [272, 104] => 'pcm-d',
      [296, 104] => 'pcm-d',
      [304, 104] => 'pcm-d',
      [312, 104] => 'pcm-d',
      [320, 104] => 'pcm-d',
      [400, 104] => 'pcm-d',
      [448, 104] => 'pcm-d',
      [8, 112] => 'pcm-d',
      [48, 112] => 'pcm-d',
      [136, 112] => 'pcm-d',
      [160, 112] => 'pcm-d',
      [248, 112] => 'pcm-d',
      [272, 112] => 'pcm-d',
      [296, 112] => 'pcm-d',
      [320, 112] => 'pcm-d',
      [400, 112] => 'pcm-d',
      [448, 112] => 'pcm-d',
      [8, 120] => 'pcm-e',
      [16, 120] => 'pcm-d',
      [24, 120] => 'pcm-d',
      [32, 120] => 'pcm-d',
      [40, 120] => 'pcm-d',
      [48, 120] => 'pcm-d',
      [56, 120] => 'pcm-d',
      [64, 120] => 'pcm-d',
      [72, 120] => 'pcm-d',
      [80, 120] => 'pcm-d',
      [88, 120] => 'pcm-d',
      [96, 120] => 'pcm-d',
      [104, 120] => 'pcm-d',
      [112, 120] => 'pcm-d',
      [120, 120] => 'pcm-d',
      [128, 120] => 'pcm-d',
      [136, 120] => 'pcm-d',
      [160, 120] => 'pcm-d',
      [168, 120] => 'pcm-d',
      [176, 120] => 'pcm-d',
      [184, 120] => 'pcm-d',
      [192, 120] => 'pcm-d',
      [200, 120] => 'pcm-d',
      [208, 120] => 'pcm-d',
      [216, 120] => 'pcm-d',
      [224, 120] => 'pcm-d',
      [232, 120] => 'pcm-d',
      [240, 120] => 'pcm-d',
      [248, 120] => 'pcm-d',
      [272, 120] => 'pcm-d',
      [296, 120] => 'pcm-d',
      [320, 120] => 'pcm-d',
      [328, 120] => 'pcm-d',
      [336, 120] => 'pcm-d',
      [344, 120] => 'pcm-d',
      [352, 120] => 'pcm-d',
      [360, 120] => 'pcm-d',
      [368, 120] => 'pcm-d',
      [376, 120] => 'pcm-d',
      [384, 120] => 'pcm-d',
      [392, 120] => 'pcm-d',
      [400, 120] => 'pcm-d',
      [408, 120] => 'pcm-d',
      [416, 120] => 'pcm-d',
      [424, 120] => 'pcm-d',
      [432, 120] => 'pcm-d',
      [440, 120] => 'pcm-d',
      [448, 120] => 'pcm-e',
      [280, 80] => 'pcm-f'}

    @position.neighbours_type(positions).should == ["pcm-e", nil, "pcm-d", nil]
  end
end
