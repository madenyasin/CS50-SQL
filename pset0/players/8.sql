SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weight"), 2) AS "Average Wight" FROM "players"
WHERE "debut" > "2000-01-01";