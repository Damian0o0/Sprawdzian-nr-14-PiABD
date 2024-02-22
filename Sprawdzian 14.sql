use mondial; 
------------------------------------------------
--1 
--Utwórz tabele Tymczasow¹ "Temp1" zawieraj¹c¹ atrybuty: 
--kod kraju, nazwa kraju , stolicê kraju, kontynent
--Zaimportuj do tabeli dane z bazy Mondial.(insert into select) uwzgledniaj¹c
--¿e nazwy  krajów zaczynaj¹cych siê na literê A ,
select * from country;
select * from encompasses;

---wykonaj tabelê tymczasow¹  dwoma sposobami

select country.code as 'kod',country.name as 'kraj', country.Capital as 'stolica', encompasses.Continent as 'continent'
into #Temp1 from country 
inner join encompasses on country.Code=encompasses.Country where country.Name like 'A%';

select * from #Temp1;

create table #Temp11(
kod varchar(10) not null,
kraj varchar(100) not null,
stolica varchar(100) not null,
kontynent varchar(100) not null
)

select * from #Temp11;

drop table #Temp11;

insert into #Temp11(kod, kraj, stolica, kontynent)
select country.Code, country.Name, country.Capital, encompasses.Continent from country
inner join encompasses on country.Code=encompasses.Country where country.Name like 'A%';

select * from #Temp11;


