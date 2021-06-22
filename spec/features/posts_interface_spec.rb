require 'rails_helper'

RSpec.feature "PostsInterfaces", type: :feature, js: true do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user2)
    @post = FactoryBot.create(:post)
    @posts = create_list(:brians, 30)
  end
  
  scenario "post interface" do
    log_in_as(@user)
    visit root_path
    
    expect(page).to have_css '.pagination'
    expect(page).to have_selector 'input#post_image'
    expect{
      click_button '投稿'
    }.to change(Post, :count).by(0)
    expect(page).to have_selector 'div#error_explanation'
    expect(page).to have_link '2', href: '/?page=2&post%5Bcontent%5D='
    
    
    content = "異議あり！　くらえ！　待った！　アマいな！"
    image_path = "#{Rails.root}/spec/fixtures/Cosmos01.jpg"
    expect{
      fill_in 'post[content]', with: content
      attach_file 'post[image]', image_path
      click_button '投稿'
    }.to change(Post, :count).by(1)
    expect(page).to have_title 'ホーム | Progress'
    expect(page).to have_content content
    expect(page).to have_selector "img[src$='Cosmos01.jpg']"
    
    expect{
      accept_alert do
        find(".dlt-post-#{@post.id}", text: "削除").click
      end
      sleep 3
    }.to change(Post, :count).by(-1)
    
    visit user_path(@user2)
    expect(page).to_not have_content '削除'
  end
end
