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
