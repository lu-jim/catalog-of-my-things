require './label'

class LabelMethods
  def initialize
    labels = File.read('./json/labels.json')
    @labels = labels == '' ? [] : convert_hash_to_labels(JSON.parse(labels))
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