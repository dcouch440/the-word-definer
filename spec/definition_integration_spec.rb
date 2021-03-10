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
    click_on "Change Definition"
    fill_in "update_definition", :with => "Electrocutes a person"
    click_on "Update"
    visit "word/1"
    expect(page).to have_content "Electrocutes a person"
  end

  scenario "should be able to update definitions multiple times" do
    (1..20).each do |index|
      visit "/word/1"
      click_on "Change Definition"
      fill_in "update_definition", :with => "TEST_DEFINE_#{index}"
      click_on "Update"
    end
    visit "/word/1"
    expect(page).to have_content "TEST_DEFINE_20"
  end

  scenario "should be able to delete the definition" do
    visit "/word/1/change/definition"
    click_on "Delete Definition"
    visit '/word/1'
    expect(page).to have_no_content "Electrocutes a Person"
  end

end