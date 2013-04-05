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

        Product.create!(name: 'Hot Wheel Pack',
                                price: 5.89)

        10.times do |n|
            name = "Product #{n+1}"
            price = Random.new.rand(1.0..20.00).round(2)
            Product.create(name: name,
                                   price: price)
        end
    end
end
