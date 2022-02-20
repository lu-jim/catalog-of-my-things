require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = SecureRandom.hex(4)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    { id: @id, first_name: @first_name, last_name: @last_name, items: @items }
  end

  def to_s
    "id: #{@id} | Full Name: #{@first_name} #{@last_name}"
  end
end
