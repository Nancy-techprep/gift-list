unless Rails.env.production?
  namespace :dev do
    desc "TODO"
    task sample_data: :environment do
      puts "adding sample data"
      5.times do |i|
        # Create Giver
        username = Faker::Games::SuperMario.character.downcase.split(" ").join("-")
        giver = User.find_or_create_by(
          email: "#{username}@example.com",
          username: username,
        ) do |u|
          u.password = "password"
        end

        # Create loved_one
        name = Faker::Games::SuperMario.character.downcase.split(" ").join("-")
        relationship = Faker::Relationship.familial
        loved_one = giver.loved_ones.create(
          name: name,
          relationship: relationship
        )
        
        # Create occasion
        date = Faker::Date.in_date_period
        name = "birthday"
        occasion = giver.occasions.create(
          name: name,
          date: date,
          loved_one: loved_one,
        )

        #Faker::Commerce.price
        # Generate a random brand
        #Faker::Commerce.brand #=> "Apple"

        # Generate a random vendor
        # Faker::Commerce.vendor #=> "Walmart"

        # create gift
        note = Faker::Commerce.product_name
        gift = giver.gifts.create(
          note: note,
          occasion: occasion,
          loved_one: loved_one,
        )
      end
    end
  end
end
