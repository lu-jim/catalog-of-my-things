require './game'

describe Game do
  context 'Given the proper inputs' do
    game = Game.new(id:nil, published_date: '1984-06-06', multiplayer: false, last_played_at: '2020-12-10')

    it 'should properly render published date' do
      expect(game.published_date.to_s).to eq '1984-06-06'
    end
  end
end
