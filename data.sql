INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', 'Feb,3rd,2020', 0, true, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true,11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES
('Charmander', "2020-02-08", 0,false,-11 ),
('Plantmon', "2021-09-15", 2,true,-5.7 ),
('Squirtle', "1993-04-02", 3,false,-11 ),
('Angemon', "2005-06-12", 1,true,-45 ),
('Boarmon', "2005-06-7", 7,true,20.4 ),
('Blossom', "1998-10-13", 3,true,17 ),
('Ditto', "2022-05-14", 4,true,22 ),

INSERT INTO owners(full_name,age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell, 19'),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = s.id
FROM species s 
WHERE animals.name LIKE '%mon' AND s.name = 'Digimon';

UPDATE animals
SET species_id = s.id
FROM species s
WHERE animals.species_id IS NULL AND s.name = 'Pokemon';

UPDATE animals
SET owner_id = 1
WHERE name IN ('Agumon');

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon','Pikachu' );

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon','Plantmon' );

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander','Squirtle', 'Blossom' );

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon' );


INSERT INTO vets (name, age, date_of_graduation)
VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specialization (vet_id, species_id)
SELECT
  v.id, s.id
FROM
  vets v
JOIN
  species s ON v.name = 'William Tatcher' AND s.name = 'Pokemon'
UNION ALL
SELECT
  v.id, s.id
FROM
  vets v
JOIN
  species s ON v.name = 'Stephanie Mendez' AND s.name IN ('Pokemon', 'Digimon')
UNION ALL
SELECT
  v.id, s.id
FROM
  vets v
JOIN
  species s ON v.name = 'Jack Harkness' AND s.name = 'Digimon';


INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
  ((SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'William Tatcher'), '2020-05-24'),
  ((SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
  ((SELECT id from animals WHERE name = 'Gabumon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2021-02-02'),
  ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-01-05'),
  ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-03-08'),
  ((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-05-14'),
  ((SELECT id from animals WHERE name = 'Devimon'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
  ((SELECT id from animals WHERE name = 'Charmander'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2021-02-24'),
  ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-12-21'),
  ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'William Tatcher'), '2020-08-10'),
  ((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2021-04-07'),
  ((SELECT id from animals WHERE name = 'Squirtle'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
  ((SELECT id from animals WHERE name = 'Angemon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2020-10-03'),
  ((SELECT id from animals WHERE name = 'Angemon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2020-11-04'),
  ((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-01-24'),
  ((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-05-15'),
  ((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-02-27'),
  ((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-08-03'),
  ((SELECT id from animals WHERE name = 'Blossom'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
  ((SELECT id from animals WHERE name = 'Blossom'), (SELECT id from vets WHERE name = 'William Tatcher'), '2021-01-11');


-- We ran these commands for two times: 

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


