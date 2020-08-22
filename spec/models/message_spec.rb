require 'rails_helper'

RSpec.describe Message, type: :model do
  it "メッセージが入力されていれば有効" do
    @chat = build(:chat)
    @message = @chat.messages.build(
      chat_id: 1,
      content: "hello"
    )
    expect(@message).to be_valid
  end

  it "メッセージが101文字以上だったら無効" do
    @message = build(:message, content: "a"*101)
    is_expected.to be_invalid
  end
end
