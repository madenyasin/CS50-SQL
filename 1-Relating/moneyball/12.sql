SELECT
    first_name,
    last_name
FROM
    (
        SELECT
            players.first_name,
            players.last_name,
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
    )
INTERSECT
SELECT
    first_name,
    last_name
FROM
    (
        SELECT
            players.first_name,
            players.last_name,
            (salaries.salary) / (performances.RBI) AS 'dollars per rbi'
        FROM
            players
            INNER JOIN performances ON players.id = performances.player_id
            INNER JOIN salaries ON players.id = salaries.player_id
        WHERE
            performances.year = salaries.year
            AND performances.year = 2001
            AND performances.RBI != 0
        ORDER BY
            "dollars per rbi" ASC,
            players.first_name ASC,
            players.last_name ASC
        LIMIT
            10
    )
ORDER BY
    last_name ASC
