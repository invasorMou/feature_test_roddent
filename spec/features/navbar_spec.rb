require "rails_helper"

RSpec.feature "User see the navbar in top of the pages" do
  scenario "they see the home link in the navbar" do
    visit root_path
    expect(page).to have_text 'Home'
  end 
  
end