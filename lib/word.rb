class Word
  attr_reader :id, :name
  attr_accessor :name, :id

  @@dictionary = {}
  @@total_rows = 0
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@dictionary.values()
  end
  
  def self.clear
    @@total_rows = 0
    @@dictionary = {}
  end

  def self.find(id)
    @@dictionary[id]
  end
  
  def self.search(name)
    new_words = Word.all.map { |word| word.name.downcase }
    result = []
    words = new_words.grep(/#{name}/)
    words.each do |n|
      display_words = Word.all.select { |word| word.name.downcase == n}
      result.push(display_words)
    end
    result
  end

  def definitions
    Definition.find_by_word(self.id)
  end

  def save
    @@dictionary[self.id] = Word.new({
      :name => self.name,
      :id => self.id
    })
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def update(name)
    self.name = name
    self.save()
  end

  def delete
    @@dictionary.delete(self.id)
  end
end