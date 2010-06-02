class Pacman
  def initialize(html)
    @html = html
    @left = left
    @top = top
    @coordinates = coordinates
  end
  def coordinates
    [left, top]
  end
  def coordinate(position)
    @html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
  def left
    coordinate("LEFT: ")
  end
  def top
    coordinate("TOP: ")
  end
end
