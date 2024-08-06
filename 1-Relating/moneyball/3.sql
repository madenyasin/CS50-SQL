SELECT
    year,
    hr
FROM
    players
    INNER JOIN performances ON players.id = performances.player_id
WHERE
    first_name = 'Ken'
    AND last_name = 'Griffey'
    AND birth_year = 1969
ORDER BY
    year DESC
