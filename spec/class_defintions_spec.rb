require 'rspec'
require 'pry'
require 'class_definitions'

describe('#Class_Definitions') do
  before(:each) do
    Class_Definitions.clear()
  end

  describe('.all') do
    it('this test should return an empty list of definitions when there are no words') do
      expect(Class_Definitions.all).to(eq([]))
    end
  end

  describe('.clear') do
    it('this test should clear the dictionary of all definitions') do
      class_def = Class_Definitions.new({:name => "conformity in the application of something, typically that which is necessary for the sake of logic, accuracy, or fairness.", :id => nil})
      class_def.save()
      class_def2 = Class_Definitions.new({:name => "lack of variety and interest; tedious repetition and routine.", :id => nil})
      class_def2.save()
      Class_Definitions.clear()
      expect(Class_Definitions.all).to(eq(false))
    end
  end
end