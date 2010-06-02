require "stuff"

class Position < Stuff
  attr_reader :klass, :coordinates

  def initialize(coordinates, klass)
    super()
    @klass = klass
    @coordinates = coordinates
    @neighbors_names = [:top, :left, :right, :down]
  end

  def left
    @coordinates[0]
  end
  def top
    @coordinates[1]
  end
  def id
    "pcm-d#{top}-#{left + 32}"
  end
  def neighbors_coordinates
    {:top => [left, (top - 8)], :left => [(left - 8), top], :right => [(left + 8), top], :down => [left, (top + 8)]}
  end
  def neighbors
    neighbors = {}
    @neighbors_names.each do |neighbors_name|
      neighbors[neighbors_name] = @positions[neighbors_coordinates[neighbors_name]] if @positions[neighbors_coordinates[neighbors_name]]
    end
    neighbors
  end
  def neighbors_empty_or_not
    neighbors_coordinates.collect do |coordinates|
      @positions[coordinates][1] if @positions[coordinates]
    end
  end
  def nonempty_moves
    moves = []
    moves << :up if neighbors_empty_or_not[0] == false
    moves << :left if neighbors_empty_or_not[1] == false
    moves << :right if neighbors_empty_or_not[2] == false
    moves << :down if neighbors_empty_or_not[3] == false
    moves
  end
  def moves
    moves = []
    moves << :up if neighbors_type[0]
    moves << :left if neighbors_type[1]
    moves << :right if neighbors_type[2]
    moves << :down if neighbors_type[3]
    moves
  end
  def empty?(html)
    if html =~ /DISPLAY: none/
      true
    else
      false
    end
  end
end
