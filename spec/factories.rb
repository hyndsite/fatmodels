FactoryGirl.define do
      factory :user do
          sequence(:name) {|n| "Person #{n}"}
          sequence(:email) {|n| "example_#{n}@overtherainbow.com"}
          tax_rate {Random.new.rand(0.01..0.1).round(2)}
      end

      #product
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

      #order
      factory :order do
        tax {Random.new.rand(0.01..0.10).round(2)}
        association :user

        ignore do
          number_of_lines 1
        end

        after(:build) do |order, evaluator|
          order.order_lines << FactoryGirl.build(:order_line, order: order)
          order.seller_transaction = FactoryGirl.create(:seller_transaction, order: order)
        end
      end

      #order line
      factory :order_line do
        association :product
        order
        qty {Random.new.rand(1..5)}
      end

      #seller transaction
      factory :seller_transaction do
        order
      end
end
