create database Musician;
use Musician;
create table Musician(
MID int auto_increment primary key ,
Mname varchar(100) ,
street varchar(100) ,
city varchar(60) ,
phonumber varchar(15) ,
unique(Mname) );
create table album (
AID int primary key auto_increment ,
title varchar(100) ,
copyright_date date,
producerID int not null,
foreign key (producerID) references Musician(MID)
);
create table song (
songID int primary key  auto_increment,
title varchar(100) ,
author varchar(100),
AlbumID int not null , -- not null is used when the relation is Full
foreign key(AlbumID) references album(AID)
);
Create table instrument (
inst_name varchar(100) unique ,
music_key varchar(5)
);
create table play (
mus_ID int ,
instrument_name varchar(100),
primary key(mus_ID, instrument_name),
foreign key( mus_ID) references Musician(MID) ,
foreign key ( instrument_name) references instrument(Inst_name)
);
select m.MID, m.Mname, p.instrument_name
from musician m
join play p on m.MID = p.mus_ID
order by m.MID asc;

select s.songID, s.title, s.author, a.title as album_title
from song s
join album a on s.AlbumID = a.AID
order by s.songID asc;