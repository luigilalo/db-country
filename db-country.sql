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