require_relative './spec_helper'

describe Label do
  before(:all) do
    @label = Label.new('Fiction', 'blue')
  end

  describe '#initialize' do
    it 'creates a new Label instance' do
      expect(@label).to be_an_instance_of Label
    end

    it 'the title of the label should be "Fiction"' do
      expect(@label.title).to eq('Fiction')
    end

    it 'the color of the label should be "blue"' do
      expect(@label.color).to eq('blue')
    end
  end

  describe '#add_item' do
    it 'should add an item to the label' do
      book = Book.new('author', '2020-01-01', 'publisher', 'good', nil)
      @label.add_item(book)
      expect(@label.items).to include(book)
    end
  end
end
