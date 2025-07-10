create database Airline;
use Airline;
create table flight(
flight_no int primary key,
airline varchar(20),
DepartureAirport_name varchar(20),
ArrivalAirport_name varchar(20),
Departure_time time,
Arrival_time time
);

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
insert into flight value(762,'AIRASIA','BOM','GOI',18.30,20.05);
insert into flight value(825,'AIRINDIA','CHN','KCH',20.25,23.10),(442,'AIRVISTARA','BOM','DEL',08.20,10.20),(778,'SPICEJET','GOI','JAI',04.20,06.00),
(556,'INDIGO','BOM','DUB',11.00,02.00);

insert into passanger value(1012,762,'sameer','jadhav','xyz@gmail.com');
insert into passanger value(2022,762,'suyog','desai','pqr@gmail.com'),(2102,762,'komal','kadam','xyz@yahoo.com'),
(3302,762,'vinayak','mulik','abc@gmail.com'),(3304,762,'yash','deep','abcd@gmail.com'),(4402,825,'ranjeet','gaikwad','abr@gmail.com'),
(4406,825,'suyog','desai','rek@gmail.com'),(4410,825,'sunil','desai','sny@gmail.com'),(4422,825,'akash','desai','sdf@gmail.com'),
(5501,442,'sandeep','pakhare','rew@gmail.com'),(5502,442,'mrunal','thakur','mnr@gmail.com'),(5510,442,'akshay','kumar','akki@gmail.com'),
(5522,442,'monika','pamdey','mnkiya@yahoo.com'),(6601,778,',mayur','desai','mrt@gmail.com'),(6602,778,'rupali','sathe','dfg@gmail.com'),
(8001,556,'prem','yadav','prem@gmail.com'),(8002,556,'ganesh','trimukhe','ganesh@gmail.com'),(8009,556,'disha','desai','dish@gmail.com');

select*from passanger;

insert into Booking value(7474,1012,1);
insert into Booking value(7879,2022,15),(9869,2102,9),(7789,3302,5),(1001,3304,20),(8585,4402,7),(65656,4406,22),(98987,4410,11),
(753125,4422,22),(159753,5501,23),(456123,5502,26),(125478,5510,6),(789654,5522,55),(425789,6601,19),(20320,6602,3),(47147,8001,32),(63636,8002,53),
(98652,8009,4);

select*from Booking;

alter table passanger 
add contact_no bigint;

alter table booking
add gate_no int;

update passanger
set last_name='desai'
where passanger_id=2010;

