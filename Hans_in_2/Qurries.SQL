/*1:*/
Select count(distinct title) From Movie where language="Danish";

/*2:*/
Select year,sum(imdbvotes) from movie group by year;

/*3:*/
Select title from movie,
    ((Select movieid from
    (select movie_id as movieid from contract where contract.person_Id=
                (select id from person where name="John Travolta")) as john,
    (select movie_id as id from contract where contract.person_Id=
            (select id from person where name="Uma Thurman")) as uma
    where john.movieid=uma.id) as tempid)
where tempid.movieid =movie.id;

/*4:*/
Select count(distinct name) from person where name like "Q%";

/*5:*/
select count(*) FROM (SELECT count(*) c FROM Rating Group BY Source HAVING c>=10) as something;

/*6:*/
Select name,DOB from person
Inner join
(select person_id from contract where contract.movie_id=
    (Select id from movie where title="Pulp fiction")) as perid
on person.id=perid.person_id
order by DOB;

/*7:*/
Select title,year from movie
inner join
(select movie_id as movieid from contract where contract.person_Id=
                (select id from person where name="John Travolta")) as john
on movie.id=john.movieid
where year>=1980 and year<1990 order by year;

/*8:*/
Select title, imdbrank as Rank
from movie where year>=1990 and year<2000 order by imdbrank desc limit 5;

/*9:*/
select title from movie
Inner join
    (select movie_id as id,rating FROM (SELECT count(*)c ,rating, movie_id as movie_id FROM
Rating Group BY movie_id HAVING c>=4 order by rating desc limit 5) as something) as temp
on movie.id =temp.id;

/*10:*/
SELECT avg(ImdbRank),language FROM Movie WHERE year=1994 group by language;

/*12:*/
SELECT title,imdbRank FROM Movie,(SELECT movie_id movid from Contract where Contract.Person_Id=(select id from Person where name="John Travolta")) as something WHERE id=movid GROUP BY imdbRank DESC LIMIT 1;

/*13:*/
SELECT count(*) FROM Person,(SELECT DOB cb,DOD cd FROM Person WHERE name="Charles Chaplin") as cha WHERE gender="f" AND (dob>cd OR dod<cb);

/*14*/
SELECT avg(imdbRank), Genre.name FROM Movie,Movie_has_Genre as mhg, Genre where Movie.id = mhg.Movie_id and Genre.id = mhg.Genre_id Group by name;

/*15:*/
SELECT name,count(*) FROM(SELECT name  FROM Rating as r,Movie_has_Genre as mhg, Genre Where r.Movie_id = mhg.Movie_id and Genre.id = mhg.Genre_id) as gen Group by name having count(*)>9;

/*16:*/
Select title, id from movie,
(Select count(*)as c, from_id as new_id from (
select from_id as from_id, to_id from movie_has_movie
Inner join
(Select from_id as startId, to_id as id from movie_has_movie) as temp
on movie_has_movie.from_id=temp.id) as med
group by from_id order by c desc limit 1) as puck
where movie.id =puck.new_id;

/*17:*/
select count(Distinct c1.Person_id) from Contract as c1, Contract as c2 where c1.Role_Id = 1 and c2.Role_Id = 2 and c1.Person_id = c2.Person_id;

