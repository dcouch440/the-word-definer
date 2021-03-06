require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false

describe "create a word path", {:type => :feature} do

  before :each do
    visit "/words"
    fill_in "word_input", :with => "Zap"
    click_on "New Word"
  end

  scenario "creates an word and lists it on the page" do
    page.has_content? "Zap"
  end

  scenario "creates a link to fallow that words id in the link" do
    page.has_link? 'word/1'
  end

  scenario "adds more than one word" do
    (1..5).each do |int|
      fill_in "word_input", :with => "TEST_#{int}"
      click_on "New Word"
    end
    (page.has_link? "word/6") && (page.has_content? "TEST_5")
  end

  scenario "deletes the word when told too" do
    visit "word/1/change"
    click_on "Delete Word"
    page.has_no_link? 'word/1'
  end

end