SELECT 'ФИО: Саввин Игорь Степанович';

-- запрос 1.1
SELECT * FROM ratings LIMIT 10;


-- запрос 1.2
SELECT
   imdbid,
   movieid
FROM links
WHERE
    imdbid LIKE '%42' AND movieid > 100 AND movieid < 1000
LIMIT 10;


-- запрос 2.1
SELECT
    imdbid
FROM links
INNER JOIN ratings ON links.movieid=ratings.movieid
WHERE rating = 5
LIMIT 10;


-- запрос 3.1
SELECT
    COUNT(*) AS rating_all,
    COUNT(DISTINCT rating) AS rating_null,
    COUNT(*)-CAST(COUNT(DISTINCT rating) AS float) disting_rating
    FROM public.ratings;


-- запрос 3.2
SELECT
    userId,
    AVG(rating) as avg_rating
FROM public.ratings
GROUP BY userId
HAVING AVG(rating) > 3.5
LIMIT 10;


--запрос 4.1
SELECT links.imdbid, (SELECT AVG(rating) FROM ratings) AS rating
FROM links
INNER JOIN ratings ON links.movieid=ratings.movieid
WHERE rating > 3.5
LIMIT 10;


-- запрос 4.2
WITH over_activity
AS (
   SELECT
   userid
   FROM public.ratings
   GROUP BY userid
   HAVING COUNT(rating) > 10
   )
SELECT
AVG(rating) AS mid_rating
FROM public.ratings
WHERE ratings.userid IN (SELECT userid FROM over_activity)
LIMIT 10;