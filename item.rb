# frozen_string_literal: true

# class item
class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :published_date

  def initialize(_archived)
    @id = :id
    @genre = []
    @author = []
    @source = []
    @label = :label
    @published_date = :published_date
  end

  def add_genre(genre)
    @genre.push(genre) unless @genre.include? (genre)
  end

  def add_author(author)
    @author.push(author) unless @author.include? (author)
  end

  def add_source(source)
    @source.push(source) unless @source.include? (source)
    puts @source
  end




  def can_be_archived?; end

  def move_to_archive; end
end

item = Item.new(true)
item.add_source('autho3')