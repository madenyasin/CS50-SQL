SELECT
    --players.id,
    players.first_name,
    players.last_name,
    --performances.year,
    --salaries.salary,
    --salaries.year,
    --performances.H,
    (salaries.salary) / (performances.H) AS 'dollars per hit'
FROM
    players
    INNER JOIN performances ON players.id = performances.player_id
    INNER JOIN salaries ON players.id = salaries.player_id
WHERE
    performances.year = salaries.year
    AND performances.year = 2001
    AND "H" != 0
ORDER BY
    "dollars per hit" ASC,
    players.first_name ASC,
    players.last_name ASC
LIMIT
    10
