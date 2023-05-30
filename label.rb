require_relative 'item'

class label
    attr_reader :id, :items
    attr_accessor :title, :color

    def initialize(title, color)
        @id = rand(1..1000)
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        item.label = self
        @items << item
end