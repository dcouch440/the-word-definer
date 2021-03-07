require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false

describe "create a definition path", {:type => :feature} do

  before :each do
    visit "/words"
    fill_in "word_input", :with => "Zap"
    click_on "New Word"
    visit "/word/1"
  end

  scenario "should be saved after a user submits one" do
    fill_in "definition_input", :with => "Electrocute"
    click_on "Enter Definition"
    page.has_content? "Electrocute"
  end

  scenario "should be able to be changed the definition" do
    click_on "Change definition"
    fill_in "update_definition", :with => "Electrocutes a person"
    click_on "Update"
    visit "word/1"
    page.has_content? "Electrocutes a person"
  end

  scenario "can update definitions multiple times" do
    (1..5).each do |iteration|
      click_on "Change definition"
      fill_in "update_definition", :with => "UPDATE_#{iteration}"
      click_on "Update"
      visit "word/1"
    end
    visit "word/1"
    page.has_content? "UPDATE_5"
  end

end