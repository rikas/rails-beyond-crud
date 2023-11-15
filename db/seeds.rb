puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {
  name: "Dishoom",
  address: "7 Boundary St, London E2 7JE",
  rating: 5,
  chef_name: 'Gordon Ramsey'
}
pizza_east =  {
  name: "Pizza East",
  address: "56A Shoreditch High St, London E1 6PQ",
  rating: 4,
  chef_name: 'Avilez'
}

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"


# Restaurant.create! # will raise an exception if the create fails
# Restaurant.create

# restaurant = Restaurant.new
# restaurant.save # will just return true or false
# restaurant.save! # will raise an exception if the save fails
