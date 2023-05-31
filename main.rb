require_relative 'app'

class MainMenu
  @app = App.new
  def user_options(choice)
    menu_options = {
      1 => method(:list_books),
      2 => method(:list_music),
      3 => method(:list_games),
      4 => method(:list_genres),
      5 => method(:list_labels),
      6 => method(:list_authors),
      7 => method(:create_book),
      8 => method(:create_music),
      9 => method(:create_games),
      0 => method(:exit_app)
    }
    if menu_options.key?(choice)
      menu_options[choice].call(app)
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
  end

  def create_music(app)
    app.create_music
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
