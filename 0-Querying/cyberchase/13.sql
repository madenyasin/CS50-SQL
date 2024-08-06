/*
2023'ten sonra yayınlanan ilk 3 bölümün title, air_date, production_code
*/
SELECT "title", "air_date", "production_code" FROM "episodes" WHERE "air_date" >= '2023-01-01' ORDER BY "air_date" LIMIT 3;