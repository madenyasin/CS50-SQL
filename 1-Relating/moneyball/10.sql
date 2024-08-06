SELECT
    -- players.id,
    players.first_name,
    players.last_name,
    --performances.year,
    salaries.salary,
    salaries.year,
    performances.HR
FROM
    players
    INNER JOIN performances ON players.id = performances.player_id
    INNER JOIN salaries ON players.id = salaries.player_id
WHERE
    performances.year = salaries.year
ORDER BY
    players.id ASC,
    performances.year DESC,
    performances.HR DESC,
    salaries.salary DESC
