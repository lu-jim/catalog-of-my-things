require_relative 'author'

class AuthorManager
  def initialize
    authors = File.read('./json/authors.json')
    @author_list = authors.nil? ? [] : JSON.parse(authors)
  end

  def add_author
    puts 'Enter First Name'
    first_name = gets.chomp
    puts 'Enter Last Name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @author_list.push(author)
    save_authors
    label
  end
end
