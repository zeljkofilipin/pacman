class Position
  def initialize
  end
  def extract_class_from_html(position_html)
    position_html.split("=")[1].split(" ")[0]
  end
end
