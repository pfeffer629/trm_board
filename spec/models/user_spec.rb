require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build(:user)
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is invalid without a first name" do
    @user.first_name = nil
    expect(@user).to be_invalid
  end

  it "is invalid without a last_name" do
    @user.last_name = nil
    expect(@user).to be_invalid
  end

  it "is invalid without an email address" do
    @user.email = nil
    expect(@user).to be_invalid
  end
end
