require "stuff"

class Pacman < Stuff
  def on_position
    true if @positions[coordinates]
  end
end
