/*1*/
explain Select count(distinct title) From Movie where language="Danish";
Select count(distinct title) From Movie where language="Danish";

/*3*/
explain Select title from Movie,
    ((Select Movieid from
    (select Movie_id as movieid from Contract where Contract.person_Id=
                (select id from Person where name="John Travolta")) as john,
    (select Movie_id as id from Contract where Contract.person_Id=
            (select id from Person where name="Uma Thurman")) as uma
    where john.movieid=uma.id) as tempid)
where tempid.movieid =Movie.id;
Select title from Movie,
    ((Select Movieid from
    (select Movie_id as movieid from Contract where Contract.person_Id=
                (select id from Person where name="John Travolta")) as john,
    (select Movie_id as id from Contract where Contract.person_Id=
            (select id from Person where name="Uma Thurman")) as uma
    where john.movieid=uma.id) as tempid)
where tempid.movieid =Movie.id;


/*4*/
explain Select count(distinct name) from Person where name like "Q%";
Select count(distinct name) from Person where name like "Q%";

/*5*/
