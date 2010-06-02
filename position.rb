class Position
  def initialize(html)
    @html = html
    @left = extract_position_from_html("LEFT: ")
    @top = extract_position_from_html("TOP: ")
    @id = calculate_id_from_positions
    @class = extract_class_from_html
    @neighbours_coordinates = neighbours_coordinates
  end
  def extract_class_from_html
    @html.split("=")[1].split(" ")[0]
  end
  def extract_position_from_html(position)
    @html.split(position)[1].split("px")[0].to_i
  end
  def calculate_id_from_positions
    "pcm-d#{@top}-#{@left + 32}"
  end
  def neighbours_coordinates
    [[@left, (@top - 8)], [(@left - 8), @top], [(@left + 8), @top], [@left, (@top + 8)]]
  end
  def neighbours_type(positions)
    @neighbours_coordinates.collect do |coordinates|
      positions[coordinates]
    end
  end
end
