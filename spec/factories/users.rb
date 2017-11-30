FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "hongha1994"
    password_confirmation "hongha1994"
  end
end
