require 'spec_helper'

RSpec.describe Monologue::Tag do
  before(:each) do
    @tag= FactoryBot.build(:tag)
  end

  it "is valid with valid attributes" do
    @tag.should be_valid
  end

  describe "validations" do
    it "is not possible to have save another tag with the same name" do
      FactoryBot.create(:tag, name: "foo")
      expect { FactoryBot.create(:tag, name: "foo") }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should require the name to be set" do
      expect { FactoryBot.create(:tag,name:nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
