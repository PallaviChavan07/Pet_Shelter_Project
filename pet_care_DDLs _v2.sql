DROP SCHEMA IF EXISTS pet_care;
CREATE SCHEMA pet_care;
USE pet_care;

CREATE TABLE Breed (
  breed_id int auto_increment,
  breed_name varchar(50),
  breed_description text,
  PRIMARY KEY (breed_id)
)ENGINE=INNODB;

CREATE TABLE Cage_Type (
  cage_type_id tinyint auto_increment,
  cage_type varchar(10),
  PRIMARY KEY (cage_type_id)
)ENGINE=INNODB;

-- removed is_occupied
CREATE TABLE Cages (
  cage_id smallint auto_increment,
  cage_type_id tinyint,
  PRIMARY KEY (cage_id),
  FOREIGN KEY (cage_type_id) REFERENCES Cage_Type (cage_type_id)
)ENGINE=INNODB;


CREATE TABLE Animal_Category (
  animal_category_id tinyint auto_increment,
  animal_category varchar(5),
  animal_description text,
  PRIMARY KEY (animal_category_id)
)ENGINE=INNODB;


CREATE TABLE Animal_Size (
  animal_size_id tinyint auto_increment,
  animal_size varchar(10),
  PRIMARY KEY (animal_size_id)
)ENGINE=INNODB;

-- changed colour datatype
-- changed animal age_group datatype from 100 to 10
CREATE TABLE Animal (
  animal_id int auto_increment,
  animal_name varchar(50),
  animal_image longblob,
  animal_age_group varchar(10),
  animal_age_in_weeks int,
  animal_arrival_date date,
  animal_weight decimal(6,2),
  animal_color varchar(50),
  is_neutered  boolean,
  animal_cost decimal(6,2),
  animal_description text,
  is_adopted boolean,
  is_children_friendly boolean,
  is_cat_friendly boolean,
  is_dog_friendly boolean,
  animal_gender char(1),
  animal_size_id tinyint,
  animal_category_id tinyint,
  PRIMARY KEY (animal_id),
  FOREIGN KEY (animal_size_id) REFERENCES Animal_Size (animal_size_id),
  FOREIGN KEY (animal_category_id) REFERENCES Animal_Category (animal_category_id)
)ENGINE=INNODB;

CREATE TABLE Entry_Reason (
  entry_reason_id smallint auto_increment,
  entry_reason varchar(100),
  entry_reason_description text,
  PRIMARY KEY (entry_reason_id)
)ENGINE=INNODB;

CREATE TABLE Roles (
  role_id tinyint auto_increment,
  role_name varchar(20),
  role_description text,
  PRIMARY KEY (role_id)
)ENGINE=INNODB;


CREATE TABLE Person (
  person_id int auto_increment,
  person_password varchar(10),
  first_name varchar(50),
  last_name varchar(50),
  email_id varchar(100),
  phone_number varchar(20),
  street_address varchar(100),
  city varchar(100),
  state char(2),
  zip varchar(11),
  driver_license varchar(10),
  state_issuance char(2),
  license_expiry_date date,
  PRIMARY KEY (person_id)
)ENGINE=INNODB;

CREATE TABLE Person_Role (
  role_id tinyint,
  person_id int,
  PRIMARY KEY (role_id, person_id),
  FOREIGN KEY (role_id) REFERENCES Roles (role_id),
  FOREIGN KEY (person_id) REFERENCES Person (person_id)
)ENGINE=INNODB;


-- Adding few columns
CREATE TABLE Adoption_Request (
  request_id int auto_increment,
  person_id int,
  animal_id int,
  animal_category_id tinyint,
  animal_age_group varchar(100),
  animal_gender char(1),
  breed_id int,
  PRIMARY KEY (request_id),
  FOREIGN KEY (person_id) REFERENCES Person (person_id), 
  FOREIGN KEY(animal_category_id) REFERENCES Animal_Category (animal_category_id), 
  FOREIGN KEY (breed_id) REFERENCES Breed (breed_id)
)ENGINE=INNODB;

CREATE TABLE Adoption_Process (
  adoption_id int auto_increment,
  animal_id int,
  person_id int,
  emp_id int,
  adoption_date date,
  PRIMARY KEY (adoption_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id), 
  FOREIGN KEY(person_id) REFERENCES Person (person_id),
  FOREIGN KEY (emp_id) REFERENCES Person (person_id)
)ENGINE=INNODB;




CREATE TABLE Cage_Occupancy (
  cage_id smallint,
  animal_id int,
  occupied_date date,
  PRIMARY KEY (cage_id, animal_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id), 
  FOREIGN KEY (cage_id) REFERENCES Cages (cage_id) 
)ENGINE=INNODB;

-- adding clinic name
CREATE TABLE Veterinary_Clinic (
  clinic_id smallint auto_increment,
  clinic_name varchar(100),
  clinic_email_id varchar(100),
  clinic_phone_number varchar(20),
  clinic_street_add varchar(100),
  clinic_city varchar(100),
  clinic_state char(2),
  clinic_zip varchar(11),
  PRIMARY KEY (clinic_id)
)ENGINE=INNODB;

CREATE TABLE Vaccination (
  vaccination_id int auto_increment,
  vaccination_type varchar(100),
  vaccination_cost decimal(8,2),
  vaccination_description text,
  PRIMARY KEY (vaccination_id)
)ENGINE=INNODB;


CREATE TABLE Diet (
  diet_id int auto_increment,
  diet_name varchar(100),
  diet_description text,
  PRIMARY KEY (diet_id)
)ENGINE=INNODB;

CREATE TABLE Medical_Process (
  medical_process_id smallint auto_increment,
  medical_process_category varchar(100),
  PRIMARY KEY (medical_process_id)
)ENGINE=INNODB;


CREATE TABLE Animal_Vaccination (
  animal_id int,
  vaccination_id int,
  vaccination_date date,
  PRIMARY KEY (animal_id, vaccination_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id), 
  FOREIGN KEY (vaccination_id) REFERENCES Vaccination (vaccination_id)
)ENGINE=INNODB;

CREATE TABLE Animal_Diet (
  animal_id int,
  diet_id int,
  diet_start_date date,
  last_changed_date date,
  PRIMARY KEY (animal_id, diet_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id),
  FOREIGN KEY (diet_id) REFERENCES Diet (diet_id)
  
)ENGINE=INNODB;


CREATE TABLE Animal_Breed (
  animal_id int,
  breed_id int,
  PRIMARY KEY (animal_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id),
  FOREIGN KEY (breed_id) REFERENCES Breed (breed_id)
)ENGINE=INNODB;


CREATE TABLE Animal_Entry_reason (
  animal_id int,
  entry_reason_id smallint,
  PRIMARY KEY (entry_reason_id, animal_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id),
  FOREIGN KEY (entry_reason_id) REFERENCES Entry_Reason (entry_reason_id)
)ENGINE=INNODB;



CREATE TABLE Animal_Medical_Record (
  animal_medical_record_id int auto_increment,
  animal_id int,
  medical_process_id smallint,
  clinic_id smallint,
  medical_process_date date,
  PRIMARY KEY (animal_medical_record_id),
  FOREIGN KEY (animal_id) REFERENCES Animal (animal_id),
  FOREIGN KEY (medical_process_id) REFERENCES Medical_Process (medical_process_id),
  FOREIGN KEY (clinic_id) REFERENCES Veterinary_Clinic (clinic_id)
)ENGINE=INNODB;



