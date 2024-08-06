SELECT
    year,
    round(avg(salary), 2) AS 'average salary'
FROM
    salaries
GROUP BY
    year
ORDER BY
    year DESC
