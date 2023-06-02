require_relative 'game_ui'
require_relative 'author'
require 'fileutils'

class AuthorUserInterface
  FILE_LOCATION = './data/authors.json'.freeze

  def initialize
    game_ui = GameUserInterface.new
    @items = game_ui.create_instance_of_game
    @authors = load_authors
  end

  def load_authors
    create_file_if_not_exist
    return [] if File.empty?(FILE_LOCATION)

    data = JSON.parse(File.read(FILE_LOCATION))
    data.map { |author_data| build_author_from_data(author_data) }
  end

  def create_file_if_not_exist
    FileUtils.mkdir_p(['data']) unless File.directory?('data')
    FileUtils.touch(FILE_LOCATION) unless File.exist?(FILE_LOCATION)
  end

  def build_author_from_data(author_data)
    author = Author.new(author_data['first_name'], author_data['last_name'])
    add_items_to_author(author, author_data['items'])
    author
  end

  def add_items_to_author(author, item_ids)
    items = @items.select { |item| item_ids.include?(item.id) }
    items.each { |item| author.add_item(item) }
  end

  def list_authors
    if @authors.empty?
      puts 'There is no authors to list!'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1}) Author Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def save(records)
    serialized = records.map(&:to_json)
    File.write(FILE_LOCATION, JSON.dump(serialized))
  end
end
