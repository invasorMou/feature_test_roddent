require "rails_helper"

RSpec.feature "User see the index page" do
  fixtures :posts

  scenario "they see the posts index page" do
    link_title = "Posts" 
    visit root_path
    expect(page).to have_text link_title
  end 
  
  scenario "they see the lastest posts" do
    lastest_post = posts(:capybara)
    
    visit root_path
    expect(page).to have_text lastest_post.title
  end 
  
  scenario "clicking a post should redirect to the show page" do
    lastest_post = posts(:rspec)
    
    visit root_path
    expect(page).to have_text lastest_post.title
  end 
  
end