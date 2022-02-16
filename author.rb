class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name, id: Random.rand(1..1_000_000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = @id
    @items.push(item.id)
  end
end
