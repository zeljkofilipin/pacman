class Pacman
  def initialize(html)
    @html = html
    @left = coordinate("LEFT: ")
    @top = coordinate("TOP: ")
    @coordinates = coordinates
  end
  def coordinates
    [coordinate("LEFT: "),
      coordinate("TOP: ")]
  end
  def coordinate(position)
    @html.split('"')[1].split(position)[1].split("px")[0].to_i
  end
end
