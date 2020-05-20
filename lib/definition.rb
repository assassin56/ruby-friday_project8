class Definition
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
    @@definitions[self.id] = Definition.new({
      :name => self.name,
      :id => self.id
    })
  end

  def ==(definition_to_compare)
    self.name() == definition_to_compare.name()
  end

  def update(name)
    self.name = name
    self.save()
  end

  def delete
    @@definitions.delete(self.id)
  end
end