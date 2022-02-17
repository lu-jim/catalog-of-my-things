require './label'

describe Label do
  context 'Testing Label class' do
    label = Label.new(id: nil, title: 'Test Label', color: 'Test Color')

    it 'should render Title Properly' do
      expect(label.title).to eq 'Test Label'
    end

    it 'render color properly' do
      expect(label.color).to eq 'Test Color'
    end

    it 'check instance of class' do
      expect(label).to be_a Label
    end

    it 'should return expected type 0f variables' do
      expect(label.color).to be_a String
    end

    it 'should check if id is passed' do
      expect(label.id).not_to eq(nil)
    end


  end
end