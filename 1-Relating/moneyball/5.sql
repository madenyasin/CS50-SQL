SELECT
    name AS 'team name'
FROM
    players
    INNER JOIN performances ON players.id = performances.player_id
    INNER JOIN teams ON teams.id = performances.team_id
WHERE
    player_id = (
        SELECT
            id
        FROM
            players
        WHERE
            first_name = 'Satchel'
            AND last_name = 'Paige'
    )
GROUP BY
    team_id
