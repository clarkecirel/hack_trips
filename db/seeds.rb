name = ['street' ,'city', 'zip', 'state']
10.times do 
  name = Address.create(
    street: Faker::Address.street_address 
    city: Faker::Address.city
    state: Faker::Address.state
    zip: Faker::Address.zip
  )

end
  # 10.times do
    