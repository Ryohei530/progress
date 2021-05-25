require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /rank" do
    it "returns http success" do
      get "/rank"
      expect(response).to have_http_status(:success)
    end
  end

end

RSpec.describe "練習" do 
  it "1 + 1 は 2になる" do
    expect(1 + 1).to eq 2
  end
end

RSpec.describe User do
  describe '#greet' do
    let(:user){ User.new(name: "たろう", age: age) }
    subject { user.greet }
    context "12いかの場合" do
      let(:age){ 12 }
      it { is_expected.to eq "ぼくはたろうだよ" }
    end
    context '13歳以上の場合' do
      let(:age){ 13 }
      it { is_expected.to eq '僕はたろうです。' }
    end
  end
end