SELECT * 
FROM animals
WHERE name LIKE '%mon';

SELECT name 
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon' , 'Pikachu');

SELECT name , escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT * 
FROM animals
WHERE neutered = true;

SELECT * 
FROM animals
WHERE name != 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT name
FROM animals
WHERE neutered = true AND escape_attempts < 3;

-- Transaction begins here!
BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT * 
FROM animals;

ROLLBACK;
-- Transaction Reverted here!

SELECT * 
FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
-- Verifying!
SELECT * FROM animals;
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
-- Verifying!
SELECT * from animals;

BEGIN;
DELETE
FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT mysave_point;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO mysave_point;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 1;
COMMIT;
SELECT * from animals;

-- QUERIES
SELECT COUNT(*) 
FROM animals;

SELECT COUNT(*) 
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT neutered, 
AVG(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT species, 
MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species,
AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;

--------------------------------------------------------------------

SELECT animals.name, owners.full_name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners o
LEFT JOIN animals a ON o.id = a.owner_id;

SELECT s.name, COUNT(a.id) AS count
FROM species s
LEFT JOIN animals a ON s.id = a.species_id
GROUP BY s.name;

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
JOIN species s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.name
FROM animals a
JOIN owners o ON a.owner_id = o.id
WHERE a.escape_attempts = 0 AND o.full_name = 'Dean Winchester';

SELECT o.full_name, COUNT(a.id) AS count
FROM owners o
JOIN animals a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY count DESC
LIMIT 1;

----------------------------------------------------------------
SELECT a.name
FROM animals AS a
JOIN visits AS v ON a.id = v.animal_id
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animal_id)
FROM visits AS v
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';


SELECT v.name AS veterinarian_name, s.name AS species_name
FROM vets AS v
LEFT JOIN specialization AS sp ON v.id = sp.vet_id
LEFT JOIN species AS s ON sp.species_id = s.id;


SELECT a.name AS animal_name, v.visit_date
FROM animals AS a 
JOIN visits AS v ON a.id = v.animal_id
JOIN vets AS vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez'
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';


SELECT animal_id, COUNT(*) AS visit_count
FROM visits
GROUP BY animal_id
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name, v.visit_date
FROM visits AS v
INNER JOIN animals AS a ON v.animal_id = a.id
INNER JOIN vets AS vet ON v.vet_id = vet.id
WHERE vet.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.name AS animal_name, vet.name AS veterinarian_name, v.visit_date
FROM visits AS v
INNER JOIN animals AS a ON v.animal_id = a.id
INNER JOIN vets AS vet ON v.vet_id = vet.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS num_visits
FROM visits AS v
INNER JOIN vets AS vet ON v.vet_id = vet.id
INNER JOIN animals AS a ON v.animal_id = a.id
LEFT JOIN specialization AS sp ON vet.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.species_id IS NULL;

SELECT s.name, COUNT(*) AS num_visits
FROM visits AS v
INNER JOIN animals AS a ON v.animal_id = a.id
INNER JOIN species AS s ON a.species_id = s.id
WHERE v.vet_id IN (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY s.name
ORDER BY num_visits DESC
LIMIT 1;









