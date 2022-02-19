require './author'

describe Author do
  context 'Testing the author class' do
    author = Author.new('Barnabas', 'Bunbee')

    it 'should properly call the author class' do
      expect(author.first_name).to eq 'Barnabas'
    end

    it 'should call the second argument properly' do
      expect(author.last_name).to eq 'Bunbee'
    end

    it 'should check if instance of class' do
      expect(author).to be_a Author
    end

    it 'should return argument string' do
      expect(author.first_name).to be_a String
    end

    it 'check if app does not break' do
      expect(author.first_name).to eq author.first_name
    end
  end
end
