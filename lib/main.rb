require './battle_field'
require './save_princess'

battle_field = BattleField.new
puts "Enter BattleField size between 3 and 100."
battle_field.size = gets.to_i
battle_field.validate_size

puts "Enter '-', bot and princess position for BattleField."
grid = Array.new(battle_field.size)
(0...battle_field.size).each do |i|
  grid[i] = gets.strip
end

battle_field.grid = grid
battle_field.validate

SavePrincess.new(battle_field.size, battle_field.grid ).display_path_to_princess
