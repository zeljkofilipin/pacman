class Pacman
  def initialize(html)
    @html = html
    @left = left
    @top = coordinate("TOP: ")
    @coordinates = coordinates
  end
  def coordinates
    [left,
      coordinate("TOP: ")]
  end
  def coordinate(position)
    @html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
  def left
    coordinate("LEFT: ")
  end
end
