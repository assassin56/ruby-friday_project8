require 'rspec'
require 'pry'
require 'Definition'

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
      class_def = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Definition.new({:name => "lack of variety and interest; tedious repetition and routine.", :id => nil})
      class_def2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('this test should find a word by its id') do
      class_def = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Definition.new({:name => "lack of variety and interest; tedious repetition and routine.", :id => nil})
      class_def2.save()
      expect(Definition.find(class_def.id)).to(eq(class_def))
    end
  end

  describe('#update') do
    it('updates a definition based on its id') do
      class_def = Definition.new({:name => "none existent definition", :id => nil})
      class_def.save()
      class_def.update("conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.")
      expect(class_def.name).to(eq("conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness."))
    end
  end

  describe('#save') do
    it('updates the word with a new definition.') do
      class_def = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Definition.new({:name => "lack of variety and interest; tedious repetition and routine.", :id => nil})
      class_def2.save()
      expect(Definition.all).to(eq([class_def, class_def2]))
    end
  end

  describe('#==') do
    it('checks for the same definition if it has the same attributes as another definition') do
      class_def = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def2.save()
      expect(class_def).to(eq(class_def2))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      class_def = Definition.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Definition.new({:name => "lack of variety and interest; tedious repetition and routine.", :id => nil})
      class_def2.save()
      class_def.delete()
      expect(Definition.all).to(eq([class_def2]))
    end
  end
end