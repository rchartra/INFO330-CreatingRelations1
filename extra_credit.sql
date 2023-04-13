CREATE TABLE timeslots (id INTEGER PRIMARY KEY, starttime TIME CHECK (starttime IS strftime('%H:%M',starttime)), endtime TIME CHECK (endtime IS strftime('%H:%M',endtime)));
INSERT INTO timeslots VALUES (1, '09:30', '10:20'), (2, '10:30', '11:20'), (3, '11:30', '12:20'), (4, '12:30', '01:20'), (5, '01:30', '02:20'), (6, '02:30', '03:20');
PRAGMA foreign_keys=off;
BEGIN TRANSACTION;

ALTER TABLE rooms RENAME TO old_table;

CREATE TABLE rooms (id INTEGER PRIMARY KEY, number INT, buildingid INT, seating INT, FOREIGN KEY (buildingid) REFERENCES buildings(id));

INSERT INTO rooms (number, buildingid, seating) SELECT * FROM old_table;

DROP TABLE old_table;

COMMIT;

PRAGMA foreign_keys=on;

CREATE TABLE schedule (coursecode VARCHAR(40) CHECK (length(coursecode) > 6), roomid INTEGER, timeslotid INTEGER, FOREIGN KEY (coursecode) REFERENCES courses(code), FOREIGN KEY (roomid) REFERENCES rooms(id), FOREIGN KEY (timeslotid) REFERENCES timeslots(id), UNIQUE(roomid, timeslotid));
INSERT INTO schedule VALUES ('INFO330A', 1, 2), ('INFO314', 1, 5), ('BAW100A', 3, 2);