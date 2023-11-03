-- List department names and ID numbers starting with 'A' and 'The'. Section names should be listed in reverse alphabetical order. The top 30 results are enough.
SELECT "id", "title" FROM "episodes"
WHERE ("title" LIKE 'A %') OR "title" LIKE 'The %'
ORDER BY "title" DESC LIMIT 30;