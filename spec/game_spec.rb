require './game'

describe Game do
  context 'Given the proper inputs' do
    game = Game.new(published_date: '1984-06-06', multiplayer: false, last_played_at: '2020-12-10')
  end
end
