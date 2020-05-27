class Definition
  attr_reader :id
  attr_accessor :definition, :word_id, :id

  @@definitions = {}
  @@total_rows = 0
  
  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
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

  def self.find_by_word(word_id) 
    defs = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        defs.push(definition)
      end
    end
    defs
  end

  def save
    @@definitions[self.id] = Definition.new({
      :definition => self.definition,
      :word_id => self.word_id,
      :id => self.id
    })
  end

  def ==(definition_to_compare)
    (self.definition() == definition_to_compare.definition()) && (self.word_id() == definition_to_compare.word_id())
  end

  def update(definition, word_id)
    @definition = definition
    @word_id = word_id
  end

  def delete
    @@definitions.delete(@id)
  end
end