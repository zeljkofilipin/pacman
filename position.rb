class Position
  def initialize(html)
    @html = html
  end
  def extract_class_from_html
    @html.split("=")[1].split(" ")[0]
  end
  def extract_position_from_html(position)
    @html.split(position)[1].split("px")[0].to_i
  end
end
