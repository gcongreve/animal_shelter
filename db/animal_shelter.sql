DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE customers;

CREATE TABLE animals
(
  id SERIAL4 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  adoptable BOOLEAN,
  trained BOOLEAN,
  adopted BOOLEAN
);

CREATE TABLE customers
(
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  type VARCHAR(255),
  number_of_adoptions INT4
);

CREATE TABLE adoptions
(
  id SERIAL4 primary key,
  animal_id INT4 REFERENCES animals(id),
  customer_id INT4 REFERENCES customers(id)
);
