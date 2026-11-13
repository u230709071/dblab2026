use movie_db;
# 1. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.
select title , votes ,year
from movies
where votes > 500000 and year < 2000 and 
movie_id in (select movie_id from  movie_directors join directors 
on movie_directors.director_id = directors.director_id 
where director_name like "Quentin%"); 

# 2. Show the films that Tom Hanks has act and have won more than 3 Oscars.
select m.title, m.oscars, s.star_name
from movies m
join movie_stars ms on m.movie_id = ms.movie_id
join stars s on ms.star_id = s.star_id 
where s.star_name = "Tom Hanks" and m.oscars > 3 ;

# 3. Show the history films produced in USA and whose duration is between 100-200 minutes.
 select m.title , c.counrty_name , m.duration , g.genre_name 
 from movies m 
 join genres g on m.movie_id = g.movie_id
 join producer_countries pc on m.movie_id = pc.movie_id 
 join countries c on c.country_id = pc.country_id
 where c.country_name = "USA" and g.genre_name = "History" and m.duration between 100 and 200 ;
 
# 4.Compute the average budget of the films directed by Peter Jackson.
select AVG(m.budget) as avg_budget 
from  movies m
join movie_directors  md on m.movie_id = md.movie_id
join directors d on d.director_id = md.director_id
where d.director_name = "Peter Jackson";


# 5.Show the Francis Ford Coppola film that has the maximum budget.
select m.title , m.budget 
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on md.director_id = d.director_id
WHERE d.name = 'Francis Ford Coppola'
order by  m.budget desc
LIMIT 1;

	
# 6.Show the film that has the most vote and has been produced in USA.
SELECT m.title , m.votes , c.country_name
FROM movies m
JOIN producer_countries pc ON m.movie_id = pc.movie_id
JOIN countries c ON pc.country_id = c.country_id
WHERE c.name = 'USA'
ORDER BY m.votes DESC
LIMIT 1;
# 7. List all stars who have acted in more than 1 films
SELECT s.*
FROM stars s
JOIN movie_stars ms ON s.star_id = ms.star_id
GROUP BY s.id, s.name
HAVING COUNT(ms.movie_id) > 1;
