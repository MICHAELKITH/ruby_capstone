# Create Genre class with an association to the Item class (in a separate .rb file).
# All Genre class properties visible in the diagram should be defined and set up in the constructor method.
# Implement methods:
# add_item method in the Genre class
# should take an instance of the Item class as an input
# should add the input item to the collection of items
# should add self as a property of the item object (by using the correct setter from the item object)
# Add unit tests for all implemented methods.
# The following options should be available:
# List all genres (e.g 'Comedy', 'Thriller')
# All data should be preserved by saving collections in .json files.
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
# genres table
class Genre
  attr_reader :items, :name, :id

  def initialize(name, id: rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genres = self
  end
end
