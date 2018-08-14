require 'spec_helper'
RSpec.describe "archive" do
  before(:each) do
    FactoryBot.build(:post, title: "post X", published_at: '2011-11-11')
  end

  it "lists archived posts" do
    visit "/monologue"
    within(".archive") do
      page.should have_content("post X")
      page.should have_content("2011")
      page.should have_content("November")
    end
  end
end
