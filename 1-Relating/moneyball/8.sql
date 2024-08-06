SELECT
    salary
FROM
    performances p
    INNER JOIN salaries s ON p.player_id = s.player_id
WHERE
    S.year = 2001
ORDER BY
    "HR" DESC
LIMIT
    1
