require 'rspec'
require 'pry'
require 'class_dictionary'
require 'words'

describe('#Class_Dictionary') do
  before(:each) do
    Class_Dictionary.clear()
  end

  describe('.all') do
    it('this test should return an empty array when there are no words in the dictionary') do
      expect(Class_Dictionary.all).to(eq([]))
    end
  end

  # describe('.clear') do
  #   it('clears the dictionary of all words') do
      
  #   end
  # end

  describe('#save') do
    it('updates the dictionary with a new word') do
      class_dict = Class_Dictionary.new({
        :name => "Consistency",
        :id => nil
      })
      class_dict.save()
      class_dict2 = Class_Dictionary.new({
        :name => "Monotany",
        :id => nil
      })
      class_dict2.save()
      expect(Class_Dictionary.all).to(eq(false))
    end
  end
end