SELECT
    name,
    round(avg(s.salary), 2) AS 'average salary'
FROM
    teams t
    INNER JOIN salaries s ON t.id = s.team_id
WHERE
    s.year = 2001
GROUP BY
    name
ORDER BY
    "average salary"
LIMIT
    5
