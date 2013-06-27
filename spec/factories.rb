FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    username 'chrislawrence'
    password 'password'
    password_confirmation 'password'
  end
end
