require_relative('../models/animal.rb')
require('pry-byebug')

Animal.delete_all

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

  animal_a.save
  animal_b.save
