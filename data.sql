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



