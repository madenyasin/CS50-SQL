SELECT
    "name",
    "per_pupil_expenditure"
FROM
    "expenditures" e
    INNER JOIN "districts" d ON d."id" = e."district_id"
WHERE
    TYPE = 'Public School District'
ORDER BY
    "per_pupil_expenditure" DESC
LIMIT
    10;
