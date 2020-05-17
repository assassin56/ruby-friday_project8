# integration tests

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a dictionary path', {:type => :feature}) do
  it('creates a dictionary and then goes to the dictionary page') do
    visit('/dictionary')
    click_on('Add a a new word!')
  end
end