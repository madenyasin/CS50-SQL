SELECT "first_name", "last_name", "height" FROM
(
    SELECT "first_name", "last_name", "height", AVG("height") OVER () AS "Avgheight" FROM "players"
) 
WHERE "height" > "Avgheight"
ORDER BY "height" DESC;