require 'date'

class Game < item
    attr_accessor :last_played_at, :name

    def initialize(name, published_date, last_played_at, multiplayer)
        super(published_date)
        @last_played_at = last_played_at
        @multiplayer = multiplayer
        @name = name
      end

      def to_json(*_args)
        {
          'name' => @name,
          'published_date' => @published_date,
          'last_played_at' => @last_played_at,
          'multiplayer' => @multiplayer
        }
      end
    
     
end