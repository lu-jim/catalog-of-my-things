require 'json'
require './book'
require './label'

class BookHandler
  attr_reader :books

  def initialize
    books = File.read('./json/books.json')
    @books = books == '' ? [] : convert_hashs_to_books(JSON.parse(books))
  end

  def add_book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Enter is book archived [Y/N] ?'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    book = Book.new(id: nil, publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    book.move_to_archive if is_archived
    add_label book
    @books.push(book)
    save_books
  end

  def add_label(book)
    puts 'Enter if you want to add a label to this book [Y/N] ?'
    reponse = gets.chomp
    book.add_label if reponse.downcase == 'y'
  end

  def list_all_books
    @books.each_with_index do |b, i|
      puts "
       #{i})
            Publisher: #{b.publisher},
            Cover State: #{b.cover_state},
            Publish Date: #{b.publish_date},
            Archived : #{b.archived}
        "
      show_label b.label
    end
  end

  def save_books
    hash_arr = convert_books_to_hashes
    json = JSON.generate(hash_arr)
    File.write('./json/books.json', json)
  end

  private

  def convert_hashs_to_books(hashes)
    books = []
    hashes.each do |h|
      b = Book.new(id: nil, publisher: h['publisher'], cover_state: h['cover_state'], publish_date: h['publish_date'],
                   archived: h['archived'])
      l = convert_hash_to_label h['label']
      b.add_label(l)
      books << b
    end
    books
  end

  def convert_hash_to_label(hash)
    Label.new(id: hash['id'], title: hash['title'], color: hash['color'])
  end

  def convert_books_to_hashes
    hash_arr = []
    @books.each do |b|
      hash = { publisher: b.publisher, cover_state: b.cover_state, publish_date: b.publish_date,
               archived: b.archived, label: if b.label
                                              { id: b.label.id, title: b.label.title, color: b.label.color }
                                            end }
      hash_arr.push(hash)
    end
    hash_arr
  end

  def show_label(label)
    return unless label.title

    print "
            Lable:
              ID: #{label.id},
              Title: #{label.title},
              Color: #{label.color}
      "
  end
end



