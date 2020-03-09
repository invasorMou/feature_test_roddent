require "rails_helper"

RSpec.feature "User see the index page" do
  fixtures :users

  scenario "they see the posts index page" do
    page_title = "Posts" 
    visit root_path
    expect(page).to have_text page_title
  end 
  
  scenario "they see the lastest posts" do
    lastest_post = posts(:capybara)
    
    visit root_path
    expect(page).to have_text lastest_post.title
  end 
  
  scenario "clicking a post should redirect to the show page" do
    post = posts(:rspec)
    post2 = posts(:capybara)
    
    visit root_path
    click_link post.title
    
    expect(page).to have_text post.title
    expect(page).to_not have_text post2.title
  end 
  
end