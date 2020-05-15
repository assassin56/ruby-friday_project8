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
      expect(Class_Dictionary.all).to(eq(false))
    end
  end
end