Pet.destroy_all
20.times do
  pet = Pet.new(
    name: Faker::Dog.name,
    species: "dog",
    address: Faker::Address.full_address,
    size: ["microscopic", "small", "medium", "large", "extra-large", "monster-sized"].sample,
    details: Faker::Seinfeld.quote,
    )
  pet.save!
end

