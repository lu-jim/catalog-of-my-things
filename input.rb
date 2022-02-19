class Input
  def self.item
    puts 'Enter item name'
    name = gets.chomp
    puts 'Enter publish date'
    published_date = gets.chomp
    puts 'Enter is book archived [Y/N] ?'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    puts 'Enter label title ?'
    label_title = gets.chomp
    puts 'Enter label color ?'
    label_color = gets.chomp
    puts 'Enter author first name'
    author_first_name = gets.chomp
    puts 'Enter author last name'
    author_last_name = gets.chomp
    [name, published_date, is_archived, label_title, label_color, author_first_name, author_last_name]
  end

  def self.book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    [publisher, cover_state]
  end

  def self.game
    puts 'Is game multiplayer? [Y/N]'
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Last played at'
    last_played_at = gets.chomp
    [multiplayer, last_played_at]
  end
end
