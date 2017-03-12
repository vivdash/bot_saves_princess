class BattleField
  attr_accessor :size, :grid

  def validate_size
    unless size.is_a? Numeric
      puts "Please enter integer only. Try again!"
      abort
    end
    if size.even? || !size.between?(2, 100)
      puts "Enter Odd Number Only between 3 and 100. Try again!"
      abort
    end
  end

  def validate
    center = (size) / 2
    if value(center, center) != "m"
      puts "m should be at the center of Battle Field. Try again!"
      abort
    end

    if corners.count("p") != 1
      puts "p should be at the corner of grid. Try again!"
      abort
    end

    all_battle_values = []

    (0...size).each do |x|
      (0...size).each do |y|
        all_battle_values <<  value(x, y)
      end
    end
    dash_count = all_battle_values.count("-")
    if dash_count != (size * size - 2)
      puts "Please Enter only - in blank values Battle Field. Try again!"
      abort
    end
  end

  def value(x, y)
    grid[x].split("")[y]
  end

  def corners
    max_corner = size - 1
    [
      value(0, 0), value(0, max_corner),
      value(max_corner, 0), value(max_corner, max_corner)
    ]
  end
end
