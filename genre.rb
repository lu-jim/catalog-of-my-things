class Genre
  attr_reader :id, :name, :items

  def initialize(name:, id:)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items.push(item)
  end
end
