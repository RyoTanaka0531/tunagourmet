require 'rails_helper'

RSpec.describe Category, type: :model do
  it "カテゴリー名があれば有効" do
    @category = build(:category)
    expect(@category).to be_valid
  end

  it "カテゴリー名がなければ無効" do
    @category = build(:category, name: nil)
    is_expected.not_to be_valid
  end

  it "カテゴリー名が10文字以上なら無効" do
    @category = build(:category, name: "a"*11)
    is_expected.to be_invalid
  end
end
