class Pacman
  def initialize
  end
  def position(position_html)
  end
  def left_position(position_html)
    extract_position_from_html(position_html, "LEFT: ")
  end
  def top_position(position_html)
    extract_position_from_html(position_html, "TOP: ")
  end
  def extract_position_from_html(position_html, position)
    position_html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
end
