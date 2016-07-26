FactoryGirl.define do
  sequence(:product_name) { |n| "Product name #{n}" }
  sequence(:price) { |n| 10 + n }

  factory :product do
    name { generate(:product_name) }
    price

    factory :product_with_items do
      transient do
        item_count 3
      end

      after(:create) do |product, evaluator|
        create_list(:product_item, evaluator.item_count, product: product)
      end
    end
  end

  sequence(:item_name) { |n| "Item name #{n}" }
  sequence(:item_description) { |n| "Item Description #{n}" }

  factory :item do
    name { generate(:item_name) }
    description { generate(:item_description) }
  end

  factory :product_item do
    association :product
    association :item
  end

  sequence(:first_name) { |n| "User first name #{n}" }
  sequence(:last_name) { |n| "User last name #{n}" }
  sequence(:email) { |n| "#{n}@example.com" }
  sequence(:email_confirmation) { |n| "#{n}@example.com" }
  sequence(:phone_number) { |n| "012-345-678#{n}" }

  factory :user do
    first_name
    last_name
    email 
    email_confirmation
    password "password"
    password_confirmation "password"
    phone_number
    role 0
  end

end
