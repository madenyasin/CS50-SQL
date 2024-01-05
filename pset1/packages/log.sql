--SELECT * FROM "addresses" LIMIT 10;
--SELECT * FROM "drivers" LIMIT 10;
-- SELECT * FROM "packages" LIMIT 10;
-- SELECT * FROM "scans" LIMIT 10;

-- *** The Lost Letter ***

/*
SELECT "type" FROM "addresses" WHERE "id" = (
    -- adres id
    SELECT "id" FROM "addresses" WHERE "address" LIKE '%2 Fin%'
);

SELECT "address" FROM "addresses" WHERE "address" LIKE '%2 Fin%';
*/

-- *** The Devious Delivery ***

-- SELECT * FROM "scans" WHERE "package_id" = (
--     SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
-- ) AND "address_id" != (SELECT "to_address_id" FROM "packages" WHERE "from_address_id" IS NULL);
/*
SELECT "type" FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
    ) AND "action" = 'Drop'
);

SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL;
-- SELECT * FROM "scans" WHERE "package_id" = 5098;

-- SELECT * FROM "scans" WHERE "timestamp" = '2023-10-24 10:08:55.610754';

-- SELECT * FROM "packages" WHERE "from_address_id" = 8279;

-- SELECT * FROM "scans" WHERE "package_id" = 1559;
-- SELECT * FROM "addresses" WHERE "id" = 8279;

*/

-- *** The Forgotten Gift ***
SELECT "name" FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "action" = 'Pick' AND "address_id" != (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    ) AND "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        )
    )
);



