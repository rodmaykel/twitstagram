FactoryGirl.define do
  factory :group do
    sequence(:name)  { |n| "Group #{n}" }
    sequence(:description) { |n| "description_#{n}"}
    sequence(:category) { |n| "category#{n}"}
    sequence(:photo) { |n| "photo#{n}"}
  end
  factory :subject do
    twitter "rodmaykel"
    instagram "777777"
    photo "photo"
    name "Rod Michael Coronel"
    group
  end
end