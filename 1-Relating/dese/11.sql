SELECT
    "name",
    "per_pupil_expenditure",
    "graduated"
FROM
    "schools" s
    INNER JOIN "graduation_rates" g ON s."id" = g."school_id"
    INNER JOIN "expenditures" e ON s."district_id" = e."district_id"
ORDER BY
    "per_pupil_expenditure" DESC,
    "name" ASC
