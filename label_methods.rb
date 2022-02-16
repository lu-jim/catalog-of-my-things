require './label'

class LabelMethods
  def initialize
    labels = File.read('./json/labels.json')
    @labels = labels == '' ? [] : change_hashes_to_labels(JSON.parse(labels))
  end

  def add_label
    puts "enter title"
    title = gets.chomp
    puts "enter color"
    color = gets.chomp
    label = Label.new(id: nil, title: title, color: color)
    @labels.push(label)
    save_labels
    label
  end

  def save_labels
    hash_arr = change_labels_to_hashes
    json = JSON.generate(hash_arr)
    File.write('./json/labels.json', json)
  end

  def list_all_labels
    @labels.each_with_index do |l, i|
      puts "#{i}) ID: #{l.id}, Title: #{l.title}, Color: #{l.color}"
    end
  end

  private 

  def change_hashes_to_labels(hashes)
    labels = []