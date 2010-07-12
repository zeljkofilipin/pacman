require "stuff"

class Pacman < Stuff
  def initialize(html)
    super()
    @html = html
    @debug = true
    @step = 0
    @time = Time.now
  end
  def coordinate(position)
    @html.split(position)[1].split("px")[0].to_i
  end
  def left
    coordinate("left: ")
  end
  def top
    coordinate("top: ")
  end
  def coordinates
    [left, top]
  end
  def on_position
    true if @positions[coordinates]
  end
  def moves
    require "position"
    @position = Position.new(coordinates, "fake-klass").neighbors
  end
  def yummy_moves
    require "position"
    @position = Position.new(coordinates, "fake-klass").eatable_neighbors
  end

  # no specs
  # touches the browser
  def move
    if @debug
      puts "#{@step}:coordinates:#{coordinates.inspect}"
      puts "#{@step}:moves      :#{moves.inspect}"
      puts "#{@step}:yummy moves:#{yummy_moves.inspect}"
    end
    
    # there will be no moves if you are not exactly on a position
    if moves != []
      if yummy_moves != []
        direction = yummy_moves[0]
      else
        new_random_number = random_number(moves.size)
        direction = moves[new_random_number]
        puts "#{@step}:random     :#{new_random_number}" if @debug
      end
      puts "#{@step}:direction  :#{direction.inspect}" if @debug

      # move!
      $browser.span(:id => "main").send_keys direction
    end
    if @debug
      puts "#{@step}:time       :#{Time.now - @time}"
      puts "#{@step}-------------"
    end
    @step += 1
    @time = Time.now
  end
  def new_coordinates
    @html = $browser.div(:id => "actor0").html
  end
  # random number from 0 to max
  def random_number(max)
    rand(max)
  end
end
