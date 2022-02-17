require './label'

class LabelsManager
  def initialize
    labels = File.read('./json/labels.json')
    @labels = labels == '' ? [] : convert_hashs_to_labels(JSON.parse(labels))
  end

  def add_label
    puts 'Enter Title'
    title = gets.chomp
    puts 'Enter Color'
    color = gets.chomp
    label = Label.new(id: nil, title: title, color: color)
    @labels.push(label)
    save_labels
    label
  end

  def save_labels
    hash_arr = convert_labels_to_hashes
    json = JSON.generate(hash_arr)
    File.write('./json/labels.json', json)
  end

  def list_all_labels
    @labels.each_with_index do |l, i|
      puts " #{i}) ID: #{l.id}, Title:  #{l.title}, Color #{l.color}"
    end
  end

  private

  def convert_hashs_to_labels(hashes)
    labels = []
    hashes.each do |h|
      l = Label.new(id: h['id'], title: h['title'], color: h['color'])
      labels << l
    end
    labels
  end

  def convert_labels_to_hashes
    hash_arr = []
    @labels.each do |l|
      hash = { title: l.title, color: l.color, id: l.id }
      hash_arr.push(hash)
    end
    hash_arr
  end
end