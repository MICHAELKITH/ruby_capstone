require 'date'

# create class item
class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize(published_date)
    @id = rand(1..1000)
    @published_date = published_date
    @archived = false
    @genre = genre
    @author = author
    @source = source
    @label = label
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    Date.today > Date.iso8601(@published_date).next_year(10)
  end

  private :can_be_archived?
end
