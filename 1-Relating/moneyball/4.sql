SELECT
    first_name,
    last_name,
    salary
FROM
    players
    INNER JOIN salaries ON players.id = salaries.player_id
WHERE
    year = 2001
ORDER BY
    salary ASC,
    first_name ASC,
    last_name ASC,
    player_id ASC
LIMIT
    50
