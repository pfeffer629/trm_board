require 'faker'

FactoryGirl.define do
  factory :user do
    first_name { Faker::Pokemon.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password "password" 
    password_confirmation "password" 
  end 

  factory :post do |f|
    f.title { Faker::Pokemon.name }
    f.body { Faker::TheFreshPrinceOfBelAir.quote }
    association :user, factory: :user, strategy: :create
  end

  factory :comment do |f|
    f.body { Faker::MostInterestingManInTheWorld.quote }
    association :user, factory: :user, strategy: :create
    association :post, factory: :post, strategy: :create
  end
end