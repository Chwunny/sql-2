-- Copy, paste, and run the insert statement from the delete section above. (You should have deleted all the entries.)

INSERT INTO animals ( name, type, age ) 
VALUES ('Leo', 'lion', 12), ('Jerry', 'mouse', 4), ('Marty', 'zebra', 10), ('Gloria', 'hippo', 8), ('Alex', 'lion', 9), ('Melman', 'giraffe', 15), ('Nala', 'lion', 2), ('Marie', 'cat', 1), ('Flounder', 'fish', 8);

-- Add a column to the animals table called “location”. It should have a VARCHAR data type.

ALTER TABLE animals
ADD location VARCHAR(255);

-- Insert 3 new animals into the table – make sure none of their fields are null.

INSERT INTO animals (name, type, age, location)
VALUES ('Jake', 'Demon', 25, 'AF, Utah'), ('Lincoln', 'Dog', 5, 'Draper, UT'), ('Dallas', 'Dog', 3, 'Draper, UT');

-- Change the “type” column’s name to be “species”.

ALTER TABLE animals
RENAME COLUMN type TO species;

-- Change the “species” column data type to be VARCHAR.

ALTER TABLE animals
ALTER COLUMN species TYPE VARCHAR;
