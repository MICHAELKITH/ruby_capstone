require_relative 'label'
require_relative 'item'
require 'rspec'

describe Label do
  describe '#add_item' do
    it 'should add the item to the items list' do
      label = Label.new('Test Label', 'red')
      item = Item.new('Test Item')
      label.add_item(item)
      expect(label.items).to include(item)
    end

    it 'should set the label of the added item to itself' do
      label = Label.new('Test Label', 'red')
      item = Item.new('Test Item')
      label.add_item(item)
      expect(item.label).to eq(label)
    end
  end
end
