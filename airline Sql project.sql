create database Airline;
use Airline;
CREATE TABLE flight (
    flight_no INT PRIMARY KEY,
    airline VARCHAR(20),
    DepartureAirport_name VARCHAR(20),
    ArrivalAirport_name VARCHAR(20),
    Departure_time TIME,
    Arrival_time TIME

create table passanger(
passanger_id int primary key,
flight_no int,
first_name varchar(10),
last_name varchar(10),
email varchar(30),
foreign key(flight_no)references flight(flight_no)
);

create table Booking(
Booking_id int primary key,
passanger_id int,
Seat_no int,
foreign key(passanger_id)references passanger(passanger_id)
);
INSERT INTO flight VALUES (762, 'AIRASIA', 'BOM', 'GOI', CAST('18:30:00' AS TIME), CAST('20:05:00' AS TIME));
INSERT INTO flight VALUES 
(825, 'AIRINDIA', 'CHN', 'KCH', CAST('20:15:00' AS TIME), CAST('23:06:00' AS TIME)),
(442, 'AIRVISTARA', 'BOM', 'DEL', CAST('08:12:00' AS TIME), CAST('10:12:00' AS TIME)),
(778, 'SPICEJET', 'GOI', 'JAI', CAST('04:12:00' AS TIME), CAST('06:00:00' AS TIME)),
(556, 'INDIGO', 'BOM', 'DUB', CAST('11:00:00' AS TIME), CAST('02:00:00' AS TIME));


INSERT INTO passanger VALUES 
(1012, 762, 'sameer', 'jadhav', 'xyz@gmail.com'),
(2022, 762, 'suyog', 'desai', 'pqr@gmail.com'),
(2102, 762, 'komal', 'kadam', 'xyz@yahoo.com'),
(3302, 762, 'vinayak', 'mulik', 'abc@gmail.com'),
(3304, 762, 'yash', 'deep', 'abcd@gmail.com'),
(4402, 825, 'ranjeet', 'gaikwad', 'abr@gmail.com'),
(4406, 825, 'suyog', 'desai', 'rek@gmail.com'),
(4410, 825, 'sunil', 'desai', 'sny@gmail.com'),
(4422, 825, 'akash', 'desai', 'sdf@gmail.com'),
(5501, 442, 'sandeep', 'pakhare', 'rew@gmail.com'),
(5502, 442, 'mrunal', 'thakur', 'mnr@gmail.com'),
(5510, 442, 'akshay', 'kumar', 'akki@gmail.com'),
(5522, 442, 'monika', 'pamdey', 'mnkiya@yahoo.com'),
(6601, 778, 'mayur', 'desai', 'mrt@gmail.com'),
(6602, 778, 'rupali', 'sathe', 'dfg@gmail.com'),
(8001, 556, 'prem', 'yadav', 'prem@gmail.com'),
(8002, 556, 'ganesh', 'trimukhe', 'ganesh@gmail.com'),
(8009, 556, 'disha', 'desai', 'dish@gmail.com');

INSERT INTO Booking VALUES 
(7474, 1012, 1),
(7879, 2022, 15),
(9869, 2102, 9),
(7789, 3302, 5),
(1001, 3304, 20),
(8585, 4402, 7),
(65656, 4406, 22),
(98987, 4410, 11),
(753125, 4422, 22),
(159753, 5501, 23),
(456123, 5502, 26),
(125478, 5510, 6),
(789654, 5522, 55),
(425789, 6601, 19),
(20320, 6602, 3),
(47147, 8001, 32),
(63636, 8002, 53),
(98652, 8009, 4);


SELECT * FROM flight;
SELECT * FROM passanger;
SELECT * FROM Booking;

#Where Clause
SELECT * FROM flight WHERE airline = 'AIRINDIA';
SELECT * FROM passanger WHERE last_name = 'desai';
SELECT * FROM Booking WHERE Seat_no > 20;

#Join Operation
SELECT 
    p.first_name, p.last_name, f.airline, 
    f.DepartureAirport_name, f.ArrivalAirport_name, f.Departure_time
FROM passanger p
JOIN flight f ON p.flight_no = f.flight_no;

SELECT 
    b.Booking_id, p.first_name, p.last_name, b.Seat_no
FROM Booking b
JOIN passanger p ON b.passanger_id = p.passanger_id;


#Aggregation Function
	#Count of passengers per flight

SELECT flight_no, COUNT(*) AS total_passengers
FROM passanger
GROUP BY flight_no;

	#Average seat number per flight

SELECT 
    flight_no, AVG(Seat_no) AS avg_seat_no
FROM Booking 
JOIN passanger ON Booking.passanger_id = passanger.passanger_id
GROUP BY flight_no;

#Sorting 
SELECT * FROM flight ORDER BY Departure_time;
SELECT * FROM Booking ORDER BY Seat_no DESC;

#Subquery
SELECT * FROM flight
WHERE flight_no IN (
    SELECT flight_no FROM passanger WHERE last_name = 'desai'
);





