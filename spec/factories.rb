FactoryGirl.define do
 factory :user do
   email 'chris@example.com'
   password 'test'
   password_confirmation 'test'
   name 'Chris Lawrence'
 end
end
