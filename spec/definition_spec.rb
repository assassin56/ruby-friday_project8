require 'rspec'
require 'pry'
require 'definition'

describe('#Definition') do
  before(:each) do
    Definition.clear()
  end

  describe('.all') do
    it('this test should return an empty list of definitions when there are no words') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.clear') do
    it('this test should clear the dictionary of all definitions') do
      definition = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :word_id => @word_id, :id => nil})
      definition.save()
      definition2 = Definition.new({:definition => "lack of variety and interest; tedious repetition and routine.", :word_id => @word_id, :id => nil})
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('this test should find a word by its id') do
      definition = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.",:word_id => @word_id, :id => nil})
      definition.save()
      definition2 = Definition.new({:definition => "lack of variety and interest; tedious repetition and routine.", :word_id => @word_id, :id => nil})
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it('updates a definition based on its id') do
      definition = Definition.new({:definition => "none existent definition", :word_id => @word_id, :id => nil})
      definition.save()
      definition.update("conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", @word_id)
      expect(definition.definition).to(eq("conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness."))
    end
  end

  describe('#save') do
    it('updates the word with a new definition.') do
      definition = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :word_id => @word_id, :id => nil})
      definition.save()
      definition2 = Definition.new({:definition => "lack of variety and interest; tedious repetition and routine.", :word_id => @word_id, :id => nil})
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('#==') do
    it('checks for the same definition if it has the same attributes as another definition') do
      definition = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :word_id => @word_id, :id => nil})
      definition.save()
      definition2 = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.",:word_id => @word_id, :id => nil})
      definition2.save()
      expect(definition).to(eq(definition2))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition = Definition.new({:definition => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.",:word_id => @word_id, :id => nil})
      definition.save()
      definition2 = Definition.new({:definition => "lack of variety and interest; tedious repetition and routine.",:word_id => @word_id, :id => nil})
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end