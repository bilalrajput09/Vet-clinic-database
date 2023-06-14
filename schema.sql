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
