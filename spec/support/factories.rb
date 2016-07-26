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
        create_list(:item, evaluator.item_count, product: product)
      end
    end
  end

  sequence(:item_name) { |n| "Item name #{n}" }
  sequence(:item_description) { |n| "Item Description #{n}" }

  factory :item do
    name { generate(:item_name) }
    description { generate(:item_description) }
  end
end
