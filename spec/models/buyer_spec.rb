require 'rails_helper'

RSpec.describe Buyer, type: :model do

  it "屋号、屋号(カナ),メールアドレス,パスワードがあれば有効" do
    @buyer = Buyer.new(
      company_name: "farm",
      kana_company_name: "ファーム",
      email: "testman@example.com",
      password: "password",
    )
    expect(@buyer).to be_valid
  end

  it "屋号がなければ無効" do
    @buyer = Buyer.new(
      company_name: nil,
      kana_company_name: "ファーム",
      email: "testman@example.com",
      password: "password",
    )
    @buyer.valid?
    expect(@buyer.errors[:company_name]).to include("can't be blank")
  end
  it "屋号(カナ)がなければ無効" do
    @buyer = Buyer.new(
      company_name: "farm",
      kana_company_name: nil,
      email: "testman@example.com",
      password: "password",
    )
    @buyer.valid?
    expect(@buyer.errors[:kana_company_name]).to include("can't be blank")
  end
  it "メールアドレスがなければ無効" do
    @buyer = Buyer.new(
      company_name: "farm",
      kana_company_name: "ファーム",
      email: nil,
      password: "password",
    )
    @buyer.valid?
    expect(@buyer.errors[:email]).to include("can't be blank")
  end
  it "パスワードがなければ無効" do
    @buyer = Buyer.new(
      company_name: "farm",
      kana_company_name: "ファーム",
      email: "testman@example.com",
      password: nil,
    )
    @buyer.valid?
    expect(@buyer.errors[:password]).to include("can't be blank")
  end
end
