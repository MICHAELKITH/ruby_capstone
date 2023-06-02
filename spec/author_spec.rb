require 'rspec'
require 'spec_helper'

describe Author do
  let(:author) { Author.new('J.K.', 'Rowling') }
  let(:item1) { Item.new('Harry Potter and the Philosopher\'s Stone') }
  let(:item2) { Item.new('Harry Potter and the Chamber of Secrets') }

  describe '#add_item' do
    it 'adds an item to the author\'s list of items' do
      author.add_item(item1)
      expect(author.items).to include(item1)
    end

    it 'sets the author of the item to be the current author' do
      author.add_item(item1)
      expect(item1.author).to eq(author)
    end

    it 'does not add the same item multiple times' do
      author.add_item(item1)
      author.add_item(item2)
      expect(author.items.size).to eq(2)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the author' do
      author.add_item(item1)
      author.add_item(item2)
      expect(author.to_json).to eq({
                                     'id' => author.id,
                                     'first_name' => 'J.K.',
                                     'last_name' => 'Rowling',
                                     'items' => [item1.id, item2.id]
                                   })
    end
  end
end
