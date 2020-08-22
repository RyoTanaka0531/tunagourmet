require 'rails_helper'

RSpec.describe Buyer, type: :model do

  it "屋号、屋号(カナ),メールアドレス,パスワードがあれば有効" do
    @buyer = build(:buyer)
    expect(@buyer).to be_valid
  end

  it "屋号がなければ無効" do
    @buyer = build(:buyer, company_name: nil)
    is_expected.not_to be_valid
  end

  it "屋号(カナ)がなければ無効" do
    @buyer = build(:buyer, kana_company_name: nil)
    is_expected.not_to be_valid
  end
  it "メールアドレスがなければ無効" do
    @buyer = build(:buyer, email: nil)
    is_expected.not_to be_valid
  end
  it "登録済みのメールアドレスでは登録できない" do
    @buyer1 = build(:buyer)
    @buyer2 = build(:buyer)
    is_expected.not_to be_valid
  end
  it "パスワードがなければ無効" do
    @buyer = build(:buyer, password: nil)
    is_expected.not_to be_valid
  end

  it "passwordとpassword_comfirmationが異なる場合保存できない" do
    @buyer = build(:buyer, password: "password", password_confirmation: "passward")
    is_expected.not_to be_valid
  end
end
