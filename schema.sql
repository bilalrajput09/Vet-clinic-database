CREATE TABLE animals(
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
date_of_birth DATE,
escape_attempts INTEGER,
neutered BOOLEAN,
weight_kg DECIMAL
);

ALTER TABLE animals
ADD species VARCHAR(60);

CREATE TABLE owners(
	id SERIAL NOT NULL,
	full_name VARCHAR(60),
	age INTEGER,
	PRIMARY KEY(id)
);

CREATE TABLE species(
	id SERIAL NOT NULL,
	name VARCHAR(70),
	PRIMARY KEY(id)
);

ALTER TABLE 
animals
ADD PRIMARY KEY(id);

ALTER 
TABLE animals
DROP species;
SELECT * from animals;

ALTER TABLE animals
ADD species_id INT
REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT 
REFERENCES owners(id);

CREATE TABLE vets (
id SERIAL NOT NULL,
name VARCHAR(60),
age INT,
date_of_graduation DATE,
PRIMARY KEY (id)
);

CREATE TABLE specialization(
vet_id INT,
species_id INT,
PRIMARY KEY(vet_id,species_id),
FOREIGN KEY (vet_id) REFERENCES vets (id),
FOREIGN KEY (species_id) REFERENCES species (id)
);

CREATE TABLE visits(
animal_id INT,
vet_id INT NOT NULL,
visit_date DATE NOT NULL,
PRIMARY KEY (animal_id, vet_id, visit_date),
FOREIGN KEY (animal_id) REFERENCES animals(id),
FOREIGN KEY (vet_id) REFERENCES vets(id)
);


-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Drop Primary Key constraints
ALTER TABLE visits DROP CONSTRAINT visits_pkey;

-- Add Index to animal_id column
CREATE INDEX idx_visits_animal_id ON visits (animal_id);

-- Add Index to vet_id column
CREATE INDEX idx_visits_vet_id ON visits (vet_id);

-- Add Index to email column
CREATE INDEX idx_visits_email ON visits (email);

