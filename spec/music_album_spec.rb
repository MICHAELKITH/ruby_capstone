require_relative '../music_album'
require_relative '../item'
describe MusicAlbum do
  context 'Given an instance of the music album class' do
    before :each do
      @music = MusicAlbum.new('Kaweesi', '2013-09-03', true)
    end

    it 'creates an instance of the music album class' do
      expect(@music).to be_instance_of MusicAlbum
    end
    it 'return true for the can be archived method' do
      expect(@music.can_be_archived?).to be false
    end
  end
end
