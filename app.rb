require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game'
require_relative 'author'
require 'json'
require 'date'
require_relative 'genre'
require_relative 'music_album'
# Documentation for the App class
require_relative 'book'
require_relative 'label'

class App
  attr_accessor :books, :authors, :games

  def initialize
    @books = []
    @authors = []
    @games = []
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

  # def create_book_object(author, published_date, publisher, cover_state, label)
  #   book = Book.new(author, published_date, publisher, cover_state, label)
  #   {
  #     'id' => book.id,
  #     'author' => book.author,
  #     'published_date' => book.published_date,
  #     'publisher' => book.publisher,
  #     'cover_state' => book.cover_state,
  #     'label' => book.label
  #   }
  # end

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
