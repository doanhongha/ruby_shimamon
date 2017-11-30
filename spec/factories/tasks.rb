FactoryGirl.define do
  factory :task do
    name {Faker::Name.title}
    description "asdasdadsadasddaddadasda"
    status {Faker::Number.number(1)}
    deadline {Faker::Time.between(DateTime.now - 1, DateTime.now)}
    tag "1,2,3,4"
    # assign {[FactoryGirl.create(:user)]}
    deleted_at {Faker::Time.between(DateTime.now - 1, DateTime.now)}
    priority {Faker::Number.number(1)}
  end
end
