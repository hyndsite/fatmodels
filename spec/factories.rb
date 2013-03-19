FactoryGirl.define do
      factory :user do
          sequence(:name) {|n| "Person #{n}"}
          sequence(:email) {|n| "example_#{n}@overtherainbow.com"}
      end

      factory :product do
        sequence(:name) {|n| "Product #{n}"}
        price {Random.new.rand(10...30)}
      end

      factory :market_place do
        association :user
        sequence(:name) {|n| "Market #{n}"}
      end

      trait :with_products do
        ignore do
          number_of_products 3
        end

        after(:create) do |market_place, evaluator|
          FactoryGirl.create_list :product, evaluator.number_of_products, market_place: market_place
        end
      end

      factory :order do
        tax {Random.new.rand(0.01..0.10).round(2)}

        ignore do
          number_of_lines 1
        end

        after(:create) do |order, evaluator|
          FactoryGirl.create_list :order_line, evaluator.number_of_lines, order: order
        end
      end

      factory :order_line do
        association :product
        association :order
        qty {Random.new.rand(1..5)}
      end
end
