require 'rails_helper'

RSpec.describe Producer, type: :model do
  it "屋号、屋号(カナ),メールアドレス,パスワードがあれば有効" do
    @producer = build(:producer)
    expect(@producer).to be_valid
  end

  it "屋号がなければ無効" do
    @producer = build(:producer, company_name: nil)
    is_expected.not_to be_valid
  end

  it "屋号(カナ)がなければ無効" do
    @producer = build(:producer, kana_company_name: nil)
    is_expected.not_to be_valid
  end
  it "メールアドレスがなければ無効" do
    @producer = build(:producer, email: nil)
    is_expected.not_to be_valid
  end
  it "登録済みのメールアドレスでは登録できない" do
    @producer1 = build(:producer)
    @producer2 = build(:producer)
    is_expected.not_to be_valid
  end
  it "パスワードがなければ無効" do
    @producer = build(:producer, password: nil)
    is_expected.not_to be_valid
  end
end
