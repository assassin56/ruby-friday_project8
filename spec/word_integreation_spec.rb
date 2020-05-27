require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('creates a word path', {:type => :feature}) do
  it('creates a word and then goes to the words page') do
    visit('/')
    click_on('Add a new word!')
    fill_in('name', :with => 'Consistency')
    click_on('Go!')
    expect(page).to have_content('Consistency')
  end
end

describe('creates a definition path', {:type => :feature}) do
  it('creates a definition and goes to the definition page') do
    word = Word.new({:name => 'Gold', :id => nil})
    word.save()
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'A form of currency')
    click_on('Add definition')
    expect(page).to have_content(false)
  end
end