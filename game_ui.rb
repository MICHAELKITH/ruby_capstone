require_relative 'game'
require 'date'
require 'json'
require 'fileutils'

class GameUserInterface
  FILE_LOCATION = 'data/games.json'.freeze
  attr_accessor :games

  def initialize
    @games = load
  end

  def load
    if File.directory?('data') && File.file?(FILE_LOCATION)

      File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))

    elsif File.directory?('data') && !File.exist?(FILE_LOCATION)
      FileUtils.touch(FILE_LOCATION)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_LOCATION)
      []
    end
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@games))
  end

  def create_instance_of_game
    games = []
    @games.each do |game|
      games << Game.new(game['name'], game['publish_date'], game['last_played_at'], game['multiplayer'])
    end
    games
  end

  def list_all_games
    puts 'No games created' if @games.empty?
    @games.each_with_index do |game, index|
      puts " #{index + 1}) Game name: #{game['name']} Publish date: #{game['publish_date']}"
      puts " Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
    end
  end

  def add_game
    published_date = handle_input_date('Published date: ')
    game_name = handle_input_str('Game name: ')
    last_played_at = handle_input_date('Last played at: ')
    multiplayer = handle_input_str('Mutliplayer(y/n): ')
    @games << Game.new(game_name, published_date, last_played_at, multiplayer).to_json
    save
    puts 'Game created successfully!'
  end

  def handle_input_str(param)
    print param
    gets.chomp.capitalize
  end

  def handle_input_date(param)
    print param
    date = gets.chomp
    Date.parse(date)
  rescue StandardError
    puts 'Invalid date please enter a valid date yy/mm/dd'
    handle_input_date(param)
  end
end
