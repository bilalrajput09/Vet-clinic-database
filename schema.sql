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
