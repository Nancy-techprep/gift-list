unless Rails.env.production?
  namespace :dev do
    desc "TODO"
    task sample_data: :environment do
      puts "adding sample data"
      5.times do |i|
        # Create User
        username = Faker::Games::SuperMario.character.downcase.split(" ").join("-")
        user = User.find_or_create_by(
          email: "#{username}@example.com",
          username: username,
        ) do |u|
          u.password = "password"
        end

        # Create loved_one

        # create gift

        # Create occasion
      end
    end
  end
end
