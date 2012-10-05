-- Role:
INSERT INTO Role (Title) SELECT DISTINCT role AS Title FROM imdb_new.involved;

-- Genre:
INSERT INTO Genre (Name) SELECT DISTINCT genre AS Name FROM imdb_new.genre;

-- Movie:
INSERT INTO Movie (id, Title, Year, Language, ImdbVotes, Color, Country, DistVotes, ReleaseDate, ImdbRank) SELECT id as id, title as Title, year as Year, language as Language, imdbVotes as ImdbVotes, color as Color, country as Country, distrVotes as DistVotes, releaseDate as ReleaseDate, imdbRank as ImdbRank FROM imdb_new.movie;

-- Rating:
INSERT INTO Rating (Source, Movie_id, Rating) SELECT user as Source, movieId as Movie_id, rating as Rating FROM imdb_new.ratings WHERE (SELECT id FROM imdb_new.movie where id = imdb_new.ratings.movieId);

-- Movie_has_Movie:
INSERT INTO Movie_has_Movie (From_id, To_id) SELECT fromId AS From_id, toId AS toId FROM imdb_new.movieref;

-- Movie_has_Genre:
INSERT INTO Movie_has_Genre (Movie_id, Genre_id) SELECT DISTINCT movieId as Movie_id, (SELECT id FROM Genre WHERE Name=genre) as Genre_id FROM imdb_new.genre;

-- Person:
INSERT INTO Person (id, Name, DOB, DOD, Gender, Height) SELECT id AS id, name AS Name, gender AS Gender, birthdate AS DOB, deathdate AS DOD, height AS Height FROM imdb_new.person;

-- Contract:
INSERT INTO Contract (Person_id, Movie_id, Role_id) SELECT personId AS Person_id, movieId as Movie_id, (SELECT id FROM Role WHERE role=Title) as Role_id FROM imdb_new.involved;

-- Award:
-- N/A

-- Person_has_Award:
-- N/A

-- Movie_has_Award:
-- N/A


