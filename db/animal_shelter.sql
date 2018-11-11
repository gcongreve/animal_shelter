DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE customers;

CREATE TABLE animals
(
  id SERIAL4 primary key,
  name VARCHAR(255),
  species VARCHAR(255),
  type VARCHAR(255),
  date_admitted VARCHAR(255),
  healthy BOOLEAN,
  trained BOOLEAN
);

CREATE TABLE customers
(
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL4 primary key,
  animal_id INT4 REFERENCES animals(id),
  customer_id INT4 REFERENCES customers(id)
);
