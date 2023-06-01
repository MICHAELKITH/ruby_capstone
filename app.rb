require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game'
require_relative 'author'
require_relative 'json_storage'
require_relative 'storage'
require 'json'
require 'date'
require_relative 'genre'
require_relative 'music_album'
# Documentation for the App class

class App
  attr_accessor :books, :authors, :games
  include JsonStorage
  include Storage

  def initialize
    @books = []
    @authors = []
    @games = []
    @music_albums = []
    @genres = []
    @labels = [Label.new('Love at the end of the day.', 'Blue'), Label.new('The love of my lives.', 'Grey')]
    base = "#{Dir.pwd}/data"
    books_reader = File.read("#{base}/books.json")
    return if books_reader == ''

    JSON.parse(books_reader).each do |x|
      @books.push(Book.new(x['publisher'], x['cover_state'], x['published_date']))
    end
  end

  # create a list of BOOK
  def list_books
    if @books.empty?
      puts 'Oops! the library is empty, please add books'
      return
    end
    @books.each do |book|
      puts "publisher: #{book.publisher}, cover_state: #{book.cover_state}, published_date: #{book.published_date}"
      
    end
  end

  # create a book
  def create_book
    print 'Publisher: '
    publisher = gets.chomp

    print 'Cover State: '
    cover_state = gets.chomp

    print 'Published Date: '
    published_date = gets.chomp

    @books << Book.new(publisher, cover_state, published_date)

    puts 'Book created successfully'
  end

  # create a list of labels
  def list_labels
    if @labels.empty?
      puts 'Oops! the library is empty, please add books'
      return
    end

    @labels.each do |label|
      puts "title: #{label.title}, color: #{label.color}"
    end
  end

  def add_music_album
    puts 'Album name: '
    name = gets.chomp
    puts 'Genre: '
    genre_name = gets.chomp
    @genres.push(Genre.new(genre_name))
    store_genre_data

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase
    case on_spotify
    when 'y'
      @music_albums.push(MusicAlbum.new(name, publish_date, true))
    when 'n'
      @music_albums.push(MusicAlbum.new(name, publish_date, false))
    end
    puts 'Music album created'
    store_music_data
  end

  def list_music
    music_data = get_data('./data/music_albums.json')
    puts 'No music found' if music_data.empty?
    music_data.each do |music_album|
      puts "Album_name: #{music_album['music_name']} | On_spotify: #{music_album['music_on_spotify']}"
    end
  end

  def list_genres
    data = get_data('./data/genres.json')
    puts 'No genre found' if data.empty?
    data.each do |genre|
      puts "Genre name: #{genre['genre_name']}"
    end
  end

  def store_music_data
    array = []
    @music_albums.each do |music|
      array << {
        music_id: music.id,
        music_name: music.name,
        music_on_spotify: music.on_spotify

      }
    end
    update_data(array, './data/music_albums.json')
  end

  def store_genre_data
    array = []
    @genres.each do |genre|
      array << {
        genre_id: genre.id,
        genre_name: genre.name
      }
    end
    update_data(array, './data/genres.json')
  end

  def list_games
    if @games.empty?
      puts 'No games found in the system currently'
    else
      puts '=================================================================:'
      puts 'List of Games:'
      puts '=================================================================:'
      puts 'ID - Game Name - Last Played Date - Published Date - Multiplayer'
      @games.each do |game|
        puts "#{game['id']} - #{game['game_name']} - #{game['last_played_at']} -
        #{game['publish_date']} - #{game['multiplayer']}"
      end
      puts '=================================================================:'
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found in the system currently'
    else
      puts '=============================================:'
      puts 'List of Authors:'
      puts '=============================================:'
      puts 'ID - First Name - Last Name'
      authors.each do |author|
        puts "#{author['id']} - #{author['first_name']} - #{author['last_name']}"
      end
      puts '=============================================:'
    end
  end

  def create_games
    puts 'write Name of the game'
    game_name = gets.chomp
    puts 'Write last played date (YYYY-MM-DD))'
    last_played_at = gets.chomp
    puts 'Enter published date (YYYY-MM-DD))'
    publish_date = gets.chomp
    puts 'Enter multiplayer'
    multiplayer = gets.chomp
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    author = create_author(first_name, last_name)
    authors << author
    @store.save_data(authors, './data/authors.json')
    game = create_game_object(game_name, last_played_at, publish_date, multiplayer)
    @games << game
    @store.save_data(@games, './data/games.json')
    puts 'Game is created successfully'
  end

  def create_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
  end

  def create_game_object(game_name, last_played_at, publish_date, multiplayer)
    game = Game.new(game_name, last_played_at, publish_date, multiplayer)
    {
      'id' => game.id,
      'game_name' => game.game_name,
      'last_played_at' => game.last_played_at,
      'publish_date' => game.publish_date,
      'multiplayer' => game.multiplayer
    }
  end

  def exit_app
    puts 'Thanks for using the app!'
    exit
  end
end
