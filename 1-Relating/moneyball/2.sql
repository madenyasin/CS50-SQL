SELECT
    year,
    salary
FROM
    players
    INNER JOIN salaries ON players.id = salaries.player_id
WHERE
    first_name = 'Cal'
    AND last_name = 'Ripken'
ORDER BY
    year DESC
