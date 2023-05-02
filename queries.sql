/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- first tranasction
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- second transcation
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

--third transcation
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

--fourth transaction
BEGIN;
SAVEPOINT delete_date;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_date;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- Calculate answers
SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS animals_never_tried_escaped FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS average_animal_weight FROM animals;

SELECT CASE WHEN neutered THEN 'Neutered' ELSE 'Not Neutered' END AS escape_type, SUM(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY total_escape_attempts DESC;

SELECT species, MIN(weight_kg) AS minimum_weight, MAX(weight_kg) AS maximum_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) from animals 
WHERE date_of_birth BETWEEN '1990/01/01' AND '2000/01/01'
GROUP BY species;












