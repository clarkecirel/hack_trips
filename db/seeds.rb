10.times do
  Trip.create
    trip = Trip.create(
    name: Faker::Address.state,
    user_id: '1'
  ) 
    
  5.times do
    Location.create
      location = Location.create(
      name: Faker::Restaurant.name,
      trip_id: trip.id
    )

    Address.create(
      location_id: location.id,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: trip.name,
      zip: Faker::Address.zip
    ) 
  end
end  