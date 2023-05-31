require_relative './spec_helper'
describe Book do
  before(:all) do
    label = Label.new('Fiction', 'blue')
    @book = Book.new('author', '2020-01-01', 'publisher', 'good', label)
  end

  describe '#initialize' do
    it 'creates a new Book instance' do
      expect(@book).to be_an_instance_of Book
    end

    it 'the author of the book should be "author"' do
      expect(@book.author).to eq('author')
    end

    it 'the publication date of the book should be "2020-01-01"' do
      expect(@book.published_date).to eq('2020-01-01')
    end

    it 'the publisher of the book should be "publisher"' do
      expect(@book.publisher).to eq('publisher')
    end

    it 'the cover state of the book should be "good"' do
      expect(@book.cover_state).to eq('good')
    end

    it 'the label of the book should be a Label instance' do
      expect(@book.label).to be_kind_of Label
    end
  end

  describe '#can_be_archived?' do
    it 'should return true for less than 10 years' do
      expect(@book.can_be_archived?).to eq(false)
    end

    it 'should return false for more than 10 years' do
      @book.published_date = '2010-01-01'
      expect(@book.can_be_archived?).to eq(true)
    end
  end
end
