# Create MusicAlbum class in a separate .rb file.
# All MusicAlbum class properties visible in the diagram should be defined and set up in the constructor method.
# Implement methods:
# can_be_archived?() in the MusicAlbum class
# should override the method from the parent class
# should return true if parent's method returns true AND if on_spotify equals true
# otherwise, it should return false
# Add unit tests for all implemented methods.
# The following options should be available:
# List all music albums
# Add a music album
# All data should be preserved by saving collections in .json files.
# Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
# music_albums table (add all properties and associations from the parent Item class as table columns)
require_relative '../item'
class MusicAlbum < Item
  attr_accessor :name, :publish_date, :on_spotify

  def initialize(name, publish_date, on_spotify)
    @id = Random.rand(1..1000)
    super(publish_date, archived)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
