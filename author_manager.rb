require 'json'
require_relative 'author'

class AuthorManager
  attr_reader :author_list

  def initialize
    authors = File.read('./json/authors.json') if File.exist?('./json/authors.json')
    @author_list = authors.nil? ? [] : JSON.parse(authors)
  end

  def new_author
    puts 'Enter First Name'
    first_name = gets.chomp
    puts 'Enter Last Name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @author_list.push(author.to_hash)
    save_authors
    puts 'Author successfully added'
    author
  end

  def save_authors
    author_data = JSON.generate(@author_list)
    File.write('./json/authors.json', author_data)
  end

  def list_authors
    pretty_author_list = @author_list.map do |author|
      "id: #{author['id']}
      Full Name: #{author['first_name']} #{author['last_name']}
    "
    end
    puts pretty_author_list
  end
end
