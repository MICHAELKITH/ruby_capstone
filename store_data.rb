require 'fileutils'
require 'json'

FileUtils.mkdir_p('data')
base = "#{Dir.pwd}/data"
File.open("#{base}/books.json", 'w') unless File.exist?("#{base}/books.json")
File.open("#{base}/labels.json", 'w') unless File.exist?("#{base}/labels.json")

def save_books(array)
    base = "#{Dir.pwd}/data"
    books_array = array.map { |e| { title: e.title, author: e.author } }
    File.write("#{base}/books.json", books_array.to_json, mode: 'w')
end