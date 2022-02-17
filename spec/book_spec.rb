require './book'

describe Book do 
  context 'Testing Book' do
    book = Book.new(id: nil, publisher: 'Test Publisher', cover_state: 'New', published_date: '2022-02-17')
    
    it 'should properly render book publisher' do
      expect(book.publisher).to eq 'Test Publisher'
    end

    it 'should properly handle cover state' do 
      expect(book.cover_state).to eq 'New'
    end

    it 'should properly handle publish date' do 
      expect(book.published_date.to_s).to eq '2022-02-17'
    end

    it 'should return false as book cannot be archive' do
      expect(book.can_be_archived?).to eq false
    end
  end
end

