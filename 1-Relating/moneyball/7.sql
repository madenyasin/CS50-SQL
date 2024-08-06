SELECT
    p.first_name,
    p.last_name
FROM
    players p
    INNER JOIN salaries s ON p.id = s.player_id
ORDER BY
    salary DESC
LIMIT
    1
