# Documentation for the App class
require_relative 'book'

class App
  def initialize
    @people = []
    base = "#{Dir.pwd}/data"
    books_reader = File.read("#{base}/books.json")
    JSON.parse(books_reader).each { |x| @books.push(Book.new(x['title'], x['author'])) } unless books_reader == ''

  end

    # create a list of BOOK
    def list_books
      if @books.empty?
        puts 'Oops! the library is empty, please add books'
        return
      end
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    publisher, cover_state, published_date
end
