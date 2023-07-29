create database TEST;

CREATE TABLE bands (
  id_band SERIAL not null PRIMARY KEY,
  name_band VARCHAR(255) NOT NULL
);

create table albums (
	id_album SERIAL not null primary KEY,
	name_album VARCHAR(255) not null,
	release_year INT,
	band_id INT not null,
	foreign key (band_id) references bands(id_band)
);

insert into bands(name_band)
values ('BLACKPINK'), ('Endah n Rhesa'), ('HiVi'),
('Sheila On 7');

select name_band from bands; 
select * from bands;
select name_band from bands limit 3;
select id_band AS "id band", name_band AS "band name" from bands;
select id_band AS "1", name_band AS "2" from bands;
select * from bands order by name_band;
select * from bands order by name_band asc;
select * from bands order by name_band desc;

insert into albums (band_id, name_album, release_year)
values (1, 'Sweet', 2009),
		(2, 'Acopolypse', 2013),
		(3, 'K', 2016),
		(4, 'About You', NULL);
	
insert into albums (band_id, name_album, release_year)
values (1, 'Sweet', 2023);
	
insert into bands(name_band)
values ('Arctic Monkeys');
	
select * from albums;
select * from bands;
select name_album from albums;
select distinct name_album from albums;

update albums
set release_year = 2019
where name_album = 'K';
select * from albums;

update albums
set release_year = NULL
where id_album = 4;
select * from albums;

update albums
set release_year = 2000
where band_id = 2;
select * from albums;

select * from albums
where release_year < 2019;

select * from albums
where release_year <= 2019
order by release_year ASC;

select * from albums order by band_id;

select * from albums 
where name_album like '%y%';

select * from albums 
where name_album like '%y%' or band_id = 1;

select * from albums 
where name_album like '%y%' AND band_id = 5;

select * from albums 
where name_album like '%y%' AND band_id = 2;

select * from albums
where release_year between 2000 and 2023;

select * from albums
where release_year is NULL;

delete from albums where band_id = 2;

select * from albums;

select * from bands
join albums on bands.id_band = albums.band_id;

select * from bands
inner join albums on bands.id_band = albums.band_id;

select * from bands
left join albums on bands.id_band = albums.band_id;

select * from bands
right join albums on bands.id_band = albums.band_id;

select * from albums
right join bands on bands.id_band = albums.band_id;

select avg(release_year) from albums;

select band_id, count(band_id) from albums
group by band_id order by band_id;

select b.id_band, b.name_band as band_name, count(a.id_album) as album_number
from bands as b
join albums as a on b.id_band = a.band_id
group by b.id_band
order by id_band;






