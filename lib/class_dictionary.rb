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

  def save()
    @@dictionary[self.id] = Class_Dictionary.new({
      :name => self.name,
      :id => self.id
    })
  end

end
