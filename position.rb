require "stuff"

class Position < Stuff
  attr_reader :klass, :coordinates

  def initialize(coordinates, klass)
    super()
    @klass = klass
    @coordinates = coordinates
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
  def neighbours_coordinates
    [[left, (top - 8)], [(left - 8), top], [(left + 8), top], [left, (top + 8)]]
  end
  def neighbours_type
    neighbours_coordinates.collect do |coordinates|
      @positions[coordinates][0] if @positions[coordinates]
    end
  end
  def neighbours_empty_or_not
    neighbours_coordinates.collect do |coordinates|
      @positions[coordinates][1] if @positions[coordinates]
    end
  end
  def moves
    moves = []
    moves << :up if neighbours_type[0]
    moves << :left if neighbours_type[1]
    moves << :right if neighbours_type[2]
    moves << :down if neighbours_type[3]
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
