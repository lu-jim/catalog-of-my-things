require 'securerandom'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name)
    @id = SecureRandom.hex(4)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.add_author(@id)
    @items.push(item) unless @items.include?(item)
  end
end
