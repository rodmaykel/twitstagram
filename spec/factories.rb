FactoryGirl.define do
  factory :group do
    sequence(:name)  { |n| "Group #{n}" }
    sequence(:description) { |n| "description_#{n}"}
    sequence(:category) { |n| "category#{n}"}
    sequence(:photo) { |n| "photo#{n}"}
    factory :group_with_subjects do
      ignore do
        subjects_count 40
      end
      after(:create) do |group, evaluator|
        create_list(:subject, evaluator.subjects_count, group: group)
      end
    end
  end
  factory :subject do
    sequence(:twitter) { |n| "twitter_name_#{n}" }
    sequence(:instagram) { |n| "instagram_#{n}" }
    sequence(:photo) { |n| "photo_#{n}" }
    sequence(:name) { |n|  "Name_#{n}" }
    group
  end
end