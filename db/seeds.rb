# creating users
puts "Cleaning database..."
User.destroy_all

puts "Creating 5 new users..."
5.times do
    User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name ,
    email: Faker::Internet.email,
    password: "topsecret",
    password_confirmation: "topsecret"
    )
end
puts "Finished users"
titles = ["SoftSerenity", "CloudComfort", "GentleGrace", "LuxeLoft", "CushyCare", "PurePlush", "FeatherSoft", "WhisperWipe", "VelvetValley", "PuffPurity", "SatinSoothe", "BlissBreeze", "TenderTouch", "DelicateDew", "SilkSavannah", "ComfortCotton", "FluffyFresh", "SereneSheen", "CozyCloud", "GentleGlide"]
thicknessese = ["Simple", "X 2", "X 3", "X 4", "X 5"]
colors = ["Black", "Gold", "Pink", "White", "Yellow"]
User.all.each do |user|
    puts "Creating 1 to 5 new toilet papers for user #{user.id}"
    rand(1..5).times.each do
        user.toilet_papers.create!({
            color: colors[rand(1..5)],
            thickness: thicknessese[rand(1..5)],
            scent: Faker::Dessert.flavor,
            price: Faker::Number.number(digits: 2),
            title: titles[rand(1..20)],
            description: "Mon papier toilette, c'est le plus écologique de tous! Fabrication artisale !!",
            photo_url: "image1.jpg",
            user:
        })
    end
end
puts "Finished toilet papers"
