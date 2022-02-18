class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(id:, name: 'Not specified')
    @id = id || Random.rand(1..1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_genre (self)
    @items.push(item) unless @items.include?(item)
  end

  def to_s
    "ID: #{@id} - Name: #{@name}"
  end

  def to_json(_options = {})
    {
      'id' => @id,
      'name' => @name
    }
  end
end
