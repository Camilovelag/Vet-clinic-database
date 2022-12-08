/*Queries that provide answers to the questions from all projects.*/

-- SELECT * FROM animals WHERE name LIKE '%mon';
-- SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01'AND '2019-12-31';
-- SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
-- SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
-- SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
-- SELECT * FROM animals WHERE neutered = true;
-- SELECT * FROM animals WHERE name != 'Gabumon';
-- SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transactions */

-- BEGIN;
-- UPDATE animals SET species = 'unespecified' WHERE species IS NULL;
-- SELECT * FROM animals;
-- ROLLBACK;

-- BEGIN;
-- UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
-- COMMIT;
-- SELECT * FROM animals;

-- BEGIN;
-- DELETE FROM animals;
-- ROLLBACK;
-- SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*(-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*(-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
