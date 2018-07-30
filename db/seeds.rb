# Destroy all previous db entries
Pet.destroy_all
User.destroy_all

5.times do
  user = User.new(
  email: Faker::Internet.email,
  password: Faker::Seinfeld.character,
)
user.save!
pet = Pet.new(
    name: Faker::Dog.name,
    species: "dog",
    address: Faker::Address.full_address,
    size: ["microscopic", "small", "medium", "large", "extra-large", "monster-sized"].sample,
    details: Faker::Seinfeld.quote,
    owner: user
    )
  pet.save!
end



