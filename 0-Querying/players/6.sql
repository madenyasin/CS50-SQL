SELECT
	"first_name",
	"last_name",
	"debut"
FROM
	"players"
WHERE
	"birth_state" = 'PA'
	AND "birth_city" = 'Pittsburgh'
ORDER BY 
	"debut" DESC,
	"first_name" ASC,
	"last_name" ASC;