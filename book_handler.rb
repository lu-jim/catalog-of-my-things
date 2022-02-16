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
    puts 'Enter if you are adding label to this book [y/n]'
    response = gets.chomp
    book.add_label if response.downcase == 'y'
  end

  def list_all_books
    @books.each_with_index do |b, i|
      puts "#{i}) Publisher: #{b.publisher},
      Cover_State: #{b.cover_state},
      Publish_Date: #{b.publish_date},
      Archived: #{b.archived}"

      show_label b.label
    end
  end

  def save_books
    hash_arr =change_books_to_hashes
    json = JSON.generate(hash_arr)
    File.write('./json/books.json', json)
  end

  private

  def change_hash_to_books(hashes)
    books = []
    hashes.each do |h|
      b = Book.new(id: nil, pubisher: h['publisher'], cover_state: h['cover_state'], publish_date: h['publish_date'], archived: h['archived'])
      l = change_hashes_to_labels h['label']
      b.add_label(l)
      books << b
    end
    books
  end

  def change_hashes_to_labels(hash)
    Label.new(id: hash['id'], title: hash['title'], color: hash['color'])
  end


