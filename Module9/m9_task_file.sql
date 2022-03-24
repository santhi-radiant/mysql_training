Q30. which actor did least movies?

select actor_id,count(actor_id)from film_actor group by actor_id 

order by count(actor_id) asc;

Q29. how may languages of movies were released each year?

select language.name,count(film.language_id) as number_of_films from 

film inner join language on language.language_id=film.language_id 

group by film.language_id;

Q28. How many movies were released each year?

select film.release_year, count(film.release_year) as number_of_films 

from film group by film.release_year;

Q27.which film has the shortest length? in which language and year 

was it released?

select language.name,film.title,film.release_year,film.length from 

film left join language on language.language_id=film.language_id 

where film.length=(select min(film.length) from film);


Q26.what is the total length of all movies played in 2008?

select sum(film.length) from film where film.release_year=2008;


Q25.Fetch the actors of the movie WESTWARD SEABISCUIT with the city 

they live in.

select actor.first_name,actor.last_name,film.title,city.city from 

film_actor inner join actor on actor.actor_id=film_actor.actor_id 

inner join address on address.address_id=actor.address_id inner join 

city on city.city_id=address.address_id inner join film on 

film.film_id=film_actor.film_id where film.title="WESTWARD 

EABISCUIT";


Q24.how many SCI-FI film released between the  year 2007 to 2017?

select count(*) from film_category inner join film on 

film.film_id=film_category.film_id inner join category on 

category.category_id=film_category.category_id where 

film.release_year between 2007 and 2017 and category.name="Sci-Fi";

Q23.How many actors acted in films released in 2017?

select count(*) from film_actor inner join film on 

film.film_id=film_actor.film_id where film.release_year=2017;

Q22.The entire category of the movie WEST LION was wrongly 

inserted.The correct categories are classics,family,children. How 

would you update the record ensuring no wrong data is left?

--delete from film_category where film_id=(select film_id from film 

where film.title="WEST LION");

--insert into film_category(category_id,film_id)values((select 

category_id from category where category.name="Classics"),(select 

film_id from film where film.title="WEST LION")),((select category_id 

from category where category.name="Family"),(select film_id from film 

where film.title="WEST LION")),((select category_id from category 

where category.name="Children"),(select film_id from film where 

film.title="WEST LION"));


Q21. The entire cast of the movie WEST LION has changed.the new 

actors are DAN TORN,MAE HOFFMAN,SCARLETT DAMON. hOW WOULD YOU UPDATE 

THE RECORD IN THE SAFEST WAY?

--delete from film_actor where film_id=(select film_id from film 

where film.title="WEST LION");

--INSERT into film_actor(actor_id,film_id)values((select actor_id 

from actor where actor.first_name="DAN" AND actor.last_name="TORN"),

(select film_id from film where film.title="WEST LION")),((select 

actor_id from actor where actor.first_name="MAE" AND 

actor.last_name="HOFFMAN"),(SELECT film_id from film where 

film.title="WEST LION")),((SELECT actor_id from actor where 

actor.firs_name="SCARLETT" AND actor.last_name="DAMON"),SELECT 

film_id from film where film.title="WEST LION");



Q20.the HARPER DYING movie is an animated movie with drama and 

comedy. assign these categories to the movie.

-- insert into film_category(category_id,film_id)values((select 

category_id from category where category.name="Drama"),(select 

film_id form film where film.title="HARPER DYING")),((select 

category_id from category where category.name="Comedy"),(select 

film_id from film where film.title="HARPER DYING")) ON DUPLICATEKEY 

UPDATE film_id=values(film_id),category_id=values(category_id);


q19.the actor johnny lollobrigida was removed form the movie GRAIL 

FRANKESNSTEIN. HOW would you update that record?

--delete from film_actor where film_id=(select film_id form film 

where film.title="grail frankenstein") and actor_id=(select actor_id 

form actor where actor.first_name="johnny" and 

actor.last_name="LOLLOBRIAGIDA");


q18. Which actor acted in most movies?

--select actor_id,count(actor_id)from film_actor group by actor_id 

order by count(actor_id) desc limit 1;


q17.Assign a new category thriller to the movie ANGELS LIFE.

--insert into category(name)values("Thriller");
--insert into film_category(film_id,category_id)values((select 

film_id from film where film.title="ANGELS LIFE"),(select category_id 

from category where category.name="Thriller"));



q16.Assign the cast: PENELOPE GUINESS, NICK WAHLBERG, JOESWANK to the 

movie "No Time to Die".

--insert into film_actor(actor_id,film_id)values((select actor_id 

form actor where actor.first_name="PENELOPE" AND 

actor.last_name="GUINESS"),(select film_id from film where 

film.title="No Time to Die")),
((SELECT actor_id from actor where actor.first_name="NICK" AND 

actor.last_name="WAHLBERG"),(SELECT film_id from film where 

film.title="No Time to Die")),((SELECT actor_id from actor where 

actor.first_name="JOE" AND actor.last_name="SWANK"),(SELECT film_id 

from film where film.title="No Time to Die"));




Q15.Assign the category action,classics,drama to the movie "No Time 

to Die".

--insert into film_category(category_id,film_id)values((select 

category_id from category where category.name="Action"),(select 

film_id from film where film.title="No Time to Die")),
((select category_id from category where category.name="classic"),

((select film_id from film where film.title="No Time to Die")),
((select category_id from category where category.name="Drama"),

((select film_id from film where film.title="No Time to Die"))


Q11.Get the details of the film with maximum length released in 2014.


--select *, language.name as language from film left join language on 

language.language_id=film.language_id where film.release_year="2014" 

and film.length=(select max(film.length)from film);


q10.In which year least number of film were released?

--select film.title,film.release_year,count(film.release_year)as 

no_of_film from film group by  (film.release_year)order by count

(film.release_year)asc limit 1;


q9.In which year most film were released?

--select film.title,film.release_year,count(film.release_year)as 

no_of_films from film group by (film.release_year) order by count

(film.release_year) desc limit 1;



q8.fetch cast details of film released during 2005 and 2015 with pg 

rating.


select concat(actor.first_name,"",actor.last_name)as 

actor_name,film.title,film.release_year,film.rating from actor inner 

join film_actor on film_actor.actor_id=actor.actor_id inner join film 

on film.film_id=film_actor.film_id where film.release_year between 

2005 and 2015 and film.ating="PG" ;


q7.The film alone trip(id:17) was actually released in Mandarin, 

update the info.


--update film set language_id=(select language.language_id from 

language where language.name="English")where film.film_id=17;

q6.Get all languages in which films are released in the year between 

2001 and 2010.


select language.name,film.release_year,count(language.language_id)as 

number_of_films from language left join film on 

film.language_id=language.language_id where film.release_year between 

2001 and 2010 group by language.language_id;

q5.How many actors are from the united states?

--select count(*) from actor inner join address on 

address.address.id=actor.address_id inner join city on 

city.city_id=address.city_id inner join country on 

country.country_id=city.country_id where country.country="United 

States";

q4.Get the name of films of the actors who belong to india.

--select distinct film.title from film inner join film_actor on 

film_actor.film_id=film.film_id inner join actor on 

actor.actor_id=film_actor.actor_id inner join address on 

address.address_id= actor.address_id inner join city on 

city.city_id=address.city_id inner join country on 

country.country_id=city.country_id where country.country="India";


q3.add the new actors(id:105,95)in film ARSENIC INDEPENDENCE(id:41)

--insert into film_actor(actor_id,film_id)values(115,41),(85,41)
ON DUPLICATE KEY UPDATE film_id=values(film_id),actor_id=values

(actor_id);


q2.update the address of actor id 36 to "677 jazz Street".

--update address inner join actor on 

actor.address_id=address.address_id set address="677 Jaz Street" 

where actor.actor_id=36;


q1.which categories of movies released in 2018? fetch with the number 

of movies.
-select 

category.name,category.category_id,film.release_year,film.film_id,cou

nt(category.category_id)as number_of_films from category left join 

film_category on film_category.category_id=category.category_id right 

join film on film.film_id=film_category.cilm_id where 

film.release_year="2018" group by category.category_id;






