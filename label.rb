class Label
  attr_reader :id, :title, :color, :items

  def initialize(title:, color:, id: 0)
    @id = !id || id.zero? ? Random.rand(1..1_000_000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    { id: @id, title: @title, color: @color }
  end

  def to_s
    "ID: #{@id} | Title: #{@title} - Color: #{@color}"
  end
end
