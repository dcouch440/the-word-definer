require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false



describe "create a definition path", {:type => :feature} do

  scenario "should be saved after a user submits one" do
    visit "/words"
    fill_in "word_input", :with => "Zap"
    click_on "New Word"
    visit "/words/1/definitions/new"
    fill_in "definition_input", :with => "Electrocute"
    click_on "Enter Definition"
    expect(page).to have_content "Electrocute"
  end

  scenario "should be able to be changed the definition" do
    word = Word.new(word: 'dogs').save()
    definition = Definition.new(definition: 'apples', glob_id: word.glob_id).save()
    url = "/words/#{word.glob_id}/definitions/#{definition.id}"
    visit (url + '/edit')
    fill_in "update_definition", :with => "Electrocutes a person"
    click_on "Update"
    expect(page).to have_content "Electrocutes a person"
  end

  scenario "should be able to delete the definition" do
    word = Word.new(word: 'dogs').save()
    definition = Definition.new(definition: 'apples', glob_id: word.glob_id).save()
    url = "/words/#{word.glob_id}/definitions/#{definition.id}"
    visit (url + '/edit')
    click_on "Delete Definition"
    visit url
    expect(page).to have_no_content "apples"
  end

end
