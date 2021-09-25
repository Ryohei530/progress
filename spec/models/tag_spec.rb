require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.build(:tag) }
  
  it "is valid tag" do
    expect(tag).to be_valid
  end
  
  it "is invalid without name" do
    tag.name = " "
    expect(tag).to_not be_valid
  end
end
