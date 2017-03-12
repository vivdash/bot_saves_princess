require_relative '../lib/save_princess.rb'
require_relative '../lib/battle_field.rb'
require 'rspec'
require 'stringio'

module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

describe "BotSavesPrincess" do

  puts "test_should_accept_integer_only"
  it "test_should_accept_integer_only" do
    bf = BattleField.new
    bf.size = "test"
    expect(bf.validate_size).to eq("Please enter integer only. Try again!")
  end

  puts "test_should_accept_integer_from_3_to_100_only"
  it "test_should_accept_integer_from_3_to_100_only" do
    battle_field = BattleField.new
    battle_field.size = 140
    expect(battle_field.validate_size).to eq("Enter Odd Number Only between 3 and 100. Try again!")
  end

 puts "test_should_validate_bot_and_princess_postion"
  it "test_should_validate_bot_and_princess_postion" do
    battle_field = BattleField.new
    battle_field.size = 3
    battle_field.grid = ["---",
                         "-m-",
                         "--p"]
    expect(battle_field.validate).to eq(nil)
  end

  puts "test_passed_for_3_x_3_grid"
  it "test_display_path_to_princess_can_output_path_for_3_x_3_grid" do
    out = capture_stdout do
      grid = ["---",
              "-m-",
              "--p"]
      bot_saves_princess = SavePrincess.new( 3, grid )
      bot_saves_princess.display_path_to_princess
    end
    expect("RIGHT\nDOWN\n").to eq(out.string)
  end

  puts "test_passed_for_5_x_5_grid"
  it "test_display_path_to_princess_can_output_path_for_5_x_5_grid" do
    out = capture_stdout do

      grid = ["-----",
              "-----",
              "--m--",
              "-----",
              "p----"]

      bot_saves_princess = SavePrincess.new( 5, grid )
      bot_saves_princess.display_path_to_princess
    end
    expect("LEFT\nDOWN\nLEFT\nDOWN\n").to eq(out.string)
  end

  puts "test_passed_for_7_x_7_grid"
  it "test_display_path_to_princess_can_output_path_for_7_x_7_grid" do
    out = capture_stdout do

      grid = ["------p",
              "-------",
              "-------",
              "---m---",
              "-------",
              "-------",
              "-------"]

      bot_saves_princess = SavePrincess.new( 7, grid )
      bot_saves_princess.display_path_to_princess
    end
    expect("RIGHT\nUP\nRIGHT\nUP\nRIGHT\nUP\n").to eq(out.string)
  end
end
