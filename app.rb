# Documentation for the App class
require_relative 'book'
require_relative 'label'

class App
  def initialize
    @books = []
    @labels = []
    # base = "#{Dir.pwd}/data"
    # books_reader = File.read("#{base}/books.json")
    # JSON.parse(books_reader).each { |x| @books.push(Book.new(x['publisher'], x['cover_state'], x['published_date'])) } unless books_reader == ''
    # labels_reader = File.read("#{base}/labels.json")
    # JSON.parse(labels_reader).each { |x| @books.push(Label.new(x['title'], x['color']))} unless labels_reader == ''

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

    # create a list of labels
    def list_books
      if @labels.empty?
        puts 'Oops! the library is empty, please add books'
        return
      end

      @labels.each do |label|
        puts "title: #{label.title}, color: #{label.color}"
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
end
