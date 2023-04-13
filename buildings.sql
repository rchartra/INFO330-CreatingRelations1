CREATE TABLE buildings (name VARCHAR(80) NOT NULL, shortname VARCHAR(10) UNIQUE, id INTEGER PRIMARY KEY);
INSERT INTO buildings (name, shortname) VALUES ('Kane Hall', 'KNE'), ('Physics Building', 'PAB'), ('Smith Hall', 'SMI');
CREATE TABLE rooms (number INT, buildingid INT, seating INT, FOREIGN KEY (buildingid) REFERENCES buildings(id));
INSERT INTO rooms VALUES (110, (SELECT id FROM buildings WHERE shortname = 'KNE'), 200), (164, (SELECT id FROM buildings WHERE shortname = 'PAB'), 30), (115, (SELECT id FROM buildings WHERE shortname = 'SMI'), 25);

-- Is it okay that I still have to specify the columns for buildings