require 'rspec'
require 'pry'
require 'class_definitions'

describe('#Class_Definitions') do
  before(:each) do
    Class_Definitions.clear()
  end

  describe('.all') do
    it('this test should return an empty list of definitions when there are no words') do
      expect(Class_Definitions.all).to(eq(false))
    end
  end
end