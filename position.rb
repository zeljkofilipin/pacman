class Position
  def initialize
  end
  def extract_class_from_html(position_html)
    position_html.split("=")[1].split(" ")[0]
  end
  def extract_position_from_html(position_html, position)
    position_html.split(position)[1].split("px")[0].to_i
  end
end
