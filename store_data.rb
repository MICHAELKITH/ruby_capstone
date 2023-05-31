require 'fileutils'
require 'json'

FileUtils.mkdir_p('data')
base = "#{Dir.pwd}/data"
File.open("#{base}/books.json", 'w') unless File.exist?("#{base}/books.json")
File.open("#{base}/labels.json", 'w') unless File.exist?("#{base}/labels.json")

def save_books(array)
    base = "#{Dir.pwd}/data"
    books_array = array.map { |book| { publisher: book.publisher, cover_state: book.cover_state, published_date: book.published_date }}
    File.write("#{base}/books.json", books_array.to_json, mode: 'w')
end