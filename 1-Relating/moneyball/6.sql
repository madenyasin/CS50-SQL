SELECT
    t.name,
    sum(p."H") AS 'total hits'
FROM
    teams t
    INNER JOIN performances p ON t.id = p.team_id
WHERE
    p.year = 2001
GROUP BY
    t.name
ORDER BY
    "total hits" DESC
LIMIT
    5
