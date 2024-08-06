SELECT
	"first_name" AS 'Name',
	"last_name" AS 'Surname'
FROM
	"players"
WHERE
	"birth_year" < 1900
ORDER BY 
	"first_name" ASC,
	"last_name" ASC;