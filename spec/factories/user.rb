FactoryGirl.define do
 factory :user do
   email "c@test.com"
   username "chris"
   password "test"
   password_confirmation "test"
   first_name "Chris"
   last_name "Lawrence"
   website "http://chrislawrence.me"
 end
end
