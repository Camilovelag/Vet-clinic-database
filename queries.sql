/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01'AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Transactions */
BEGIN;
UPDATE animals SET species = 'unespecified' WHERE species IS NULL;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*(-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*(-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

/* Answers */
SELECT COUNT (*) FROM animals;
SELECT COUNT (*) FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT neutered, MAX (escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX (weight_kg), MIN (weight_kg) FROM animals GROUP BY species;
SELECT species, AVG (escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Queries related to owners and species */
SELECT A.name, O.full_name FROM animals A INNER JOIN owners O ON A.owner_id = O.id WHERE O.full_name = 'Melody Pond';
SELECT A.name, S.name FROM animals A INNER JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';
SELECT O.full_name, A.name FROM animals A FULL JOIN owners O ON A.owner_id = O.id;
SELECT S.name, COUNT (*) FROM animals A FULL JOIN species S ON S.id = A.species_id GROUP BY S.name;
SELECT O.full_name, A.name FROM owners O FULL JOIN animals A ON O.id = A.owner_id WHERE O.full_name = 'Jennifer Orwell';
SELECT O.full_name, A.name FROM owners O FULL JOIN animals A ON O.id = A.owner_id WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;
SELECT O.full_name FROM owners O FULL JOIN animals A ON O.id = A.owner_id GROUP BY O.full_name ORDER BY COUNT (*) DESC LIMIT 1;

/* Queries related to visits, vets, and specializations */
SELECT A.name FROM vets 
  INNER JOIN visits ON vets.id = visits.vet_id
  INNER JOIN animals A ON A.id = visits.animal_id
  WHERE vets.name = 'William Tatcher'
  ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT (*) FROM vets
  INNER JOIN visits ON vets.id = visits.vet_id
  WHERE vets.name = 'Stephanie Mendez'
  GROUP BY vets.name;

SELECT vets.name, species.name FROM vets
  FULL JOIN specializations ON vets.id = specializations.vet_id
  FULL JOIN species ON species.id = specializations.species_id;

SELECT A.name FROM vets
  INNER JOIN visits ON vets.id = visits.vet_id
  INNER JOIN animals A ON A.id = visits.animal_id
  WHERE vets.name = 'Stephanie Mendez'
  AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT A.name FROM animals A
  INNER JOIN visits ON A.id = visits.animal_id
  GROUP BY A.name
  ORDER BY COUNT (*) DESC LIMIT 1;

SELECT A.name FROM vets
  INNER JOIN visits ON vets.id = visits.vet_id
  INNER JOIN animals A ON A.id = visits.animal_id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT A, vets, visits.date_of_visit FROM vets
  INNER JOIN visits ON vets.id = visits.vet_id
  INNER JOIN animals A ON A.id = visits.animal_id
  ORDER BY visits.date_of_visit DESC LIMIT 1;

  SELECT COUNT (*) FROM vets
  FULL JOIN visits ON vets.id = visits.vet_id
  FULL JOIN specializations ON vets.id = specializations.vet_id
  WHERE specializations.species_id IS NULL
  GROUP BY vets.name;

  SELECT species.name FROM visits
  INNER JOIN animals A ON A.id = visits.animal_id
  INNER JOIN species ON species.id = A.species_id
  GROUP BY species.name
  ORDER BY COUNT (*) DESC LIMIT 1;
