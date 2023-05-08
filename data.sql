/* Populate database with sample data. */

INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Plantmon', '2021-11-15', 2, true, 5.7);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Squirtle', '1993-04-02', 3, false, 12.13);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Angemon', '2005-06-12', 1, true, 45);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals ( name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ( 'Ditto', '2022-05-14', 4, true, 22);

-- Insert data into the owners table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Update animals with species_id based on name
UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = 'Digimon'
)
WHERE name LIKE '%mon';

-- Update animals with species_id for Pokemon
UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = 'Pokemon'
)
WHERE name NOT LIKE '%mon';

-- Update animals with owner_id for each owner

-- Update animals with owner_id for Sam Smith owning Agumon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

-- Update animals with owner_id for Jennifer Orwell owning Gabumon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon';

-- Update animals with owner_id for Jennifer Orwell owning Pikachu
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Pikachu';

-- Update animals with owner_id for Bob owning Devimon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon';

-- Update animals with owner_id for Bob owning Plantmon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Plantmon';

-- Update animals with owner_id for Melody Pond owning Charmander
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander';

-- Update animals with owner_id for Melody Pond owning Squirtle
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Squirtle';

-- Update animals with owner_id for Melody Pond owning Blossom
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Blossom';

-- Update animals with owner_id for Dean Winchester owning Angemon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon';

-- Update animals with owner_id for Dean Winchester owning Boarmon
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Boarmon';



-- Insert data into vets table
INSERT INTO vets (name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- Insert data for specialities into specializations table
INSERT INTO specializations (vet_id, species_id)
VALUES
(1, 1),
(3, 2),
(3, 1),
(4, 2);

-- Inserting visits data into visits table
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
    (1, 1, '2020-05-24'),
    (1, 3, '2020-07-22'),
    (2, 4, '2021-02-02'),
    (7, 2, '2020-01-05'),
    (7, 2, '2020-03-08'),
    (7, 2, '2020-05-14'),
    (3, 3, '2021-05-04'),
    (8, 4, '2021-02-24'),
    (4, 2, '2019-12-21'),
    (4, 1, '2020-08-10'),
    (4, 2, '2021-04-07'),
    (9, 3, '2019-09-29'),
    (5, 4, '2020-10-03'),
    (5, 4, '2020-11-04'),
    (6, 2, '2019-01-24'),
    (6, 2, '2019-05-15'),
    (6, 2, '2020-02-27'),
    (6, 2, '2020-08-03'),
    (10, 3, '2020-05-24'),
    (10, 1, '2021-01-11');



-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


