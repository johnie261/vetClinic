/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(50),
    species_id INT REFERENCES species(id),
    owner_id INT REFERENCES owners(id)
);
-- add species column
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

-- Drop the species column
ALTER TABLE animals
DROP COLUMN IF EXISTS species;

-- create table owners
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50),
    age INT
);

-- create table species
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

-- Remove the "species" column
ALTER TABLE animals
DROP COLUMN IF EXISTS species;

-- Add the "species_id" column as a foreign key referencing the "species" table
ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species (id);

-- Add the "owner_id" column as a foreign key referencing the "owners" table
ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owners (id);



-- create vets table
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  age INTEGER,
  date_of_graduation DATE
);

-- create a join table called specializations
CREATE TABLE specializations (
  vet_id INT,
  species_id INT,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets (id),
  FOREIGN KEY (species_id) REFERENCES species (id)
);

-- create a join table caled visits
CREATE TABLE visits (
  animal_id INT,
  vet_id INT,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);




