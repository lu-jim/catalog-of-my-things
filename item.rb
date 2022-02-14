require 'date'
# class item
class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize(archived: false)
    @id = :id
    @genre = []
    @author = []
    @source = []
    @label = []
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre.push(genre) unless @genre.include?(genre)
  end

  def add_author(author)
    @author.push(author) unless @author.include?(author)
  end

  def add_source(source)
    @source.push(source) unless @source.include?(source)
  end

  def add_label(label)
    @label.push(label) unless @label.include?(label)
    puts @label
  end

  def can_be_archived?
    current_date = Date.today
    # current_date.year - published_date.year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

# item = Item.new(true, 10/10/2000)

current = Date.today.year

puts current - 10
