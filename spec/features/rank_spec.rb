require 'rails_helper'

RSpec.feature "Ranks", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal, user_id: user.id) }
  let!(:running_day) { FactoryBot.create_list(:running_day, 7, user_id: user.id) }
  let!(:r_day) { FactoryBot.create(:r_day, :day3) }
  let!(:r_day2) { FactoryBot.create(:r_day, :day5) }
  let!(:r_day3) { FactoryBot.create(:r_day, :day10) }
  let!(:r_day4) { FactoryBot.create(:r_day, :day20) }
  let!(:r_day5) { FactoryBot.create(:r_day, :day30) }

  before do
    log_in_as(user)
  end

  scenario "ranking" do
    click_link "ランキング"

    expect(page).to have_content "継続日数ランキング"
    within ".rank-1" do
      expect(page).to have_content "ナルト"
      expect(page).to have_content "30日"
    end
    within ".rank-2" do
      expect(page).to have_content "ヒカル"
      expect(page).to have_content "20日"
    end
    within ".rank-3" do
      expect(page).to have_content "ミツルギ"
      expect(page).to have_content "10日"
    end
    within ".rank-4" do
      expect(page).to have_content "brian"
      expect(page).to have_content "7日"
    end
    within ".rank-5" do
      expect(page).to have_content "ロックマン"
      expect(page).to have_content "5日"
    end
    within ".rank-6" do
      expect(page).to have_content "tanaka"
      expect(page).to have_content "3日"
    end
  end
end
