/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(50)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

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

-- Step 3: Remove the "species" column
ALTER TABLE animals
DROP COLUMN IF EXISTS species;

