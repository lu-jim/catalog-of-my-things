require_relative 'author'

class AuthorManager
  def initialize
    authors = File.read('./json/authors.json')
    @authors = authors.nil? ? [] : JSON.parse(author)
  end
end
