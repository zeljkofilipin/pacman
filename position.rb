class Position
  def initialize(html)
    @html = html
    @left = extract_position_from_html("LEFT: ")
    @top = extract_position_from_html("TOP: ")
    @id = calculate_id_from_positions
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
end
