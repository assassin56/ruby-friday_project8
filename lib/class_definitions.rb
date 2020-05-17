class Class_Definitions
  attr_reader :id
  attr_accessor :name

  @@definitions = {}
  @@total_rows = 0
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@definitions.values()
  end
  
  def self.clear
    @@total_rows = 0
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(this_word_id) 
    defs = []
    @@definitions.values.each do |this_def|
      if this_def.id == this_word_id
        defs.push(this_def)
      end
    end
    defs
  end

  def save
    @@definitions[self.id] = Class_Definitions.new({
      :name => self.name,
      :id => self.id
    })
  end

  def ==(defintion_to_compare)
    self.name() == word_to_compare.name()
  end

  def update(name, word_id)
    self.name = name
    self.id = word_id
    self.save()
  end

  def delete
    @@definitions.delete(self.id)
  end
end