

-- ###########################################################################
-- ######################## VIEWS #####################################

-- 1. view for User Login.
DROP VIEW IF EXISTS userLogin_vw;
CREATE VIEW userLogin_vw AS
SELECT p.person_id, p.person_password, r.role_name FROM person p
INNER JOIN person_role pr ON pr.person_id = p.person_id
INNER JOIN Roles r ON r.role_id = pr.role_id
WHERE (r.role_name = 'Employee' OR r.role_name = 'Volunteer');


-- 2. View for Pet Search by Category, Gender and Age GROUP
DROP VIEW IF EXISTS petSearchByCategoryGenderAgegroup_vw;
CREATE VIEW  petSearchByCategoryGenderAgegroup_vw AS
SELECT a.animal_id, a.animal_name, a.animal_image, a.animal_category_id, a.animal_age_group, a.animal_gender, a.is_adopted, b.breed_name, ac.animal_category from animal a 
INNER JOIN animal_breed ab ON a.animal_id = ab.animal_id 
INNER JOIN Breed b ON ab.breed_id = b. breed_id
INNER JOIN Animal_Category ac ON ac.animal_category_id = a.animal_category_id


-- 3. REPORT View Knowing animal entry reason: By looking at entry reason, we can find out what is the cause of animals being entered in shelter. For example, find animal category, breed whose entry reason is “not affordable”
-- make a veiw
DROP VIEW IF EXISTS animalCountByEntryReason_vw;
CREATE VIEW animalCountByEntryReason_vw AS
SELECT er.entry_reason, count(a.animal_id) AS animal_count  FROM animal a
INNER JOIN Animal_entry_reason aer ON aer. animal_id = a.animal_id
INNER JOIN Entry_reason er ON er.entry_reason_id = aer.entry_reason_id GROUP BY er.entry_reason;

select entry_reason, animal_count, concat(round((animal_count/(select count(animal_id) from animal) * 100),2),'%') AS percentage from animalCountByEntryReason_vw order by animal_count desc;

-- 4. Get Animal Basic Information including Breed Category, Size, & Entry reason
CREATE VIEW animalBasicInfo_vw AS
SELECT a.animal_id, a.animal_name, a.animal_image, a.animal_age_group, a.animal_arrival_date, a.animal_weight, a.animal_color, a.animal_gender, a.is_neutered, a.animal_description, a.is_children_friendly, a.is_cat_friendly, a.is_dog_friendly, a.animal_size_id, a.animal_category_id, b.breed_name, ac.animal_category, s.animal_size, er.entry_reason from animal a 
INNER JOIN animal_breed ab ON a.animal_id = ab.animal_id 
INNER JOIN Breed b ON ab.breed_id = b. breed_id
INNER JOIN animal_entry_reason aer ON aer.animal_id = a.animal_id
INNER JOIN entry_reason er ON er.entry_reason_id = aer.entry_reason_id
INNER JOIN Animal_Category ac ON ac.animal_category_id = a.animal_category_id
INNER JOIN Animal_Size s ON s.animal_size_id = a.animal_size_id;

-- 5. Monthly Intake Flow of pets
DROP VIEW IF EXISTS monthlyPetsIntake_vw;
CREATE VIEW monthlyPetsIntake_vw AS
SELECT COUNT(animal_id) as In_Count, monthname(animal_arrival_date) AS MONTHS FROM ANIMAL GROUP BY MONTHS ORDER BY animal_arrival_date ASC;

-- 6. Monthly Out Flow (Adoption Flow) of pets
DROP VIEW IF EXISTS monthlyPetsAdoptionFlow_vw; 
CREATE VIEW monthlyPetsAdoptionFlow_vw AS
SELECT COUNT(animal_id) as Out_Count, monthname(adoption_date) AS MONTHS FROM ADOPTION_PROCESS GROUP BY MONTHS ORDER BY adoption_date ASC;

-- 7. Get Cages by Animal Size to assign one of the cage for arrived pet
DROP VIEW IF EXISTS getCagesbyAnimalSize_vw;
CREATE VIEW getCagesbyAnimalSize_vw AS
SELECT s.animal_size, a.animal_id, a.animal_arrival_date, c.cage_id FROM animal a
INNER JOIN animal_size s ON s.animal_size_id = a.animal_size_id
INNER JOIN Cages c ON c.cage_type_id = a.animal_size_id;


-- ###########################################################################
-- ######################## STORED PROCEDURES ################################



--1.  Stored procedure get Animal by category gender and agegroup
DROP PROCEDURE IF EXISTS GetAnimalByCategoryGenderAgeGroup;
DELIMITER //
CREATE PROCEDURE GetAnimalByCategoryGenderAgeGroup(IN category_id int, gender char(1), age_group varchar(10))
 BEGIN
 SELECT * from petSearchByCategoryGenderAgegroup_vw v
WHERE  v.animal_category_id = category_id 
AND v.animal_gender = gender 
AND v.animal_age_group = age_group
AND v.is_adopted = false; 
 END //
DELIMITER ;

CALL GetAnimalByCategoryGenderAgeGroup(1, 'F', 'young');


-- 2. Stored Procedure to get Basic information about animal from animal_id
DROP PROCEDURE IF EXISTS GetAnimalBasicInfoByAnimalId;
DELIMITER //
CREATE PROCEDURE GetAnimalBasicInfoByAnimalId(IN animal_id_in int)
BEGIN
SELECT * from animalBasicInfo_vw v
WHERE  v.animal_id = animal_id_in; 
 END //
DELIMITER ;

CALL GetAnimalBasicInfoByAnimalId(1);


-- 3. Adding new Animal Information
DROP PROCEDURE IF EXISTS addAnimalInformation;
DELIMITER //
CREATE PROCEDURE addAnimalInformation( IN animal_name_in varchar(50), IN animal_age_group_in varchar(10), IN animal_age_in_weeks_in int, IN animal_arrival_date_in varchar(20), IN animal_weight_in decimal(6,2), IN animal_color_in varchar(50), IN is_neutered_in boolean, IN animal_cost_in decimal(6,2), IN animal_description_in text, IN is_adopted_in boolean, IN is_children_friendly_in boolean, IN is_cat_friendly_in boolean, IN is_dog_friendly_in boolean, IN animal_gender_in char(1), IN animal_size_id_in tinyint, IN animal_category_id tinyint, IN animal_image_in longblob)
BEGIN
	INSERT INTO animal (animal_name, animal_age_group, animal_age_in_weeks, animal_arrival_date, animal_weight, animal_color, is_neutered, animal_cost, animal_description, is_adopted, is_children_friendly, is_cat_friendly, is_dog_friendly, animal_gender, animal_size_id, animal_category_id, animal_image ) 
	VALUES ( animal_name_in,  animal_age_group_in,  animal_age_in_weeks_in, str_to_date(animal_arrival_date_in, '%m/%d/%Y'),  animal_weight_in,  animal_color_in,  is_neutered_in,  animal_cost_in,  animal_description_in,  is_adopted_in,  is_children_friendly_in,  is_cat_friendly_in,  is_dog_friendly_in,  animal_gender_in,  animal_size_id_in,  animal_category_id, animal_image_in );

END //
DELIMITER ;


-- 4. Stored Procedure
-- adding animal breed information => Based on new animal record, update his/her breed in Animal_Breed table
DROP PROCEDURE IF EXISTS addAnimalBreedInformation;
DELIMITER //
CREATE PROCEDURE addAnimalBreedInformation(IN animal_id_input int, IN breed_id_input int)
BEGIN
	INSERT INTO Animal_Breed (animal_id, breed_id) 
	VALUES(animal_id_input, breed_id_input);
 END //
DELIMITER ;


-- 5. Stored Procedure
-- Adding Animal Entry Reason => Based on new animal record, update his/her entry reason in Animal_Entry_Reason table
DROP PROCEDURE IF EXISTS addAnimalEntryReason;
DELIMITER //
CREATE PROCEDURE addAnimalEntryReason(IN animal_id_input int, IN entry_reason_id_input int)
BEGIN
	INSERT INTO Animal_Entry_Reason (animal_id, entry_reason_id) 
	VALUES(animal_id_input, entry_reason_id_input);
 END //
DELIMITER ;

-- 6. adding cage Occupancy => Based on new animal record, update cage assigned in Cage_Occupancy table
DROP PROCEDURE IF EXISTS addCageOccupancy;
DELIMITER //
CREATE PROCEDURE addCageOccupancy(IN animal_id_input int)
BEGIN

	SELECT cage_id, animal_arrival_date INTO @tempCageId, @tempArrivalDate FROM getCagesbyAnimalSize_vw WHERE cage_id NOT IN (SELECT cage_id FROM cage_occupancy) AND animal_id = animal_id_input LIMIT 1;

	INSERT INTO cage_occupancy (cage_id, animal_id, occupied_date) VALUES (@tempCageId, animal_id_input, @tempArrivalDate);

 END //
DELIMITER ;


-- str_to_date('5/19/2019', '%m/%d/%Y')
-- STR_TO_DATE(license_expiry_date_in, '%m/%d/%Y')
-- 7. adding Person
DROP PROCEDURE IF EXISTS addPerson;
DELIMITER //
CREATE PROCEDURE addPerson(IN first_name_in varchar(50), IN last_name_in varchar(50), IN email_in varchar(100), IN phone_number_in varchar(20), IN street_address_in varchar(100), IN city_in varchar(100), IN state_in char(2), IN zip_in varchar(11), IN driver_license_in varchar(10), IN state_issuance_in char(2), IN license_expiry_date_in varchar(20))
BEGIN
INSERT INTO Person (person_password, first_name, last_name, email_id, phone_number, street_address, city, state, zip, driver_license,state_issuance, license_expiry_date ) 
VALUES("demo", first_name_in, last_name_in, email_in, phone_number_in, street_address_in, city_in, state_in, zip_in, driver_license_in, state_issuance_in, str_to_date(license_expiry_date_in, '%m/%d/%Y') );
 END //
DELIMITER ;

-- To DO add stored procedure to update person_role

-- -- Reports
-- 	Finding Long term animals: Report would generate information about all animals that are in the shelter for more than 4 months. 
-- 8. Stored procedure for long term animals 
DROP PROCEDURE IF EXISTS getLongTermAnimals;
DELIMITER //
CREATE PROCEDURE getLongTermAnimals(IN months int)
BEGIN
SELECT a.animal_name, ac.animal_category, b.breed_name, s.animal_size, a.animal_arrival_date from animal a 
INNER JOIN animal_breed ab ON a.animal_id = ab.animal_id 
INNER JOIN Breed b ON ab.breed_id = b. breed_id
INNER JOIN Animal_Category ac ON ac.animal_category_id = a.animal_category_id
INNER JOIN Animal_size s ON s.animal_size_id = a.animal_size_id
WHERE a.animal_arrival_date < CURRENT_DATE - INTERVAL months MONTH;
 END //
DELIMITER ;
call getLongTermAnimals(4);



-- 9. On click of Adopt_Me button on pet search page, adoption request table will get populated with person_id, animal_category_id, breed_id, agegroup, gender
DROP PROCEDURE IF EXISTS addAdoptionRequest;
DELIMITER //
CREATE PROCEDURE addAdoptionRequest(IN person_id_in int, IN animal_id_in int, IN animal_category_id_in int, IN agegroup_in varchar(20), IN gender_in char(1) )
BEGIN
INSERT INTO Adoption_Request (person_id, animal_id, animal_category_id, animal_age_group, animal_gender)
VALUES(person_id_in, animal_id_in, animal_category_id_in, agegroup_in, gender_in );
 END //
DELIMITER ;


-- 10. On click of Confirm Adoption, confirmAdoptionProcess will add record in adoption_process and update Animal as adopted and remove record from cage Occupancy table for adopted animal
DROP PROCEDURE IF EXISTS confirmAdoptionProcess;
DELIMITER //
CREATE PROCEDURE confirmAdoptionProcess(IN animal_id_in int, IN person_id_in int, IN emp_id_in int)
BEGIN

	INSERT INTO Adoption_Process (animal_id, person_id, emp_id, adoption_date)
	VALUES(animal_id_in, person_id_in, emp_id_in, current_date());

	-- if inserted successfully then update Animal with isadopted = true and remove record from cage occupancy
	UPDATE Animal set is_adopted = true 
	WHERE animal_id = animal_id_in; 

	-- if animal adopted, then remove cage occupancy record for that animal
	DELETE from Cage_Occupancy where animal_id = animal_id_in;

 END //
DELIMITER ;

-- 11. Get Animal Health Information
DROP VIEW IF EXISTS animalHealthInfo_vw;
CREATE VIEW animalHealthInfo_vw AS
SELECT d.diet_name, v.vaccination_type, av.vaccination_date, mp.medical_process_category, amr.medical_process_date, vc.clinic_name from animal a
INNER JOIN Animal_Diet ad ON ad.animal_id = a.animal_id
INNER JOIN Diet d ON d.diet_id = ad.diet_id
INNER JOIN Animal_Vaccination av ON av.animal_id = a.animal_id
INNER JOIN Vaccination v ON v.vaccination_id = av.vaccination_id
INNER JOIN Animal_Medical_Record amr ON amr.animal_id = a.animal_id
INNER JOIN Medical_Process mp ON mp.medical_process_id = amr.medical_process_id
INNER JOIN Veterinary_Clinic vc ON vc.clinic_id = amr.clinic_id;



