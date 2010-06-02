class Pacman
  def initialize(html)
    @html = html
    @left = extract_position_from_html("LEFT: ")
    @top = extract_position_from_html("TOP: ")
  end
  def extract_positions_from_html
    [extract_position_from_html("LEFT: "),
      extract_position_from_html("TOP: ")]
  end
  def extract_position_from_html(position)
    @html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
end
