require 'rails_helper'

RSpec.feature "PostsInterfaces", type: :feature, js: true do
  
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user2) }
    let!(:post) { FactoryBot.create(:post) }
    let!(:post2) { user2.posts.create(content: "test") }
    let!(:goal) { user.create_goal }
    let!(:goal2) { user2.create_goal }
    let!(:post3) { user.posts.create(content: "test") }
    let!(:monthly_goal) { FactoryBot.create(:monthly_goal, user_id: user.id) }
    let!(:goal_action) { monthly_goal.goal_actions.create(content: "test action", number: 500) }
    let!(:monthly_goal2) { FactoryBot.create(:monthly_goal, user_id: user2.id) }
    let!(:goal_action2) { monthly_goal2.goal_actions.create(content: "test action", number: 500) }
    
  scenario "post interface" do
    
    log_in_as(user)
    visit root_path
    
    expect(page).to have_css '.content-inner'
    expect {
      click_button '投稿'
    }.to change(Post, :count).by(0)
    expect(page).to have_selector 'div#error_explanation'
    expect(page).to have_content 'つぶやきを入力してください'
    
    
    content = "異議あり！"
    image_path = "#{Rails.root}/spec/fixtures/Cosmos01.jpg"
    expect {
      fill_in 'post[content]', with: content
      attach_file "post[images][]", image_path, make_visible: true
      click_button '投稿'
    }.to change(Post, :count).by(1)
    expect(page).to have_title 'ホーム | Progress'
    expect(page).to have_content content
    expect(page).to have_selector "img[src$='Cosmos01.jpg']"
    
    expect {
      find(".card-link-#{post.id}").click
      expect(page).to have_link "削除"
      accept_alert do
        within ".card-box" do
          find(".card-dlt", text: "削除").click
        end
      end
      sleep 3
    }.to change(Post, :count).by(-1)
    
    expect(current_path).to eq root_path
    
    visit user_path(user2)
    # click_link "つぶやき"
    within ".user" do 
      page.all('.tnav-link')[4].click
    end
    
    find(".card-link-#{post2.id}").click
    expect(page).to_not have_content '削除'
    
    visit user_path(user)
    # click_link "つぶやき"
    within ".user" do 
      page.all('.tnav-link')[4].click
    end
    find(".card-link-#{post3.id}").click
    
    accept_alert do
      within ".card-box" do
        find(".card-dlt", text: "削除").click
      end
    end
    sleep 3
    
    expect(current_path).to eq post_user_path(user)
  end
end
