class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(id:, name: 'Not specified')
    @id = id || Random.rand(1..1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item)
  end
end
