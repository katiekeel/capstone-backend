FactoryBot.define do
  factory :tank do
    sequence :number do |x|
      "Number #{x}"
    end

    sequence :level do |x|
      "Level #{x}"
    end
  end
end
