namespace :db do
    desc "Fill database with sample data"
    task populate: :environment do
        User.create!(name: "Max McCarty",
                            email: "max.mccarty@verizon.net")
        99.times do |n|
            name = Faker::Name.name
            email = "example-#{n+1}@myapp.com"
            User.create(name: name,
                               email: email)
        end
    end
end
