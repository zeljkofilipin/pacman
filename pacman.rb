class Pacman
  def initialize
  end
  def position(position_html)
  end
  def left_position(position_html)
    position_html.split('"')[1].split("LEFT: ")[1].split("px")[0].to_i
  end
  def top_position(position_html)
    position_html.split('"')[1].split("TOP: ")[1].split("px")[0].to_i
  end
end
