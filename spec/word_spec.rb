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
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({:name => "Monotony", :id => nil})
      new_word2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('this test should find a word by id') do
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({:name => "Monotony", :id => nil})
      new_word2.save()
      expect(Word.find(new_word.id)).to(eq(new_word))
    end
  end

  describe('.search') do
    it("returns an array of words that have a name that includes the search term regardless of case") do
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({:name => "Monotony", :id => nil})
      new_word2.save()
      new_word3 = Word.new({:name => "Arbitrary", :id => nil})
      new_word3.save()
      new_word4 = Word.new({:name => "Thurough Consistency", :id => nil})
      new_word4.save()
      expect(Word.search("consistency")).to(eq([[new_word], [new_word4]]))
    end
  end

  describe('#update') do
    it('updates a word based on id') do
      new_word = Word.new({:name => "Word", :id => nil})
      new_word.save()
      new_word.update("Conceive")
      expect(new_word.name).to(eq("Conceive")) 
    end
  end

  describe('#save') do
    it('updates the dictionary with a new word') do
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({
        :name => "Monotony",
        :id => nil
      })
      new_word2.save()
      expect(Word.all).to(eq([new_word, new_word2]))
    end
  end

  describe('#==') do
    it('checks for the same word if it has the same attributes as another word') do
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({
        :name => "Consistency",
        :id => nil
      })
      new_word2.save()
      expect(new_word).to(eq(new_word2))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      new_word = Word.new({:name => "Consistency", :id => nil})
      new_word.save()
      new_word2 = Word.new({:name => "Monotony", :id => nil})
      new_word2.save()
      new_word.delete()
      expect(Word.all).to(eq([new_word2]))
    end
  end
end