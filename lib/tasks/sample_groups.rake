namespace :db do
  desc "Fill groups with sample data"
  task populate_groups: :environment do
    Group.create!(name: "Example User",
                 description: "description",
                 category: "category",
                 photo: "photo")
    99.times do |n|
      name  = Faker::Name.name
      description = "description-#{n+1}"
      category  = "category-#{n+1}"
      photo  = "photo-#{n+1}"
      Group.create!(name: name,
                   description: description,
                   category: category,
                   photo: photo)
    end
  end
end