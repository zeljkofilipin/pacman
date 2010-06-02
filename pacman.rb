class Pacman
  def initialize(html)
    @html = html
    @left = position("LEFT: ")
    @top = position("TOP: ")
    @coordinates = coordinates
  end
  def coordinates
    [position("LEFT: "),
      position("TOP: ")]
  end
  def position(position)
    @html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
end
