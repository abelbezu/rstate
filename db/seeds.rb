# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

neighborhoods = ["Bole", "Gergi", "Ayer Tena", "Old Airport", "Imperial", "Piasa"]
cities = ["Addis Ababa", "Adama", "Dire Dawa", "Mekele"]
listing_fors = ["rent", "sale"]
property_types = ["house", "apartment", "guest_house"]
floors = [1, 2, 3, 4, 5]
currencies = ["USD", "ETB"]
base_amount = 20000000

10.times do |n|
  user = User.new  
  user.email = "user_#{n}@rstate.com"
  user.password = '123456789'
  user.sign_in_count = 0
  user.save!

  agent = Agent.create({
    first_name: "Agent_#{n}",
    last_name: "Last_Name_#{n}",
    phone_number: Faker::PhoneNumber.cell_phone,
    user: user
  })

  10.times do 
    listing = Listing.create({
      title: Faker::Lorem.sentence ,
      description: Faker::Lorem.paragraph,
      listing_for: listing_fors.sample,
      agent: agent
    }) 

    house_detail = HouseDetail.create({
      property_type: property_types.sample,
      floors: floors.sample,
      bedrooms: (rand * 10).round + 1,
      bathrooms: (rand * 10).round + 1,
      area: (rand * 2000).round,
      listing: listing
    })

    location = Location.create({
      city: cities.sample,
      neighborhood: neighborhoods.sample,
      listing: listing
    })

    price = Price.create({
      amount: (rand *base_amount).round,
      currency: currencies.sample,
      negotiable: Faker::Boolean.boolean,
      listing: listing
    })
  end

end

