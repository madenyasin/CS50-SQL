.import --csv meteorites.csv temp
CREATE TABLE meteorites (
    id integer,
    name text,
    class text,
    mass text,
    discovery text,
    year text,
    lat text,
    long text,
    PRIMARY KEY(id)
);

INSERT INTO
    meteorites (name, class, mass, discovery, year, lat, long)
SELECT
    name,
    class,
    round(mass, 2),
    discovery,
    year,
    round(lat, 2),
    round(long, 2)
FROM
    temp
WHERE
    nametype != 'Relict'
ORDER BY
    year ASC,
    name ASC;

DROP TABLE temp;

UPDATE
    meteorites
SET
    year = NULL,
    mass = NULL,
    lat = NULL,
    long = NULL
WHERE
    mass = ''
    OR year = ''
    OR lat = ''
    OR long = '';
