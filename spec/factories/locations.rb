FactoryGirl.define do
  factory :location do
    sequence :postal_code do |x|
      "8023#{x}"
    end
    city "Denver"
    country "US"
  end
end
