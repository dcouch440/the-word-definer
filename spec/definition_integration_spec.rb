require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false

describe "create a definition path", {:type => :feature} do

  scenario "should be saved after a user submits one" do
    visit "/words"
    fill_in "word_input", :with => "Zap"
    click_on "New Word"
    visit "/word/1"
    fill_in "definition_input", :with => "Electrocute"
    click_on "Enter Definition"
    expect(page).to have_content "Electrocute"
  end

  scenario "should be able to be changed the definition" do
    visit "/word/1"
    click_on "Change definition"
    fill_in "update_definition", :with => "Electrocutes a person"
    click_on "Update"
    visit "word/1"
    expect(page).to have_content "Electrocutes a person"
  end

end