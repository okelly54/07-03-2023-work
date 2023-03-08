-- Find actor with the most films
  SELECT
    actor_id, COUNT(film_id)
  FROM
    `film_actor`
  GROUP BY
    ORDER BY COUNT(film_id) DESC LIMIT 1;
    -- This produced a list of actor_id which was counted from film_actor.
    -- We grouped them by actor id to list the ids and then ordered them by count, how many times the actor id
    -- appeared in that list, and output them in that order. DESC LIMIT 1 specified that we see only 1,
    -- the one with the highest count
    SELECT * FROM `actor` WHERE actor_id = 107;
    SELECT `first_name`, `last_name` FROM actor WHERE actor_id;
    -- Since we now know the actor id which appeared most in the film list, we use it in the next query
    -- to find the first and last name of the actor
    
-- Answer to question 1 is actor_id 107, Gina Degeneres.




-- Average running time of all the films in the database
  SELECT
    AVG(`length`)
  FROM
    `film`;
-- This selects the average of length from the films

-- Answer to question 2 is 115.2720 (115.27 mins)




-- Average run time of films by category
  -- TRIAL AND ERROR CODE
  
  DESCRIBE `sakila`.`film_list`;
  -- Film_list is a type of view that we can use
  SELECT `category`, AVG(`length`) FROM `sakila`.`film_list`;
  -- every film category and run time
  -- this outputs "documentary - 115" which shows the first category
  -- and average length of all films
  -- this doesn't work as we want. we need to use group by category for this instead
  
  -- ACTUAL WORKING CODE
  SELECT `category`, AVG(`length`)
  FROM `sakila`.`film_list`
  GROUP BY `category` ORDER BY `category` ASC;
  -- First line outputs categories and average length in two different columns
  -- Second line specifies it is from film list within sakila
  -- Third line groups output by category and orders them, from category, by ascending
  
-- Answer to question 3
-- Action - 111
-- Animation - 111
-- Children - 109
-- Classics - 111
-- Comedy - 115
-- Documentary - 108
-- Drama - 119
-- Family - 114
-- Foreign - 121
-- Games - 127
-- Horror - 112
-- Music - 113
-- New - 111
-- Sci-Fi - 108
-- Sports - 127
-- Travel - 113



-- How many movies with ROBOTS in them
  SELECT
    COUNT(*)
  FROM
    `film`
  WHERE
    `description` LIKE '%robot%';
-- This returns the sum of films which have a description including the word "robot"

-- Answer to question 4 is 77




-- Movies with the longest runtime
  SELECT
    film_id, (`length`)
  FROM
    `film`
  ORDER BY
    `length`;
-- This returns a list of films sorted by length

-- Answer to question 5 is film 15, 469, 504, 505, 730
-- need to work out how to output names of films from this




-- Count how many movies were released in the year 2010
SELECT
  COUNT(*)
FROM
  `film`
WHERE
  `release_year` = 2010;
-- This returns NULL for everything as there are no films from 2010



-- Which last names are not repeated
-- Trial and error code
DESCRIBE `sakila`.`actor`;
SELECT `last_name`, COUNT(`last_name`)
FROM `sakila`.`actor`
WHERE COUNT(`last_name`) = 1
GROUP BY `last_name`;
-- we need to use HAVING rather than WHERE here
-- because it uses it last and we can't use WHERE with aggregations

-- Working code
SELECT
  `last_name`,
  COUNT(`last_name`)
FROM
  `sakila`.`actor`
GROUP BY
  `last_name`
HAVING
  COUNT(`last_name`) = 1;


-- Answer to question 7
