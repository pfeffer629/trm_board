require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryGirl.build(:post)
  end

  it "is valid with valid attributes" do
    expect(@post).to be_valid
  end

  it "is invalid without a title" do
    @post.title = nil
    expect(@post).to be_invalid
  end

  it "is invalid without a body" do
    @post.body = nil
    expect(@post).to be_invalid
  end

  it "is invalid without a user" do
    @post.user_id = nil
    expect(@post).to be_invalid
  end
end
