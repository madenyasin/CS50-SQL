SELECT
    "name",
    "unsatisfactory"
FROM
    "districts"
    INNER JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE
    "unsatisfactory" IS NOT NULL
    AND "unsatisfactory" != 0
    AND "unsatisfactory" > (
        SELECT
            avg("unsatisfactory")
        FROM
            "staff_evaluations"
        WHERE
            "unsatisfactory" IS NOT NULL
            AND "unsatisfactory" != 0
    )
ORDER BY
    "unsatisfactory" DESC
LIMIT
    10;
