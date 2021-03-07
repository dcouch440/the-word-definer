require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set :show_exceptions, false

describe "create a word path", {:type => :feature} do

  before :each do
    visit "/words"
  end

  scenario "creates an word and lists it on the page" do
    fill_in "word_input", :with => "Zap"
    click_on "New Word"
    expect(page).to have_content "Zap"
  end

  scenario "creates a link to fallow that words id in the link" do
    expect(page).to have_link href: 'word/1'
  end

  scenario "deletes the word when told too" do
    visit "/word/1/change"
    click_on "Delete Word"
    expect(page).to have_no_link href: 'word/1'
  end

  scenario "adds more than one word" do
    (1..4).each do |int|
      fill_in "word_input", :with => "TEST_LOOP_1_#{int}"
      click_on "New Word"
    end
    expect(page).to have_link href: 'word/5'
  end

  scenario "uses global index to index words in ascending order" do
    (1..5).each do |int|
      fill_in "word_input", :with => "TEST_LOOP_2_#{int}"
      click_on "New Word"
    end
    expect(page).to have_content "TEST_LOOP_2_5"
  end

end