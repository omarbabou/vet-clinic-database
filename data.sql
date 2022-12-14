/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(1,'Agumon','2020-2-3',0,TRUE,10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(2,'Gabumon','2018-11-15',2,TRUE,8);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(3,'Pikachu','2021-1-7',1,FALSE,15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(4,'Devimon','2017-5-12',5,TRUE,11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(5,'Charmander','2020-2-8',0,FALSE,-11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(6,'Plantmon','2022-11-15',2,TRUE,-5.7);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(7,'Squirtle','1993-4-2',3,TRUE,-12.13);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(8,'Angemon','2005-5-12',1,TRUE,-45);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(9,'Boarmon','2005-5-7',7,TRUE,20.4);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES(10,'Blossom','1998-10-13',3,TRUE,17);

-- Insert data(full_name,age) in the owners table:

INSERT INTO owners(FULL_NAME,AGE) VALUES('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

-- Insert the following data into the species table:
-- Pokemon
-- Digimon
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';

-- All other animals are Pokemon
UPDATE animals SET species_id=1;

--Modify your inserted animals to include owner information (owner_id):
--Sam Smith owns Agumon.
UPDATE animals SET owner_id=1 WHERE name='Agumon';

--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id=2 WHERE name IN ('Gabumon','Pikachu');

--Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');

--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');

--Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');

-- Insert the following data for vets:
       -- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
       -- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
       -- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
       -- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
INSERT INTO vets(name,age,date_of_graduation) VALUES('William Tatche', 45,'2000-04-23'),
(' Maisy Smith', 26, '2019-01-17'),('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');

-- Insert the following data for specialties:
    -- Vet William Tatcher is specialized in Pokemon.
    -- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
    -- Vet Jack Harkness is specialized in Digimon.
INSERT INTO specializations (species_id,vets_id) VALUES (1,1),(2,3),(1,3),(2,4);


-- Insert the following data for visits:
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 2, '2021-05-04'),(5, 4, '2021-02-24');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (8, 4, '2020-10-03'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15');
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';