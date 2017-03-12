class SavePrincess

  attr_reader :n, :grid

  def initialize(n, grid)
    @n    = n
    @grid = grid
  end

  def display_path_to_princess
    bot_x_pos = bot_y_pos = princess_x_pos = princess_y_pos = -1

    (0...n).each do |i|
      if grid[i].index('p') != nil
        princess_y_pos = i
        princess_x_pos = grid[i].index('p')
      end
      if grid[i].index('m') != nil
        bot_y_pos = i
        bot_x_pos = grid[i].index('m')
      end
    end

    while((bot_x_pos != princess_x_pos) || (bot_y_pos != princess_y_pos))
      if bot_x_pos > princess_x_pos
        bot_x_pos -= 1
        puts "LEFT"
      elsif bot_x_pos < princess_x_pos
        bot_x_pos += 1
        puts "RIGHT"
      end
      if bot_y_pos > princess_y_pos
        bot_y_pos -= 1
        puts "UP"
      elsif bot_y_pos < princess_y_pos
        bot_y_pos +=1
        puts "DOWN"
      end
    end
  end
end
