require 'json'
require './book'
require './label'
require './input'

class BookHandler
  attr_reader :books

  def initialize
    @books = read_book
  end

  def read_book
    book_file = File.read('./json/books.json') if File.exist?('./json/books.json')
    book_file.nil? ? [] : JSON.parse(book_file)
  end

  def list_books
    book_data = read_book
    books_list = book_data.map do |books|
      "id: #{books['id']}
      Book Title: #{books['title']}
      Published Date: #{books['published_date']}
      Archived: #{books['archived']}

      Author: #{books['author']}
      Label: #{books['label']}

      Publisher: #{books['publisher']}
      Cover State: #{books['cover_state']}
      "
    end
    puts books_list
  end

  def add_book
    title, published_date, is_archived, label_title, label_color, author_first_name, author_last_name = Input.item
    publisher, cover_state = Input.book
    new_book = Book.new(id: nil, published_date:, title:, genre: {}, label: {}, author: {},
                        publisher:, cover_state:)
    label = Label.new(title: label_title, color: label_color)
    label.add_item(new_book)
    author = Author.new(author_first_name, author_last_name)
    author.add_item(new_book)
    new_book.move_to_archive if is_archived
    @books << new_book.to_hash
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
            Publish Date: #{b.published_date},
            Archived : #{b.archived}
        "
      show_label b.label
    end
  end

  def save_books
    book_data = JSON.generate(@books)
    File.write('./json/books.json', book_data)
  end

  private

  def convert_hashs_to_books(hashes)
    books = []
    hashes.each do |h|
      b = Book.new(id: nil, publisher: h['publisher'], cover_state: h['cover_state'],
                   published_date: h['published_date'], archived: h['archived'])
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
      hash = { publisher: b.publisher, cover_state: b.cover_state, published_date: b.published_date,
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
            Label:
              ID: #{label.id},
              Title: #{label.title},
              Color: #{label.color}
      "
  end
end
