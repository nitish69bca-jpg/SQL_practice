# renaming columns

ALTER TABLE spotify RENAME COLUMN `Total Streams (in millions)` TO `Total Streams`;
ALTER TABLE spotify RENAME COLUMN `Country of Origin` TO `Country`;
ALTER TABLE spotify RENAME COLUMN `Primary Genre` TO `Genre` ;

ALTER TABLE spotify
    RENAME COLUMN `Lead Streams (in millions)` TO `Lead Streams`,
    RENAME COLUMN `Feature Streams (in millions)` TO `Feature Streams`,
    RENAME COLUMN `Solo Streams (in millions)` TO `Solo Streams`,
    RENAME COLUMN `% of Solo Streams` TO `% of SS`,
    RENAME COLUMN `Collaborative Streams (in millions)` TO `Collaborative Streams`,
    RENAME COLUMN `% of Collaborative Streams` TO `% of CS`,
    RENAME COLUMN `Primary Language` TO `Language`,
    RENAME COLUMN `Artist Type` TO `Artist Type`;
    


# Column names 
DESCRIBE `spotify`; 

# retriving 10 rows of each columns
select * from spotify
limit 10;

# Display only the artist names.
SELECT `Artist Name`
FROM spotify;

# Display the artist name, country, and primary genre.
SELECT 
    `Artist Name`,
    `Country`,
    `Genre`
FROM spotify;

# Display all artists who are from Canada.
SELECT *
FROM spotify
WHERE `Country of Origin` = 'Canada';

# Find all female artists.
SELECT *
FROM spotify
WHERE Sex = 'Female';

# Find all artists whose primary genre is Pop.
SELECT *
FROM spotify
WHERE `Primary Genre` = 'Pop';

# Display artists who debuted after 2010.

SELECT 
    `Artist Name`,
    `Debut Year`
FROM spotify
WHERE `Debut Year` > 2010;

#  Find artists whose total streams are greater than 50,000 million.
SELECT 
    `Artist Name`,
    `Total Streams`
FROM spotify
WHERE `Total Streams` > 50000;

# Find artists who debuted in 2006.
SELECT 
    `Artist Name`,
    `Debut Year`
FROM spotify
WHERE `Debut Year` = 2006;

# Display artists from either Canada or the United States.
SELECT 
    `Artist Name`,
    `Country of Origin`
FROM spotify
WHERE `Country of Origin` = 'Canada'
   OR `Country of Origin` = 'United States';


# Find artists who are female and whose genre is Pop.
SELECT 
    `Artist Name`,
    Sex,
    `Primary Genre`
FROM spotify
WHERE Sex = 'Female'
  AND `Primary Genre` = 'Pop';

# Display artists whose total streams are between 50,000 and 100,000 million.
SELECT 
    `Artist Name`,
    `Total Streams (in millions)`
FROM spotify
WHERE `Total Streams (in millions)` BETWEEN 50000 AND 100000;


# Display artists whose primary language is English.
SELECT 
    `Artist Name`,
    `Primary Language`
FROM spotify
WHERE `Primary Language` = 'English';

# Display all artists sorted by total streams from highest to lowest.
SELECT 
    `Artist Name`,
    `Total Streams (in millions)`
FROM spotify
ORDER BY `Total Streams (in millions)` DESC;

# Display the 5 artists with the highest total streams.
SELECT 
    `Artist Name`,
    `Total Streams (in millions)`
FROM spotify
ORDER BY `Total Streams (in millions)` DESC
LIMIT 5;

# Display the 5 artists with the lowest total streams.
SELECT 
    `Artist Name`,
    `Total Streams (in millions)`
FROM spotify
ORDER BY `Total Streams (in millions)` ASC
LIMIT 5;

# Count the total number of artists/records in the table.
SELECT COUNT(*) AS total_records
FROM spotify;

# Find the highest total stream value.
SELECT MAX(`Total Streams (in millions)`) AS highest_streams
FROM spotify;

# Find the lowest total stream value.
SELECT MIN(`Total Streams (in millions)`) AS lowest_streams
FROM spotify;

# Calculate the average total streams of all artists.
SELECT AVG(`Total Streams (in millions)`) AS average_streams
FROM spotify;


# -------------------------Intermediate Level----------------------------------------------------------------------------

# 1) Find all unique primary genres available in the dataset.
SELECT DISTINCT `Primary Genre`
FROM spotify;

# Find all unique countries represented in the dataset.
SELECT DISTINCT `Country of Origin`
FROM spotify;

# Find artists whose name starts with the letter T.
SELECT `Artist Name`
FROM spotify
WHERE `Artist Name` LIKE 'T%';

# Find artists whose name contains the word The.
SELECT `Artist Name`
FROM spotify
WHERE `Artist Name` LIKE '%The%';

# Find artists whose name ends with y.
SELECT `Artist Name`
FROM spotify
WHERE `Artist Name` LIKE '%y';

# Find artists from Canada, United States, or United Kingdom.
SELECT 
    `Artist Name`,
    `Country of Origin`
FROM spotify
WHERE `Country of Origin` IN 
      ('Canada', 'United States', 'United Kingdom');


# Find artists who are not from Canada.
SELECT 
    `Artist Name`,
    `Country of Origin`
FROM spotify
WHERE `Country of Origin` <> 'Canada';
# WHERE `Country of Origin` != 'Canada';

# Find artists who debuted between 2000 and 2010.
SELECT 
    `Artist Name`,
    `Debut Year`
FROM spotify
WHERE `Debut Year` BETWEEN 2000 AND 2010
ORDER BY `Debut Year`;

# Find the average total streams of artists from Canada.
SELECT AVG(`Total Streams (in millions)`) AS average_streams
FROM spotify
WHERE `Country of Origin` = 'Canada';

# Find the maximum and minimum streams in the dataset together.
SELECT 
    MAX(`Total Streams (in millions)`) AS highest_streams,
    MIN(`Total Streams (in millions)`) AS lowest_streams
FROM spotify;

# Find the total number of male and female artists.
SELECT 
    Sex,
    COUNT(*) AS total_artists
FROM spotify
GROUP BY Sex;

# Count how many artists belong to each primary genre.
SELECT 
    `Primary Genre`,
    COUNT(*) AS total_artists
FROM spotify
GROUP BY `Primary Genre`;

# Find the average streams for each primary genre.
SELECT 
    `Primary Genre`,
    AVG(`Total Streams (in millions)`) AS average_streams
FROM spotify
GROUP BY `Primary Genre`;


# 14) Find the total streams for each country.

select sum(`Total Streams (in millions)`) as total_streams,
       `Country of Origin`
from spotify 
group by `Country of Origin` ;

# 15) Show only genres having more than 10 artists.
select `Primary Genre`,
	   count(*) as total_artist
from spotify 
group by `Primary Genre`
having count(*) > 10 ;

# 16) Find countries having an average stream count greater than 30,000 million.
SELECT 
    `Country`,
    AVG(`Total Streams`) AS average_streams
FROM spotify
GROUP BY `Country`
HAVING AVG(`Total Streams`) > 30000;


# 17) Find the top 5 genres based on average streams.
select `Genre`, avg(`Total Streams`) as average_streams
from spotify 
group by `Genre`
order by average_streams desc
limit 5;

# 18) Find the number of artists for each country and arrange countries from highest to lowest.
select `Country`, count(*) as total_artists
from spotify 
group by `Country`
order by total_artists desc ;

# 19) Find the average debut year for male and female artists.
select `Sex`, avg(`Debut Year`) as average_debut
from spotify 
group by `Sex` ;

# 20) Find the top 10 artists based on Spotify followers.



#------------------------------------------------------Level 3: Advanced Intermediate--------------------------------------------


# 1) Find the top 10 artists with the highest Lead Streams.
select `Artist Name`, `Lead Streams`
from spotify 
order by `Lead Streams` desc
limit 10;

# 2) Find artists whose Feature Streams are greater than 40,000 million.
select `Artist Name`, `Feature Streams`
from spotify
having `Feature Streams` > 40000
order by `Feature Streams` desc;

select `Artist Name`, `Feature Streams`
from spotify
where `Feature Streams` > 40000
order by `Feature Streams` desc;


# 3) Find the top 5 artists based on Solo Streams.
select `Artist Name`, `Solo Streams`
from spotify 
order by `Solo Streams` desc
limit 5;

# 4) Find the average Solo Streams for male and female artists.
select `Sex`, round(avg(`Solo Streams`),2) as average_ss
from spotify
group by `Sex` ;

# 5) Find the average Collaborative Streams for each Primary Genre.
select `Genre`, round(avg(`Collaborative Streams`), 2) as avg_cs
from spotify 
group by `Genre`; 

# 6) Find the number of Solo and Collaborative artists.
select `Artist Type`, count(*) as total_artists
from spotify
group by `Artist Type`;

# 7) Find the average Total Streams for Solo artists and Collaborative artists.

select `Artist Type`, avg(`Total Streams`) as average_streams
from spotify 
group by `Artist Type`;

# 8) Find genres where the average Total Streams is greater than 30,000 million.

select `Genre`, round(avg(`Total Streams`),2) as average_streams
from spotify 
group by `Genre`
having average_streams > 30000;

# 9) Find countries that have more than 20 artists

select `Country`, count(*) as total_artists
from spotify
group by `Country`
having count(*) > 20
order by total_artists desc;

# 10) Find artists whose Solo Streams are greater than their Collaborative Streams.

select `Artist Name`, `Solo Streams`, `Collaborative Streams`
from spotify 
where `Solo Streams` > `Collaborative Streams`;

# 11) Find artists whose Feature Streams are greater than their Lead Streams.

select `Artist Name`, `Feature Streams`, `Lead Streams`
from spotify
where `Feature Streams` > `Lead Streams`;

# 13) Find the percentage of artists belonging to each gender.

select 
	`Sex`, 
	count(*) as total_artists, 
    round(count(*) * 100.0 / (select count(*) from spotify),2) as percentage
from spotify 
group by `Sex`;    

# 14) Find artists whose Total Streams are higher than the average Total Streams of all artists.

select `Artist Name`, `Total Streams`
from spotify
where `Total Streams` > 
	   ( select avg(`Total Streams`) from spotify)
order by `Total Streams` desc;


# 15) Find the artist with the highest Total Streams using a subquery.

select `Artist Name`, `Total Streams`
from spotify 
where `Total Streams` =
	  ( select max(`Total Streams`) from spotify);

# 15) Find the artist with the highest Solo Streams in each Primary Genre.
SELECT
    s.`Artist Name`,
    s.`Genre`,
    s.`Solo Streams`
FROM spotify s
WHERE s.`Solo Streams` =
(
    SELECT MAX(s2.`Solo Streams`)
    FROM spotify s2
    WHERE s2.`Genre` = s.`Genre`
);
/*
# 16) Classify artists based on their Total Streams:

More than 100,000 → Very High
50,000–100,000 → High
20,000–50,000 → Medium
Below 20,000 → Low */

select `Artist Name`, `Total Streams`,
	  Case 
		  when `Total Streams` > 100000 then 'Very_High'
          when `Total Streams` >= 50000 then 'High'
          when `Total Streams` >= 20000 then 'medium_'
          else 'low'
	  end as stream_category
from spotify;

# 17) Calculate the difference between Solo Streams and Collaborative Streams for every artist.

select 
		`Artist Name`,
        `Solo Streams`,
        `Collaborative Streams`,
        `Solo Streams` - `Collaborative Streams` as diff_ss_cs
from spotify
order by diff_ss_cs desc;        

# 18) Find artists whose Solo Streams percentage is greater than 80%.
 select `Artist Name`, `% of SS`
 from spotify
 where `% of SS` > 80 
 order by `% of SS` desc;

# 19) Find the average Solo Stream percentage for each Primary Genre, but display only genres whose average is above 60%.
select `Genre`, round(avg(`% of SS`),2) as avg_percent_ss
from spotify 
group by `Genre`
having avg(`% of SS`) > 60
order by avg_percent_ss desc;

# 20) Find the top 5 artists whose Collaborative Streams make up the largest percentage of their Total Streams.
select `Artist Name`, 
	   `Total Streams`,
       `Collaborative Streams`,
       round(`Collaborative Streams` / `Total Streams` * 100, 2) as collab_percent
from spotify
order by collab_percent desc
limit 5;





