require "stuff"

class Position < Stuff
  def initialize(html)
    super
    @id = id
    @class = klass
    @neighbours_coordinates = neighbours_coordinates
    @neighbours_type = neighbours_type
  end
  def klass
    @html.split("=")[1].split(" ")[0]
  end
  def id
    "pcm-d#{top}-#{left + 32}"
  end
  def neighbours_coordinates
    [[left, (top - 8)], [(left - 8), top], [(left + 8), top], [left, (top + 8)]]
  end
  def neighbours_type
    @neighbours_coordinates.collect do |coordinates|
      @positions[coordinates]
    end
  end
  def moves
    moves = []
    moves << :up if @neighbours_type[0]
    moves << :left if @neighbours_type[1]
    moves << :right if @neighbours_type[2]
    moves << :down if @neighbours_type[3]
    moves
  end
end
