#buiut in functions:
#aggreagate functions
 
 select * from city;
 select * from country;
 select * from countrylanguage;
 
select 
round(sum(SurfaceArea)/1000000,2) as Total_SA,
round(avg(SurfaceArea)/1000000,2) as Avg_SA,
round(sum(Country_Pop)/1000000,2) as Total_Pop,
round(Max(Country_Pop)/1000000,2) as Max_Pop,
round(avg(Country_Pop)/1000000,2) as Avg_Pop,
round(avg(LifeExpectancy),2) as Avg_LE,
round(sum(GNP)/1000000,2) as Total_GNP,
round(avg(GNP)/1000000,2) as Avg_GNP,
round(Max(GNP)/1000000,2) as Max_GNP
from country;
 
 
select 
count(name) as No_of_countries,
count(distinct continent) as tot_continent,
round(sum(SurfaceArea)/1000000,2) as Total_SA,
round(avg(SurfaceArea)/1000000,2) as Avg_SA,
round(sum(Population)/1000000,2) as Total_Pop,
round(Max(Population)/1000000,2) as Max_Pop,
round(avg(Population)/1000000,2) as Avg_Pop,
round(avg(LifeExpectancy),2) as Avg_LE,
round(sum(GNP)/1000000,2) as Total_GNP,
round(avg(GNP)/1000000,2) as Avg_GNP,
round(Max(GNP)/1000000,2) as Max_GNP
from country;

#provide no if cities no of dis avg pop
select 
count(distinct CountryCode) No_of_Countries,
count(distinct District) No_of_Districts,
count(distinct name) No_of_Cities,
round(Avg(Population)/1000,2) Avg_Pop
from city;

#group by continent
select 
Continent,
count(name) as No_of_Countries,
round(sum(SurfaceArea)/1000000,2) as Total_SA,
round(avg(SurfaceArea)/1000000,2) as Avg_SA,
round(sum(Population)/1000000,2) as Total_Pop,
round(Max(Population)/1000000,2) as Max_Pop,
round(avg(Population)/1000000,2) as Avg_Pop,
round(avg(LifeExpectancy),2) as Avg_LE,
round(sum(GNP)/1000000,2) as Total_GNP,
round(avg(GNP)/1000000,2) as Avg_GNP,
round(Max(GNP)/1000000,2) as Max_GNP
from country
group by Continent;
 
 #remove antarctica 
 select 
Continent,
count(name) as No_of_Countries,
round(sum(SurfaceArea)/1000000,2) as Total_SA,
round(avg(SurfaceArea)/1000000,2) as Avg_SA,
round(sum(Population)/1000000,2) as Total_Pop,
round(Max(Population)/1000000,2) as Max_Pop,
round(avg(Population)/1000000,2) as Avg_Pop,
round(avg(LifeExpectancy),2) as Avg_LE,
round(sum(GNP)/1000000,2) as Total_GNP,
round(avg(GNP)/1000000,2) as Avg_GNP,
round(Max(GNP)/1000000,2) as Max_GNP
from country
group by Continent having continent <> "Antarctica"
order by Total_SA desc;

#fetech country wise data of districts no of cities and avg city pop

select CountryCode, District,
count(distinct district) No_of_Dis,
count(distinct name) no_of_cities,
round(avg(population),0) Avg_city_pop
from city
group by CountryCode, District;

#date and time functions

use sakila;
 select * from rental;
 
 select 
Rental_date,
Day(rental_date) as Rental_Day,
month(rental_date) as Rental_Month,
year(rental_date) as Rental_Year,
hour(rental_date) as Rental_hour
from rental;

select rental_date, time(rental_date) as Time, date(rental_date) as Date from rental;

select * from rental
limit 5;

select rental_id, 
rental_date,
inventory_id, 
customer_id,
datediff(return_date,rental_date) as Rentak_duration
 from rental;
 # want rental movie back on time
select rental_id, 
date(rental_date) as Rental_date,
date_add(date(rental_date), interval 7 day) as Target_return_date,
date(Return_date) as Return_Date,
inventory_id,
customer_id,
datediff(date_add(date(rental_date), interval 7 day),return_date) as Return_lag,
datediff(return_date,rental_date) as Rental_duration
from rental
where datediff(date_add(date(rental_date), interval 7 day),return_date) < 0;
 

select *,weekday(rental_date) as Rental_day from rental;
### Date,Day,Year, Month, Time, Hour, Min, Seconds, datediff, date_add, date_sub,weekday