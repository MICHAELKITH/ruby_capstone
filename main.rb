require_relative 'app'
require_relative 'store_data'

class MainMenu
  def initialize
    @app = App.new
  end

  def user_options(choice)
    menu_options = {
      1 => :list_books,
      2 => :list_music,
      3 => :list_games,
      4 => :list_genres,
      5 => :list_labels,
      6 => :list_authors,
      7 => :create_book,
      8 => :add_music_album,
      9 => :create_games,
      0 => :exit_app
    }
    if menu_options.key?(choice)
      method_name = menu_options[choice]
      send(method_name, @app)

    else
      puts 'Invalid option, please try again!'
    end
  end

  def display
    puts 'Welcome to your library'
    puts 'Please choose an option'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Create a book'
    puts '8. Create a music album'
    puts '9. Create a game'
    puts '0. Exit'
  end

  def list_books(app)
    app.list_books
    # save_books(@app.books)
  end

  def list_music(app)
    app.list_music
  end

  def list_games(app)
    app.list_games
  end

  def list_genres(app)
    app.list_genres
  end

  def list_labels(app)
    app.list_labels
  end

  def list_authors(app)
    app.list_authors
  end

  def create_book(app)
    app.create_book
    save_books(app.books)
  end

  def add_music_album(app)
    app.add_music_album
  end

  def create_games(app)
    app.create_games
  end

  def exit_app(app)
    app.exit_app
  end
end

def main
  main_menu = MainMenu.new
  loop do
    main_menu.display
    choice = gets.chomp.to_i
    main_menu.user_options(choice)
  end
end

main

# require_relative 'app'
# require './store_data'

# class MainMenu
#   MENU_OPTIONS = [
#     { number: '1', label: 'List all books', action: :list_books },
#     { number: '2', label: 'List all music albums', action: :list_music },
#     { number: '3', label: 'List all games', action: :list_games },
#     { number: '4', label: 'List all genres', action: :list_genres },
#     { number: '5', label: 'List all labels', action: :list_labels },
#     { number: '6', label: 'List all authors', action: :list_authors },
#     { number: '7', label: 'Create a book', action: :create_book },
#     { number: '8', label: 'Create a music album', action: :create_music },
#     { number: '9', label: 'Create a game', action: :create_games },
#     { number: '0', label: 'Exit', action: :exit_app }
#   ].freeze

#   def initialize(app)
#     @app = app
#   end

#   def user_options(choice)
#     selected_option = MENU_OPTIONS.find { |option| option[:number] == choice }

#     if selected_option.nil?
#       puts 'Invalid option, please try again!'
#     else
#       @app.send(selected_option[:action])
#       save_books(@app.books) if %w[7 8].include?(choice)
#     end
#   end

#   def display
#     puts 'Please choose an option'

#     MENU_OPTIONS.each do |option|
#       puts "#{option[:number]}. #{option[:label]}"
#     end
#   end

#   # private

#   # def save_books(books)
#   #   # Implement the logic to save books using the StoreData class
#   # end
# end

# class ItemsApp
#   def initialize
#     @app = App.new
#     @MainMenu = MainMenu.new(@app)
#   end

#   def start
#     puts 'Welcome to Items App!'
#     loop do
#       @MainMenu.display
#       option = gets.chomp
#       @MainMenu.user_options(option)
#     end
#   end
# end

# ItemsApp.new.start
