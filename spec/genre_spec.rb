require 'spec_helper'
require_relative '../genre'

describe Genre do
  before :each do
    @genre = Genre.new('Fiction Series')
  end

  context 'When testing the Genre class' do
    it 'Should create an instance of the Genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'Should add an item to the genre' do
      item = double('Item')
      allow(item).to receive(:genres=) # Stub the genres= method
      @genre.add_item(item)
      expect(@genre.items).not_to be_empty
    end
  end
end
