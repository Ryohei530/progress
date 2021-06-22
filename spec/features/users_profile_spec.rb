require 'rails_helper'

RSpec.feature "UsersProfiles", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @posts = create_list(:brians, 30)
  end
  
  scenario "profile display" do
    visit user_path(@user)
    expect(page).to have_content "brian"
    expect(page).to have_title "#{@user.name} | Progress"
    expect(page).to have_css '.post-count', count: 25
    expect(page).to have_content "Posts (#{@user.posts.count})"
    expect(page).to have_css '.pagination'
    
    @user.posts.page(1).each do |post|
      expect(page).to have_content post.content 
    end
    
  end
end
