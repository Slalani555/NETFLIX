CREATE DATABASE netflix;

USE NETFLIX;

SELECT * FROM netflix_titles LIMIT 10;

-- Fetch duplicated records
Select show_id, title, count(*) as dup_count from netflix_titles
GROUP BY show_id,title HAVING count(show_id)>1;

Select type, Count(*)
from netflix_titles
where rating = 'TV-PG'
GROUP BY type;

-- First approach
-- Filter for 2019 records
-- Count the number of records with TV-PG rating
-- Count the total records for filtered data
-- Otput ratio- Rating_TVPG/total_ratings
Select Rating_TVPG/total_ratings as Pct_TVPG_ratings
from (Select 
Count(case when rating='TV-PG' then show_id else null end) as Rating_TVPG,
count(*) as total_ratings
from netflix_titles
where release_year='2019') a;

-- Second approach
Select 
Count(case when rating='TV-PG' then show_id else null end)/count(*) as Pct_TVPG_ratings
from netflix_titles
where release_year='2019';

Select show_id,type,director, Count(type) from netflix_titles
WHERE release_year='2019'
GROUP BY type;

SELECT * from netflix_titles
WHERE date_added >'September 8,2017' and date_added <'September 9,2016';

-- Fetch the records with the 3rd highest date_added
Select * from (Select * from netflix_titles
ORDER BY date_added desc limit 3) as T
ORDER BY date_added limit 1;

-- Print ODD records from the table
with CTE AS
(SELECT *, row_number() over (order by show_id) as rn
from netflix_titles
)
SELECT * FROM CTE WHERE rn%2=1;





