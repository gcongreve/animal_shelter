require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/adoption.rb')
require('pry-byebug')

Animal.delete_all
Customer.delete_all


animal_a = Animal.new({
  "name" => "Alf",
  "species" => "Dog",
  "type" => "Mongrel",
  "date_admitted" => "10/10/10",
  "healthy" => true,
  "trained" => true,
  })

animal_b = Animal.new({
  "name" => "Bert",
  "species" => "Cat",
  "type" => "Tabby",
  "date_admitted" => "11/11/11",
  "healthy" => true,
  "trained" => true,
  })

  animal_a.save
  animal_b.save

  customer_a = Customer.new({
    "first_name" => "Dave",
    "last_name" => "Human",
    })

  customer_b = Customer.new({
    "first_name" => "Steve",
    "last_name" => "Person",
    })

  customer_a.save
  customer_b.save

  adoption_a = Adoption.new({
    "animal_id" => animal_a.id,
    "customer_id" => customer_a.id,
    })

  adoption_b = Adoption.new({
    "animal_id" => animal_b.id,
    "customer_id" => customer_b.id,
    })

  adoption_a.save
  adoption_b.save
