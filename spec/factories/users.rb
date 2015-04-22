FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "User"
    full_name "Test User"
    gender "male"
    location "Denver"
    image "socialteering.png"
    phone_number "5552223333"
    email "TestUser@example.com"
    provider "Facebook"
    uid "12345"
    token "MyString"
    login "MyString"
  end

  factory :incomplete_user, class: User do
    first_name "Test"
    last_name "User"
    full_name "Test User"
  end
end
