-- Step 1: Create Tables with Constraints

-- Table: profession
CREATE TABLE profession (
    prof_id SERIAL PRIMARY KEY,
    profession VARCHAR(50) UNIQUE
);

-- Table: zip_code with province and CHECK constraint
CREATE TABLE zip_code (
    zip_code VARCHAR(4) PRIMARY KEY CHECK (LENGTH(zip_code) = 4),
    city VARCHAR(50),
    province VARCHAR(50)
);

-- Table: status
CREATE TABLE status (
    status_id SERIAL PRIMARY KEY,
    status VARCHAR(50)
);

-- Table: interests
CREATE TABLE interests (
    interest_id SERIAL PRIMARY KEY,
    interest VARCHAR(50)
);

-- Table: seeking
CREATE TABLE seeking (
    seeking_id SERIAL PRIMARY KEY,
    seeking VARCHAR(50)
);

-- Table: my_contacts
CREATE TABLE my_contacts (
    contact_id SERIAL PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    gender VARCHAR(10),
    birthday DATE,
    prof_id INT REFERENCES profession(prof_id),
    zip_code VARCHAR(4) REFERENCES zip_code(zip_code),
    status_id INT REFERENCES status(status_id)
);

-- Many-to-Many Relationship Table: contact_interest
CREATE TABLE contact_interest (
    contact_id INT REFERENCES my_contacts(contact_id),
    interest_id INT REFERENCES interests(interest_id),
    PRIMARY KEY (contact_id, interest_id)
);

-- Many-to-Many Relationship Table: contact_seeking
CREATE TABLE contact_seeking (
    contact_id INT REFERENCES my_contacts(contact_id),
    seeking_id INT REFERENCES seeking(seeking_id),
    PRIMARY KEY (contact_id, seeking_id)
);

-- Step 2: Insert Data into Tables

-- Inserting 9 provinces and 2 cities per province
INSERT INTO zip_code (zip_code, city, province) VALUES
('1001', 'Toronto', 'Ontario'),
('1002', 'Ottawa', 'Ontario'),
('2001', 'Montreal', 'Quebec'),
('2002', 'Quebec City', 'Quebec'),
('3001', 'Vancouver', 'British Columbia'),
('3002', 'Victoria', 'British Columbia'),
('4001', 'Calgary', 'Alberta'),
('4002', 'Edmonton', 'Alberta'),
('5001', 'Winnipeg', 'Manitoba'),
('5002', 'Brandon', 'Manitoba'),
('6001', 'Halifax', 'Nova Scotia'),
('6002', 'Sydney', 'Nova Scotia'),
('7001', 'Fredericton', 'New Brunswick'),
('7002', 'Moncton', 'New Brunswick'),
('8001', 'Charlottetown', 'Prince Edward Island'),
('8002', 'Summerside', 'Prince Edward Island'),
('9001', 'St. Johns', 'Newfoundland and Labrador'),
('9002', 'Corner Brook', 'Newfoundland and Labrador');

-- Inserting Professions
INSERT INTO profession (profession)
VALUES
('Artist'),
('Musician'),
('Scientist'),
('Writer'),
('Chef'),
('Athlete'),
('Teacher'),
('Lawyer'),
('Entrepreneur'),
('Engineer'),
('Photographer'),
('Designer'),
('Nurse'),
('Firefighter'),
('Pilot');


-- Inserting Status
INSERT INTO status (status) VALUES ('Single'), ('In a Relationship'), ('Its Complicated');

-- Inserting Interests
INSERT INTO interests (interest) VALUES ('Reading'), ('Hiking'), ('Cooking'), ('Traveling');

-- Inserting Seeking
INSERT INTO seeking (seeking) VALUES ('Friendship'), ('Long-term Relationship'), ('Casual Dating');

-- Step 3: Insert Contacts (more than 15 with more than 2 interests each)
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id) VALUES
('Smith', 'John', '123-456-7890', 'john.smith@example.com', 'Male', '1990-05-10', 1, '1001', 1),
('Doe', 'Jane', '234-567-8901', 'jane.doe@example.com', 'Female', '1992-07-15', 2, '2001', 2),
('Lee', 'Chris', '345-678-9012', 'chris.lee@example.com', 'Male', '1988-11-22', 3, '3001', 3),
('Johnson', 'Emily', '456-789-0123', 'emily.johnson@example.com', 'Female', '1994-03-18', 4, '4001', 1),
('Brown', 'Michael', '567-890-1234', 'michael.brown@example.com', 'Male', '1986-06-25', 5, '5001', 2),
('Davis', 'Sarah', '678-901-2345', 'sarah.davis@example.com', 'Female', '1991-09-12', 6, '6001', 3),
('Miller', 'James', '789-012-3456', 'james.miller@example.com', 'Male', '1983-02-05', 7, '7001', 1),
('Taylor', 'Jessica', '890-123-4567', 'jessica.taylor@example.com', 'Female', '1997-10-30', 8, '8001', 2),
('Anderson', 'Daniel', '901-234-5678', 'daniel.anderson@example.com', 'Male', '1989-08-17', 9, '9001', 3),
('Thomas', 'Olivia', '012-345-6789', 'olivia.thomas@example.com', 'Female', '1995-12-02', 10, '1002', 1),
('Jackson', 'David', '123-456-7891', 'david.jackson@example.com', 'Male', '1987-04-21', 11, '2002', 2),
('White', 'Sophia', '234-567-8902', 'sophia.white@example.com', 'Female', '1993-11-09', 12, '3002', 3),
('Harris', 'Ethan', '345-678-9013', 'ethan.harris@example.com', 'Male', '1990-01-28', 13, '4002', 1),
('Martinez', 'Mia', '456-789-0124', 'mia.martinez@example.com', 'Female', '1996-07-05', 14, '5002', 2),
('Garcia', 'Liam', '567-890-1235', 'liam.garcia@example.com', 'Male', '1985-05-16', 15, '6002', 3);

-- Inserting Contact Interests (at least 2 interests per contact)
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 1), (3, 4),
(4, 2), (4, 3),
(5, 1), (5, 2),
(6, 3), (6, 4),
(7, 1), (7, 3),
(8, 2), (8, 4),
(9, 1), (9, 4),
(10, 2), (10, 3),
(11, 1), (11, 2),
(12, 3), (12, 4),
(13, 1), (13, 3),
(14, 2), (14, 4),
(15, 1), (15, 2);

-- Inserting Contact Seeking Preferences
INSERT INTO contact_seeking (contact_id, seeking_id) VALUES
(1, 1), (1, 2),
(2, 2), (2, 3),
(3, 1), (3, 3),
(4, 1), (4, 2),
(5, 2), (5, 3),
(6, 1), (6, 3),
(7, 1), (7, 2),
(8, 2), (8, 3),
(9, 1), (9, 3),
(10, 1), (10, 2),
(11, 2), (11, 3),
(12, 1), (12, 3),
(13, 1), (13, 2),
(14, 2), (14, 3),
(15, 1), (15, 2);


-- Step 4: Write the LEFT JOIN Query
SELECT 
    mc.first_name,
    mc.last_name,
    p.profession, 
    z.zip_code, z.city, z.province, 
    s.status, 
    i.interest, 
    sk.seeking
FROM my_contacts mc
LEFT JOIN profession p ON mc.prof_id = p.prof_id
LEFT JOIN zip_code z ON mc.zip_code = z.zip_code
LEFT JOIN status s ON mc.status_id = s.status_id
LEFT JOIN contact_interest ci ON mc.contact_id = ci.contact_id
LEFT JOIN interests i ON ci.interest_id = i.interest_id
LEFT JOIN contact_seeking cs ON mc.contact_id = cs.contact_id
LEFT JOIN seeking sk ON cs.seeking_id = sk.seeking_id;


-- Step 5: Constraint Testing Inserts

-- -- VALID INSERT: New contact with all valid references and formats
-- INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
-- VALUES ('Banner', 'Bruce', '888-888-8888', 'bruce.banner@example.com', 'Male', '1980-12-18', 5, '1002', 1);

-- -- VALID INSERT: New interest and new contact_interest pair
-- INSERT INTO interests (interest) VALUES ('Gaming');
-- INSERT INTO contact_interest (contact_id, interest_id)
-- VALUES (1, (SELECT interest_id FROM interests WHERE interest = 'Gaming'));

-- -- INVALID INSERT: Duplicate email (should pass unless UNIQUE is added to email column)
-- -- Expected: SUCCEEDS unless UNIQUE constraint added manually
-- INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
-- VALUES ('Kent', 'Clark', '777-777-7777', 'john.smith@example.com', 'Male', '1985-06-11', 3, '3001', 2);

-- VALID INSERT: Unique contact with valid foreign key references
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday,prof_id, zip_code, status_id) VALUES 
('Parker', 'Peter', '321-654-0987', 'peter.parker@dailybugle.com', 'Male','1998-08-10', 4, '1002', 2);

-- VALID INSERT: Interest and contact_interest for new contact
INSERT INTO interests (interest) VALUES ('Photography'); -- Only if not already present

INSERT INTO contact_interest (contact_id, interest_id)
VALUES ((SELECT contact_id FROM my_contacts WHERE email = 'peter.parker@dailybugle.com'), (SELECT interest_id FROM interests WHERE interest = 'Photography'));

-- VALID INSERT: Seeking preference for new contact
INSERT INTO contact_seeking (contact_id, seeking_id)
VALUES ((SELECT contact_id FROM my_contacts WHERE email = 'peter.parker@dailybugle.com'),1);


-- INVALID INSERT: zip_code too short (violates CHECK constraint on zip_code length)
-- Expected: FAIL - zip_code must be exactly 4 characters
INSERT INTO zip_code (zip_code, city, province) 
VALUES ('123', 'Smallville', 'Kansas');

-- INVALID INSERT: profession foreign key violation (no prof_id 99 exists)
-- Expected: FAIL - foreign key prof_id = 99 does not exist
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Wayne', 'Bruce', '111-111-1111', 'bruce.wayne@example.com', 'Male', '1975-02-19', 99, '1001', 1);

-- INVALID INSERT: status_id foreign key violation
-- Expected: FAIL - no status_id = 999
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Romanoff', 'Natasha', '222-222-2222', 'natasha.r@example.com', 'Female', '1984-03-10', 2, '2001', 999);

-- INVALID INSERT: contact_interest with invalid interest_id
-- Expected: FAIL - interest_id = 999 does not exist
INSERT INTO contact_interest (contact_id, interest_id)
VALUES (1, 999);

-- INVALID INSERT: contact_seeking duplicate entry (composite PK)
-- Expected: FAIL - duplicate (contact_id, seeking_id) violates PRIMARY KEY
INSERT INTO contact_seeking (contact_id, seeking_id)
VALUES (1, 1);


