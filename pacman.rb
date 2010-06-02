require "stuff"

class Pacman < Stuff
  def initialize(html)
    super()
    @html = html
  end
  def coordinate(position)
    @html.split(position)[1].split("px")[0].to_i
  end
  def left
    coordinate("LEFT: ")
  end
  def top
    coordinate("TOP: ")
  end
  def coordinates
    [left, top]
  end
  def on_position
    true if @positions[coordinates]
  end
end
