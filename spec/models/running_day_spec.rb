require 'rails_helper'

RSpec.describe RunningDay, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:running_day) { FactoryBot.build(:running_day, user_id: user.id) }
  
  it "is valid" do
    expect(running_day).to be_valid
  end
  
  it "is invalid without user_id" do
    running_day.user_id = nil
    expect(running_day).to_not be_valid 
  end
  
  it "is invalid without start_date" do
    running_day.start_date = " "
    expect(running_day).to_not be_valid
  end
  
  it "is invalid without date" do
    running_day.date = " "
    expect(running_day).to_not be_valid
  end
  
  it "is invalid without s_or_c" do
    running_day.s_or_c = nil
    expect(running_day).to_not be_valid
  end
  
  it "is invalid without r_days" do
    running_day.r_days = " "
    expect(running_day).to_not be_valid
  end
end
