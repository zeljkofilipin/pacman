require "stuff"

class Position < Stuff
  attr_reader :klass, :coordinates

  def initialize(coordinates, klass)
    super()
    @klass = klass
    @coordinates = coordinates
    @neighbors_names = [:up, :left, :right, :down]
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
    {:up => [left, (top - 8)], :left => [(left - 8), top], :right => [(left + 8), top], :down => [left, (top + 8)]}
  end
  def neighbors
    @neighbors_names.collect do |neighbors_name|
      neighbors_name if @positions[neighbors_coordinates[neighbors_name]]
    end.compact
  end
  def eatable?(html)
    if html =~ /DISPLAY: none/
      false
    else
      true
    end
  end

  # slow, touches browser
  def eatable_neighbors
    eatable = []
    neighbors.each do |neighbor|
      position = Position.new(neighbors_coordinates[neighbor], "fake-klass")
      require "watir"
      eatable << neighbor if position.eatable?($browser.div(:id => position.id).html)
    end
    eatable
  end
end
