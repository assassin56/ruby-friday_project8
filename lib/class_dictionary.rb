class Class_Dictionary
  attr_reader :id
  attr_accessor :name

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
    new_words = Class_Dictionary.all.map { |word| word.name.downcase }
    result = []
    words = new_words.grep(/#{name}/)
    words.each do |n|
      display_words = Class_Dictionary.all.select { |word| word.name.downcase == n}
      result.push(display_words)
    end
    result
  end

  def save
    @@dictionary[self.id] = Class_Dictionary.new({
      :name => self.name,
      :id => self.id
    })
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end
end
