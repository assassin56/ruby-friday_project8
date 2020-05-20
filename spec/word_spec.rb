require 'rspec'
require 'pry'
require 'word'
require 'definition'

describe('#Word') do
  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it('this test should return an empty array when there are no words in the dictionary') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears the dictionary of all words') do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({:name => "Monotony", :id => nil})
      class_dict2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('this test should find a word by id') do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({:name => "Monotony", :id => nil})
      class_dict2.save()
      expect(Word.find(class_dict.id)).to(eq(class_dict))
    end
  end

  describe('.search') do
    it("returns an array of words that have a name that includes the search term regardless of case") do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({:name => "Monotony", :id => nil})
      class_dict2.save()
      class_dict3 = Word.new({:name => "Arbitrary", :id => nil})
      class_dict3.save()
      class_dict4 = Word.new({:name => "Thurough Consistency", :id => nil})
      class_dict4.save()
      expect(Word.search("consistency")).to(eq([[class_dict], [class_dict4]]))
    end
  end

  describe('#update') do
    it('updates a word based on id') do
      class_dict = Word.new({:name => "Word", :id => nil})
      class_dict.save()
      class_dict.update("Conceive")
      expect(class_dict.name).to(eq("Conceive")) 
    end
  end

  describe('#save') do
    it('updates the dictionary with a new word') do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({
        :name => "Monotony",
        :id => nil
      })
      class_dict2.save()
      expect(Word.all).to(eq([class_dict, class_dict2]))
    end
  end

  describe('#==') do
    it('checks for the same word if it has the same attributes as another word') do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({
        :name => "Consistency",
        :id => nil
      })
      class_dict2.save()
      expect(class_dict).to(eq(class_dict2))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      class_dict = Word.new({:name => "Consistency", :id => nil})
      class_dict.save()
      class_dict2 = Word.new({:name => "Monotony", :id => nil})
      class_dict2.save()
      class_dict.delete()
      expect(Word.all).to(eq([class_dict2]))
    end
  end
end