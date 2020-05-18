# integration tests

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a dictionary path', {:type => :feature}) do
  it('creates a dictionary and then goes to the dictionary page') do
    visit('/dictionary')
    save_and_open_page
    click_on('Add a new word!')
    fill_in('name', :with => 'Consistency')
    click_on('Go!')
    expect(page).to have_content('Consistency')
  end
end