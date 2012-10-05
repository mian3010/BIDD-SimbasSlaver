SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `SimbasIMDB` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `SimbasIMDB` ;

-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Person`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Person` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  `DOB` DATE NULL ,
  `DOD` DATE NULL ,
  `Gender` VARCHAR(45) NULL ,
  `Height` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Movie`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Movie` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NOT NULL ,
  `Year` INT NOT NULL ,
  `Language` VARCHAR(45) NOT NULL ,
  `ImdbVotes` INT NULL ,
  `Color` VARCHAR(45) NULL ,
  `Country` VARCHAR(45) NULL ,
  `DistVotes` VARCHAR(45) NULL ,
  `ReleaseDate` DATE NULL ,
  `ImdbRank` FLOAT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Genre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Genre` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Award`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Award` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NULL ,
  `Description` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Role`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Role` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Contract`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Contract` (
  `Person_id` INT NOT NULL ,
  `Movie_id` INT NOT NULL ,
  `Role_id` INT NOT NULL ,
  INDEX `fk_Contract_Person1_idx` (`Person_id` ASC) ,
  INDEX `fk_Contract_Movie1_idx` (`Movie_id` ASC) ,
  INDEX `fk_Contract_Role1_idx` (`Role_id` ASC) ,
  CONSTRAINT `fk_Contract_Person1`
    FOREIGN KEY (`Person_id` )
    REFERENCES `SimbasIMDB`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contract_Movie1`
    FOREIGN KEY (`Movie_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contract_Role1`
    FOREIGN KEY (`Role_id` )
    REFERENCES `SimbasIMDB`.`Role` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Rating`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Rating` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `Rating` INT NOT NULL ,
  `Movie_id` INT NOT NULL ,
  `Source` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Rating_Movie1_idx` (`Movie_id` ASC) ,
  CONSTRAINT `fk_Rating_Movie1`
    FOREIGN KEY (`Movie_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Movie_has_Award`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Movie_has_Award` (
  `Movie_id` INT NOT NULL ,
  `Awards_id` INT NOT NULL ,
  `Year` INT NULL ,
  PRIMARY KEY (`Movie_id`, `Awards_id`) ,
  INDEX `fk_Movie_has_Awards_Awards1_idx` (`Awards_id` ASC) ,
  INDEX `fk_Movie_has_Awards_Movie1_idx` (`Movie_id` ASC) ,
  CONSTRAINT `fk_Movie_has_Awards_Movie1`
    FOREIGN KEY (`Movie_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Awards_Awards1`
    FOREIGN KEY (`Awards_id` )
    REFERENCES `SimbasIMDB`.`Award` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Movie_has_Genre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Movie_has_Genre` (
  `Movie_id` INT NOT NULL ,
  `Genre_id` INT NOT NULL ,
  PRIMARY KEY (`Movie_id`, `Genre_id`) ,
  INDEX `fk_Movie_has_Genre_Genre1_idx` (`Genre_id` ASC) ,
  INDEX `fk_Movie_has_Genre_Movie1_idx` (`Movie_id` ASC) ,
  CONSTRAINT `fk_Movie_has_Genre_Movie1`
    FOREIGN KEY (`Movie_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Genre_Genre1`
    FOREIGN KEY (`Genre_id` )
    REFERENCES `SimbasIMDB`.`Genre` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Person_has_Award`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Person_has_Award` (
  `Person_id` INT NOT NULL ,
  `Award_id` INT NOT NULL ,
  `Year` INT NULL ,
  PRIMARY KEY (`Person_id`, `Award_id`) ,
  INDEX `fk_Person_has_Award_Award1_idx` (`Award_id` ASC) ,
  INDEX `fk_Person_has_Award_Person1_idx` (`Person_id` ASC) ,
  CONSTRAINT `fk_Person_has_Award_Person1`
    FOREIGN KEY (`Person_id` )
    REFERENCES `SimbasIMDB`.`Person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_has_Award_Award1`
    FOREIGN KEY (`Award_id` )
    REFERENCES `SimbasIMDB`.`Award` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimbasIMDB`.`Movie_has_Movie`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SimbasIMDB`.`Movie_has_Movie` (
  `From_id` INT NOT NULL ,
  `To_id` INT NOT NULL ,
  PRIMARY KEY (`From_id`, `To_id`) ,
  INDEX `fk_Movie_has_Movie_Movie2_idx` (`To_id` ASC) ,
  INDEX `fk_Movie_has_Movie_Movie1_idx` (`From_id` ASC) ,
  CONSTRAINT `fk_Movie_has_Movie_Movie1`
    FOREIGN KEY (`From_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Movie_Movie2`
    FOREIGN KEY (`To_id` )
    REFERENCES `SimbasIMDB`.`Movie` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Oour imports
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


