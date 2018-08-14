# Read about factories at http://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :user, class: Monologue::User do
    sequence(:name){|n| "test #{n}"}
    sequence(:email){ |n| "test#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :user_with_post, class: Monologue::User, parent: :user do |user|
    after(:create) { |u| FactoryBot.build(:post, user: u) }
  end
end
