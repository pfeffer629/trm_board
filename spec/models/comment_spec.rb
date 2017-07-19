require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryGirl.build(:comment)
  end

  it "is valid with valid attributes" do
    expect(@comment).to be_valid
  end

  it "is not valid without a body" do
    @comment.body = nil
    expect(@comment).to be_invalid
  end

  it "is not valid without a user" do
    @comment.user_id = nil
    expect(@comment).to be_invalid
  end

  it "is not valid without a post" do
    @comment.post_id = nil
    expect(@comment).to be_invalid
  end
end
