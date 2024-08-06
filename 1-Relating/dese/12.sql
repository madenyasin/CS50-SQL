SELECT
    "name",
    "per_pupil_expenditure",
    "exemplary"
FROM
    "districts"
    INNER JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
    INNER JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE
    "type" = 'Public School District'
    AND "per_pupil_expenditure" > (
        SELECT
            avg("per_pupil_expenditure")
        FROM
            "expenditures"
    )
    AND "exemplary" > (
        SELECT
            avg("exemplary")
        FROM
            "staff_evaluations"
    )
ORDER BY
    "exemplary" DESC,
    "per_pupil_expenditure" DESC;
