class Pacman
  def initialize
  end
  def extract_positions_from_html(position_html)
    [extract_position_from_html(position_html, "LEFT: "),
      extract_position_from_html(position_html, "TOP: ")]
  end
  def extract_position_from_html(position_html, position)
    position_html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
end
