create database movies;
use movies;
select * from actor;
select * from cast;
select * from movie;
select * from reviewer;
select * from ratings;
select * from genres;
select * from movie_genres;
desc movie;
desc reviewer;
desc ratings;

#Write a SQL query to find when the movie 'American Beauty' released. Return 
#movie release year.
select mov_title, mov_year,mov_dt_rel from movie where mov_title in ('American Beauty') ;



#ii. Write a SQL query to find those movies, which were released before 1998. Return 
#movie title.
select mov_title,mov_year from movie where mov_year <1998;




#iii. Write a query where it should contain all the data of the movies which were 
#released after 1995 and their movie duration was greater than 120.
select * from movie where mov_year >1998 and mov_time>120;




#iv. Write a query to determine the Top 7 movies which were released in United 
#Kingdom. Sort the data in ascending order of the movie year.
select mov_title,mov_year,mov_rel_country from movie where mov_rel_country ='UK' order by mov_year asc limit 7;





#v. Set the language of movie language as 'Chinese' for the movie which has its 
#existing language as Japanese and the movie year was 2001.
update movie set mov_lang='chinese' where mov_lang ='Japanese' and mov_year=2001;
select * from movie;


#vi. Write a SQL query to find name of all the reviewers who rated the movie 
#'Slumdog Millionaire'.
SELECT r.rev_name,m.mov_title
FROM movie m, reviewer r, ratings ra
WHERE m.mov_title = 'Slumdog Millionaire'
AND m.mov_id = ra.mov_id
AND ra.rev_id = r.rev_id;





#vii. Write a query which fetch the first name, last name & role played by the 
#actor where output should all exclude Male actors.
select a.act_fname,a.act_lname,a.act_gender,c.role from actor a , cast c where act_gender ='F';


#viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.
#Fetch all the fields of actor table. (Hint: Use the IN operator).
select a.*, m.mov_title,c.role from actor a,cast c, movie m where m.mov_title ='Annie Hall' and m.mov_id=c.mov_id and a.act_id=c.act_id ;


#ix. Write a SQL query to find those movies that have been released in countries other 
#than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title,mov_year,mov_time,mov_dt_rel,mov_rel_country from movie where mov_rel_country !='uk';


#x. Print genre title, maximum movie duration and the count the number of 
#movies in each genre. (HINT: By using inner join)   
select g.gen_title,max(m.mov_time),count(m.mov_title) from genres g inner join movie_genres mg on g.gen_id=mg.gen_id inner join movie m on m.mov_id=mg.mov_id group by g.gen_title;

select * from details;


#xi. Create a view which should contain the first name, last name, title of the 
#movie & role played by particular actor.
create view details as (select a.act_fname,a.act_lname,m.mov_title,c.role from actor a, movie m,cast c );

select * from details;


#xii. Write a SQL query to find the movies with the lowest ratings
select m.mov_title,min(r.rev_stars) as lower_ratings from movie m, ratings r group by m.mov_title;



#xiii. Finally Mail the script to jeevan.raj@imarticus.com

