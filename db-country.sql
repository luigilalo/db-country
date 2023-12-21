-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq
select name
from countries  
where name like 'P%' and area > '1.000'

-- 2. Contare quante nazioni sono presenti nel database
select count(*)
from countries 

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico
select r.name
From regions r join continents c on r.continent_id=c.continent_id where c.name='Europe' 
Order by name

-- 4. Contare quante regioni sono presenti nel continente Africa
select count(*)
from regions r join continents c on r.continent_id=c.continent_id where c.name = 'Africa'

-- 5. Selezionare quali nazioni non hanno un national day
select 	c.name from countries c where c.national_day IS NULL

-- 6.  Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente
select c.name, r.name, c2.name from countries c join regions r 
on c.region_id = r.region_id join continents c2 
on c2.continent_id = r.continent_id
group by c.name , r.name , c2.name 
order by c.name ASC 


-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010
select c.name, AVG(cs.gdp)
from countries c join country_stats cs 
on cs.country_id = c.country_id 
where c.name like 'United Kingdom' AND cs.`year` >=2000 AND cs.`year` <= 2010
GROUP by c.name 

-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa
select c.name from countries c 
join country_languages cl on c.country_id=cl.country_id 
join languages l on l.language_id=cl.language_id 
where l.`language` like 'Hindi'
order by c.area DESC

-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946
update countries set national_day = '1946-06-02'
where name like  'Italy'