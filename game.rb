require 'date'

class Game < item
    attr_accessor :last_played_at, :name

    def initialize(name, published_date, last_played_at, multiplayer)
        super(published_date)
        @last_played_at = last_played_at
        @multiplayer = multiplayer
        @name = name
      end
end