require './game'

describe Game do
  context 'Given the proper inputs' do
    game = Game.new(id: nil, title: 'Adventure', published_date: '1984-06-06', multiplayer: false, last_played_at: '2020-12-10')

    it 'should properly render published date' do
      expect(game.published_date.to_s).to eq '1984-06-06'
    end

    it 'should properly render multiplayer' do
      expect(game.multiplayer).to eq false
    end

    it 'should properly render last played date' do
      expect(game.last_played_at.to_s).to eq '2020-12-10'
    end

    it 'should return false as game cannot be archived' do
      expect(game.can_be_archived?).to eq false
    end
  end
end
