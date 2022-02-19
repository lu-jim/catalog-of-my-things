class Label
  attr_reader :id, :title, :color, :items

  def initialize(title:, color:, id: 0)
    @id = !id || id.zero? ? Random.rand(1..1_000_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items.push(item)
  end

  def to_hash
    { id: @id, title: @title, color: @color }
  end
end
