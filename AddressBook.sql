--  UC1: creare a AddressBook database 
create database AdressBookDB;

--  UC2: creare a AddressBook Table 
create table AddressBook
(
firstName varchar(25) not null,
lastName varChar(25) not null,
address varchar(100) not null,
city varchar(25) not null,
state varchar(25) not null,
zip int not null,
phoneNumber varchar(13),
email varchar(40) not null
);

sp_help AddressBook;


--  UC3: Insert contacts into AddressBook Table
insert into AddressBook
values('sai', 'kumar', 'kadiri', 'ATP', 'AP', 515571 , '9087654321', 'sai@gmail.com');

insert into AddressBook
values('Srikanth', 'Ravi', 'Mehaboobnagar', 'Hyderabad', 'TS', 525677 , '9087654321', 'srikanth@gmail.com');

insert into AddressBook
values('Venu', 'krishna', 'Elur', 'Vijayawad', 'AP', 535572 , '9087654321', 'venu@gmail.com');

insert into AddressBook
values('Sai', 'Teja', 'Tirupati', 'Chittor', 'AP', 515671 , '9066667371', 'saiteja@gmail.com');

insert into AddressBook
values('Kishan', 'Verma', 'Ayodhya', 'Ayodhya', 'UP', 501177 , '9187654331', 'srikanth@gmail.com');

insert into AddressBook
values('Samarth', 'Agrawal', 'indoor', 'bhopal', 'MP', 535577 , '9000110020', 'sam@gmail.com');

insert into AddressBook
values('Arundhati', 'Roy', 'Kolkata', 'Kolkata', 'WB', 404433 , '9187654331', 'arundhatiroy@gmail.com');


insert into AddressBook
values('Balaji', 'Naik', 'ATP', 'ATP', 'AP', 515571 , '9265231901', 'balaji@gmail.com');


select * from AddressBook;

--  UC4: edit excisting contact using name
update AddressBook
set phoneNumber = '9000777441' 
where firstName = 'sai' and lastName = 'kumar';

--  UC5: delete a person using name
delete AddressBook
where firstName = 'Venu' and lastName = 'Krishna';

delete AddressBook
where state = '';

--  UC6: retrieve addressbook using city or state
select * from AddressBook
where city = 'ATP' or state = 'TS';

--  UC7: count addressbook using city or state
select state, count(*) as AddressCount
from AddressBook
group by (state);

select city, count(*) as AddressCount
from AddressBook
group by (city);

-- UC8: get addressbook from a city sorted by name
select * from AddressBook
where city = 'ATP'
order by (firstName);

-- UC9: Alter table and Add Name and Type of relation to the addressbook 
alter table AddressBook add 
Name varchar(255),
Type varchar(255);


-- UC9: identify and Update the type and name of in the addressbook 
update AddressBook set Name='Sai Contatcs' ;

update AddressBook set Type ='Family' where firstName='Sai'; 

update AddressBook set Type ='Friend' where firstName='Srikanth'; 

update AddressBook set Type ='Frined' where firstName='Kishan'; 

update AddressBook set Type ='Friend' where firstName='Samarth'; 

update AddressBook set Type ='Office' where firstName='Arundhati'; 

update AddressBook set Type ='Family' where firstName='Balaji'; 

--  UC10: get count by type of relation

select Type, count(*) as TypeCount 
from AddressBook
group by Type
order by count(*);

--  UC11: Add person to family and friend
insert into AddressBook
values('Jahnavi', 'Janu', 'Vizag', 'Vizag', 'AP', 535572 , '9265231901', 'jnv@gmail.com','Sai contact', 'family');

insert into AddressBook
values('Jahnavi', 'Janu', 'Vizag', 'Vizag', 'AP', 535572 , '9265231901', 'jnv@gmail.com','Sai contact', 'friend');