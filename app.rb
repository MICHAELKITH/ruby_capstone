require_relative 'book'
require_relative 'label'
require_relative 'item'
require_relative 'game'
require_relative 'author'
require_relative 'game_ui'
require_relative 'author_ui'
require 'json'
require 'date'
require_relative 'genre'
require_relative 'music_album'
# Documentation for the App class

class App
  attr_accessor :books, :authors, :games

  def initialize
    @books = []
    @authors = []
    @games = []
    @gameui = GameUserInterface.new
    @authorui = AuthorUserInterface.new
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
    @gameui.list_all_games
  end

  def list_authors
    @authorui.list_authors
  end

  def create_games
    @gameui.add_game
  end

  def create_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    {
      'id' => author.id,
      'first_name' => author.first_name,
      'last_name' => author.last_name
    }
  end

  def exit_app
    puts 'Thanks for using the app!'
    exit
  end
end
