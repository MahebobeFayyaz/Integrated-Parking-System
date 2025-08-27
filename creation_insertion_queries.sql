
create database parking;
use parking;

# SQL Table Create statements below
# ===
# 1. Car
create table car 
(
`number plate` varchar(10) not null,
`car brand` varchar(45), 
`car model` varchar(45),
primary key (`number plate`)
);

# 2. swipe card
create table `swipe card`(
`card id` int not null,
`given name` varchar(100), 
`last name` varchar(100), 
`staff number` varchar(10), 
`contact phone` varchar(20),
primary key (`card id`)
);

# 3. Spot Reservation 
create table `spot reservation`(
`reservation id` int not null, 
`card id` int, 
`number plate` varchar(10), 
`payment amount` decimal(5,2), 
`when created` datetime,
primary key(`reservation id`),
constraint fk_card_id foreign key(`card id`) references `swipe card`(`card id`),
constraint fk_number_plate foreign key(`number plate`) references car(`number plate`)
); 

# 4. Timeslot 
create table timeslot(
`year` year not null,
Semester char(2) not null,
primary key (`year`,Semester)
);

#5. car park
create table `car park`(
`carpark id` int not null, 
`map reference` varchar(10), 
`description` varchar(200),
primary key(`carpark id`)
);

# 6. `spot reservation parking area`
create table `spot reservation parking area`(
`area id` int not null, 
`carpark id` int not null, 
`area name` varchar(45),
primary key (`area id`),
constraint fk_carpark_id foreign key(`carpark id`) references `car park`(`carpark id`)
);

#7. numbered parking spot
create table `numbered parking spot`(
`parking spot id` int not null,
`area id` int,
`location description`varchar(100),
primary key (`parking spot id`),
constraint fk_area_id foreign key(`area id`) references `spot reservation parking area`(`area id`)
);

# 8. Allocation
create table allocation(
`parking spot id` int, 
`year` year, 
`Semester` char(2), 
`reservation id` int,
constraint fk_parking_spot_id foreign key(`parking spot id`) references`numbered parking spot`(`parking spot id`),
constraint fk_year foreign key(`year`,Semester) references timeslot(`year`,Semester),
constraint fk_reservation_id foreign key(`reservation id`) references `spot reservation`(`reservation id`)
);

# 9. spot area entry attempt
create table `spot area entry attempt`(
`attempt id` int not null, 
`card id` int, 
`area id` int, 
`date and time of entry` datetime,
primary key(`attempt id`),
constraint fk_card_id_1 foreign key(`card id`) references `swipe card`(`card id`),
constraint fk_area_id_1 foreign key(`area id`) references `spot reservation parking area`(`area id`)
);
# ===


# ===

#  SQL insert statements for data to be inserted into  tables
# ===
# inserting data into car table
insert into car values
('111','ford','fiesta'),
('112', 'toyota', 'yaris'),
('113', 'bmw', 'x1'),
('114', 'mazda', 'cx2'),
('115', 'hyundai', 'elantra');
select * from car;

# inserting data into swipe card table
insert into `swipe card` values
('771', 'fayyaz', 'savanur', '101', '041151'),
('772', 'ashley', 'rebelo', '102', '041161'),
('773', 'jyothi', 'gowda', '103', '041171'),
('774', 'asawari', 'waghware', '104', '041181'),
('775', 'anirudh', 'patil', '105', '041191'),
('776', 'fayyaz', 'savanur', '101', '041151'),
('777', 'fayyaz', 'savanur', '101', '041161'),
('778', 'ashley', 'rebelo', '102', '041171'),
('779', 'asawari', 'waghware', '104', '041181'),
('800', 'asawari', 'waghware', '104', '041191');

select * from `swipe card`;

#inserting data into spot reservation table
insert into `spot reservation` values
('301', '771', '111', '100.50', '2022-11-11 13:23:44'),
('302', '772', '112', '100.50', '2022-11-11 13:23:44'),
('303', '773', '113', '100.50', '2022-11-11 13:23:44'),
('304', '774', '114', '100.50', '2022-11-11 13:23:44'),
('305', '775', '115', '100.50', '2023-11-11 13:23:44'),
('306', '771', '112', '100.50', '2022-11-11 13:23:44'),
('307', '771', '113', '100.50', '2022-11-11 13:23:44'),
('308', '772', '114', '100.50', '2022-11-11 13:23:44'),
('309', '772', '115', '100.50', '2023-11-11 13:23:44'),
('310', '773', '115', '100.50', '2023-11-11 13:23:44'),
('311', '771', '112', '100.50', '2022-11-11 13:23:44'),
('312', '771', '112', '100.50', '2022-11-11 13:23:44'),
('313', '772', '112', '100.50', '2022-11-11 13:23:44'),
('314', '772', '115', '100.50', '2023-11-11 13:23:44'),
('315', '772', '115', '100.50', '2023-11-11 13:23:44'),
('316', '773', '115', '100.50', '2023-11-11 13:23:44');

select * from `spot reservation`;

# inserting data into timeslot
insert into timeslot values
(2022, 's1'),
(2022, 's2'),
(2022, 's3'),
(2022, 's4'),
(2023, 's1');

select * from timeslot;

#inserting data into car park
insert into `car park` values
('1', 'gmaps', 'turn right in roundabout'),
('2', 'hmaps', 'turn left in roundabout'),
('3', 'imaps', 'go straight in roundabout'),
('4', 'jmaps', 'turn right in t intersection'),
('5', 'kmaps', 'turn left in t intersection');

select * from `car park`;

#inserting data into car park table
insert into `spot reservation parking area` values
('20', '1', 'p1'),
('21', '2', 'p2'),
('22', '3', 'p3'),
('23', '4', 'p4'),
('24', '5', 'p5'),
('25', '1', 'p6'),
('26', '2', 'p7'),
('27', '3', 'p8'),
('28', '4', 'p9'),
('29', '5', 'p10');

select * from `spot reservation parking area`;

# inserting data into  numbered parking spot
insert into `numbered parking spot` values
('401', '20', 'front yard'),
('402', '21', 'back yard'),
('403', '22', 'underground'),
('404', '23', 'upper area'),
('405', '24', 'secured'),
('406', '20', 'front yard'),
('407', '20', 'back yard'),
('408', '20', 'underground'),
('409', '20', 'upper area'),
('410', '21', 'secured'),
('411', '21', 'front yard'),
('412', '21', 'back yard'),
('413', '22', 'underground'),
('414', '22', 'upper area'),
('415', '23', 'secured');

select * from `numbered parking spot`;

#inserting data into allocation
insert into allocation values
('401', 2022, 's1', '301'),
('402', 2022, 's2', '302'),
('403', 2022, 's3', '303'),
('404', 2022, 's4', '304'),
('405', 2023, 's1', '305');
insert into allocation values
('401', 2022, 's1', '306'),
('402', 2022, 's2', '307');
#inserting data into `spot area entry attempt`
insert into `spot area entry attempt` values
('501', '771', '20', '2022-11-11 13:23:44'),
('502', '772', '21', '2022-11-11 13:23:44'),
('503', '773', '22', '2022-11-11 13:23:44'),
('504', '774', '23', '2022-11-11 13:23:44'),
('505', '775', '24', '2023-11-11 13:23:44'),
('507', '771', '20', '2022-11-11 13:23:44'),
('508', '771', '20', '2022-11-11 13:23:44'),
('509', '771', '20', '2022-11-11 13:23:44'),
('510', '772', '20', '2022-11-11 13:23:44');

select * from `spot area entry attempt`;

# ===

# SQL queries

# query a)
select `staff number`,count(*) as `number of swipe cards` 
from `swipe card`
group by `staff number`
order by 2 desc;

#query b)
select `last name`, `given name`,`staff number` from `swipe card`
where `card id` in 
(select `card id` from `spot reservation` group by `card id` having count(*)>=2 )order by `last name`;

# query c)
select `card id`, count(*) from `spot area entry attempt` group by `card id`;
# test the card id =771 because it has more entries compared to other card id's 
select * from `spot area entry attempt`
where `card id` =771;
 
#query d)
select t5.`carpark id`,t5.`map reference`,`description`,count(t5.`parking spot id`) as `Total parking spots`from 
(select t3.`carpark id`,t3.`map reference`,t3.`description`,t4.`parking spot id` from `car park` as t3 left join( 
select t1.`area id`,t1.`carpark id`,t2.`parking spot id`  from `spot reservation parking area` as t1
left join `numbered parking spot`as t2 on
t1.`area id`=t2.`area id`) as t4 on t3.`carpark id`=t4.`carpark id`) as t5 group by t5.`carpark id`;

# query e)
select `number plate`,count(`card id`) as `number of swipe cards` from `spot reservation`
group by `number plate`
having count(`card id`)>=1;

select `card id`,count(`number plate`) as `number of different cars` from `spot reservation`
group by `card id`;

#  query f)
create table dumy as 
select t5.`carpark id`,t5.`map reference`,`description`,count(t5.`parking spot id`) as `total parking spots` from 
(select t3.`carpark id`,t3.`map reference`,t3.`description`,t4.`parking spot id` from `car park` as t3 left join( 
select t1.`area id`,t1.`carpark id`,t2.`parking spot id`  from `spot reservation parking area` as t1
left join `numbered parking spot`as t2 on
t1.`area id`=t2.`area id`) as t4 on t3.`carpark id`=t4.`carpark id`) as t5 group by t5.`carpark id`;

create table dumy1 as select t2.year,t2.Semester,t1.`parking spot id`,t1.`area id` from `numbered parking spot` as t1
inner join allocation as t2 on t1.`parking spot id`=t2.`parking spot id`;
select * from dumy1;

create table dumy2 as select t1.`area id`,t1.`carpark id`,t2.year,t2.Semester  from `spot reservation parking area` as t1
inner join dumy1 as t2 on
t1.`area id`=t2.`area id`;

select * from dumy;
select * from dumy2;
create table dumy4 select `carpark id`,`year`,Semester,count(*) as allocated
 from dumy2
 group by `carpark id`,`year`,Semester;
 select * from dumy4;
 
select t1.`carpark id`,t2.year,t2.Semester, (t1.`total parking spots` - t2.allocated) as `number of spots not allocated`  from dumy as t1
left join dumy4 as t2 on t1.`carpark id`=t2.`carpark id`;

select t1.`carpark id`,t2.year,t2.Semester, (t1.`total parking spots` - t2.allocated) 
as `number of spots not allocated`  from dumy as t1
left join dumy4 as t2 on t1.`carpark id`=t2.`carpark id` where t2.year=2022 and t2.Semester='s1';


#query g)
select t1.`staff number`, sum(t2.`payment amount`) as `Total Payment` from `swipe card` as t1
left join `spot reservation` as t2 on t1.`card id`=t2.`card id`
group by t1.`staff number`;


# query h)
select t7.`carpark id`, t7.year, sum(t7.`payment amount`) from (
(select t5.`carpark id`, t6.year, t6.`payment amount` from `spot reservation parking area` as t5 inner join
(select t3.`area id`, t4.year, t4.`payment amount` from `numbered parking spot` as t3 inner join(
select t1.`parking spot id`,t1.year, t2.`payment amount` from allocation as t1
inner join `spot reservation` as t2 on t1.`reservation id`= t2.`reservation id`) as t4 
on t3.`parking spot id`=t4.`parking spot id`) as t6 on t5.`area id`=t6.`area id`)) 
as t7 group by t7.`carpark id`, t7.year;

 
