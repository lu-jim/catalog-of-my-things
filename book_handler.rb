require 'json'
require './book'
require './label'

class BookHandler
  attr_reader :books


  def initialize 
    books = File.read('./json/books.json')
    @books = books == '' [] : change_hash_to_books(JSON.parse(books))
  end

  def add_book
    puts 'Enter pubisher'
    publisher = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Is book archived [y/n]'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    book = Book.new(id: nil, publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    book.move_to_archive if is_archived
    add_label book
    @books.push(book)
    save_books
  end

  def add_label(book)