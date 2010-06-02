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
  def moves
    require "position"
    @position = Position.new(coordinates, "pcm-d").moves
  end

  # no specs
  # touches the browser
  def move(browser)
    if @debug
      puts "#{@step}:coordinates:#{coordinates.inspect}"
      puts "#{@step}:moves      :#{moves.inspect}"
    end
    if moves != []
      new_random_number = random_number(moves.size)
      direction = moves[new_random_number]
      if @debug
        puts "#{@step}:random     :#{new_random_number}"
        puts "#{@step}:direction  :#{direction}"
      end
      browser.send_keys "{#{direction.to_s.upcase}}"
    end
    if @debug
      puts "#{@step}:time       :#{Time.now - @time}"
      puts "#{@step}-------------"
    end
    @step += 1
    @time = Time.now
  end
  def new_coordinates(browser)
    @html = browser.div(:id => "actor0").html
  end
  # random number from 0 to max
  def random_number(max)
    rand(max)
  end
end
