
class Item
    attr_reader :name, :published_date
  
    def initialize(name, published_date)
      @id = rand(1..1000)
      @name = name
      @published_date = published_date
      @archived = false
      @genre = genre
      @author = author
      @source = source
      @label = label
    end
end