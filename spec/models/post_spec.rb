require 'rails_helper'

RSpec.describe Post, type: :model do
  it "見出し、内容が入力されていれば有効" do
    @post = build(:post)
    expect(@post).to be_valid
  end

  it "見出しが入力されていなければ無効" do
    @post = build(:post, heading: nil)
    is_expected.to be_invalid
  end

  it "見出しが20文字以上なら無効" do
    @post = build(:post, heading: "a"*21)
    is_expected.to be_invalid
  end

  it "内容が入力されていなければ無効" do
    @post = build(:post, content: nil)
    is_expected.to be_invalid
  end
end
