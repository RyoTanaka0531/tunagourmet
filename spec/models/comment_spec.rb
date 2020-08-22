require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメントが入力されていたら有効" do
    @post = build(:post)
    @comment = @post.comments.build(
      content: "test",
      post_id: 1
    )
    expect(@comment).to be_valid
  end

  it "コメントが入力されていなければ無効" do
    @comment = build(:comment, content: nil)
    is_expected.to be_invalid
  end

  it "コメントが100字以上だったら無効" do
    @comment = build(:comment, content: "a"*101)
    is_expected.to be_invalid
  end
end
