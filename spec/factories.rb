FactoryGirl.define do
      factory :user do
          sequence(:name) {|n| "Person #{n}"}
          sequence(:email) {|n| "example_#{n}@overtherainbow.com"}
      end


nd
