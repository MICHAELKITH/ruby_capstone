require 'spec_helper'
require 'rspec'
require 'date'

describe Game do
  let(:published_date) { Date.new(2020, 1, 1) }
  let(:last_played_at) { Time.now.to_i }
  let(:multiplayer) { true }
  let(:name) { 'Super Mario Bros' }
  subject { described_class.new(name, published_date, last_played_at, multiplayer) }

  describe '#initialize' do
    it 'should set name attribute' do
      expect(subject.name).to eq(name)
    end

    it 'should set published_date attribute' do
      expect(subject.published_date).to eq(published_date)
    end

    it 'should set last_played_at attribute' do
      expect(subject.last_played_at).to eq(last_played_at)
    end

    it 'should set multiplayer attribute' do
      expect(subject.instance_variable_get(:@multiplayer)).to eq(multiplayer)
    end
  end

  describe '#to_json' do
    it 'returns a hash with the correct attributes' do
      expect(subject.to_json).to eq({
                                      'name' => 'Super Mario Bros',
                                      'published_date' => Date.new(2020, 1, 1),
                                      'last_played_at' => last_played_at,
                                      'multiplayer' => true
                                    })
    end
  end

  describe '#can_be_archived?' do
    it 'return true if last played more than 2 years ago' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
      subject.instance_variable_set(:@last_played_at, Time.new.year - 3)
      expect(subject.send(:can_be_archived?)).to eq(true)
    end

    it 'return false if last played more than 2 years ago' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
      subject.instance_variable_set(:@last_played_at, Time.new.year - 3)
      expect(subject.send(:can_be_archived?)).to eq(false)
    end
  end
end
