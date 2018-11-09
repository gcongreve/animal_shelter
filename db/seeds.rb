require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require('pry-byebug')

Animal.delete_all
Customer.delete_all


animal_a = Animal.new({
  "name" => "Alf",
  "type" => "Dog",
  "date_admitted" => "10/10/10",
  "adoptable" => true,
  "trained" => true,
  "adopted" => false
  })

animal_b = Animal.new({
  "name" => "Bert",
  "type" => "Cat",
  "date_admitted" => "11/11/11",
  "adoptable" => true,
  "trained" => true,
  "adopted" => false
  })

  customer_a = Customer.new({
    "first_name" => "Dave",
    "last_name" => "Human",
    "number_of_adoptions" => 0
    })

  customer_b = Customer.new({
    "first_name" => "Steve",
    "last_name" => "Person",
    "number_of_adoptions" => 1
    })

  animal_a.save
  animal_b.save
  customer_a.save
  customer_b.save
