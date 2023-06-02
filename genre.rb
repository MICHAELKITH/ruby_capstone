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
