require 'rails_helper'

RSpec.describe Producer, type: :model do
  it "屋号、屋号(カナ),メールアドレス,パスワードがあれば有効" do
    @producer = build(:producer)
    expect(@producer).to be_valid
  end

  it "屋号がなければ無効" do
    @producer = build(:producer, company_name: nil)
    @producer.valid?
    expect(@producer.errors[:company_name]).to include("can't be blank")
  end

  it "屋号(カナ)がなければ無効" do
    @producer= build(:producer, kana_company_name: nil)
    @producer.valid?
    expect(@producer.errors[:kana_company_name]).to include("can't be blank")
  end
  it "メールアドレスがなければ無効" do
    @producer = build(:producer, email: nil)
    @producer.valid?
    expect(@producer.errors[:email]).to include("can't be blank")
  end
  it "パスワードがなければ無効" do
    @producer = build(:producer, password: nil)
    @producer.valid?
    expect(@producer.errors[:password]).to include("can't be blank")
  end
end
