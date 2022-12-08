/* Database schema to keep the structure of entire database. */

-- CREATE TABLE animals (
--   id INT GENERATED ALWAYS AS IDENTITY,
--   name VARCHAR(100),
--   date_of_birth DATE,
--   escape_attempts INT,
--   neutered BOOLEAN,
--   weight_kg DECIMAL);

--   ALTER TABLE animals
--   ADD COLUMN species VARCHAR(100);

/* Tables for owners and species. */

-- CREATE TABLE owners (
--   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--   full_name VARCHAR(100),
--   age INT);

-- CREATE TABLE species (
--   id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--   name VARCHAR(100));

  -- ALTER TABLE animals DROP COLUMN species;
  -- ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species (id);
  -- ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
  -- ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners (id);
  -- ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

  ALTER TABLE animals ADD PRIMARY KEY (id);
