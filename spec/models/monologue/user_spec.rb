require 'spec_helper'

RSpec.describe Monologue::User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  context "delete user" do
    let(:user_without_post) { FactoryBot.build(:user) }
    let(:user_with_post) do
      FactoryBot.build(:user_with_post)
    end

    let(:user) { Monologue::User.new }

    it "should be able to delete another user that does not have any posts" do
      user.can_delete?(user_without_post).should be true
    end

    it "should not be able to delete itself" do
      user.can_delete?(user).should be false
    end

    it "should not be able to delete a user with posts" do
      user.can_delete?(user_with_post).should be false
    end
  end

end
