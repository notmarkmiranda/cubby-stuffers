FactoryGirl.define do
  factory :product do
    name
    unit_price

    factory :product_with_items do
      transient do
        item_count 3
      end

      after(:create) do |product, evaluator|
        create_list(:items, evaluator.item_count, product: product)
      end
    end
  end

  factory :item do
    name
    description
  end
end
