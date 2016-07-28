FactoryGirl.define do
  sequence(:package_name) { |n| "Package name #{n}" }
  sequence(:price) { |n| 10 + n }

  factory :package do
    name { generate(:package_name) }
    price

    factory :package_with_items do
      transient do
        item_count 3
      end

      after(:create) do |package, evaluator|
        create_list(:package_item, evaluator.item_count, package: package)
      end
    end
  end

  sequence(:item_name) { |n| "Item name #{n}" }
  sequence(:item_description) { |n| "Item Description #{n}" }

  factory :item do
    name { generate(:item_name) }
    description { generate(:item_description) }
  end

  factory :package_item do
    association :package
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
