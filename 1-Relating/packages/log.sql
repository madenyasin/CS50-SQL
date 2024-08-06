
-- *** The Lost Letter ***
-- Anneke'nin kendi adresinin id'si
SELECT
	"id"
FROM
	"addresses"
WHERE
	"address" = '900 Somerville Avenue';

-- Annake'nin adresinden gönderilen paketler ve gittikleri adresler
SELECT	"from_address_id",
		"to_address_id"
FROM 	"packages"
WHERE	"from_address_id" = (
			SELECT "id"
			FROM "addresses"
			WHERE "address" = '900 Somerville Avenue'
			);

-- Paketin ulaşması gereken doğru adres id
SELECT	"id"
FROM	"addresses"
WHERE	"address" LIKE '%Finn%';

-- package id
SELECT "id"
FROM   "packages"
WHERE  "from_address_id" = (SELECT "id"
                            FROM   "addresses"
                            WHERE  "address" = '900 Somerville Avenue')
       AND "to_address_id" = (SELECT "id"
                              FROM   "addresses"
                              WHERE  "address" LIKE '%Finn%');


-- paketin tarama bilgileri
SELECT *
FROM   "scans"
WHERE  "package_id" = (SELECT "id"
                       FROM   "packages"
                       WHERE  "from_address_id" = (SELECT "id"
                                                   FROM   "addresses"
                                                   WHERE	"address" = '900 Somerville Avenue'
												   )
                              AND "to_address_id" = (SELECT "id"
                                                     FROM   "addresses"
                                                     WHERE  "address" LIKE '%Finn%'
													 )
						);

-- Mektubun ulaştığı adres id
SELECT	"address_id"
FROM	"scans"
WHERE	"action" = 'Drop'
		AND
		"package_id" = (
						SELECT "id"
						FROM   "packages"
						WHERE  "from_address_id" = (SELECT "id"
													FROM   "addresses"
													WHERE  "address" = '900 Somerville Avenue')
							   AND "to_address_id" = (SELECT "id"
													  FROM   "addresses"
													  WHERE  "address" LIKE '%Finn%')
						);


-- mektubun ulaştığı adresin türü
SELECT	"type"
FROM	"addresses"
WHERE	"id" = (
						-- Mektubun ulaştığı adres id
						SELECT	"address_id"
						FROM	"scans"
						WHERE	"action" = 'Drop'
								AND
								"package_id" = (
												SELECT "id"
												FROM   "packages"
												WHERE  "from_address_id" = (SELECT "id"
																			FROM   "addresses"
																			WHERE  "address" = '900 Somerville Avenue')
													   AND "to_address_id" = (SELECT "id"
																			  FROM   "addresses"
																			  WHERE  "address" LIKE '%Finn%')
												)
						);

-- mektubun ulaştığı adres
SELECT	"address"
FROM	"addresses"
WHERE	"id" = (

				-- Mektubun ulaştığı adres id
				SELECT	"address_id"
				FROM	"scans"
				WHERE	"action" = 'Drop'
						AND
						"package_id" = (
										SELECT "id"
										FROM   "packages"
										WHERE  "from_address_id" = (SELECT "id"
																	FROM   "addresses"
																	WHERE  "address" = '900 Somerville Avenue')
											   AND "to_address_id" = (SELECT "id"
																	  FROM   "addresses"
																	  WHERE  "address" LIKE '%Finn%')
										)
				);
-- *** The Devious Delivery ***
-- from_address_id'si null olan paketin bilgileri
SELECT	*
FROM	"packages"
WHERE	"from_address_id" IS NULL;

-- paketin tarama bilgileri
SELECT *
FROM	"scans"
WHERE	"package_id" = (
						SELECT	"id"
						FROM	"packages"
						WHERE	"from_address_id" IS NULL
						);

-- paketin drop edildiği adresin türü
SELECT	"type"
FROM	"addresses"
WHERE	"id" = (

				SELECT	"address_id"
				FROM	"scans"
				WHERE	"package_id" = (
										SELECT	"id"
										FROM	"packages"
										WHERE	"from_address_id" IS NULL
										)
				AND		"action" = 'Drop'
				);
-- *** The Forgotten Gift ***

-- from address bilgileri
SELECT	*
FROM	"addresses"
WHERE	"address" = '109 Tileston Street'; -- from_address_id = 9873

-- bu adresten gönderilen paketlerin bilgileri
SELECT	*
FROM	"packages"
WHERE	"from_address_id" = 9873;	-- to_address_id = 4983	-- package_id = 9523

-- paketin tarama bilgileri
SELECT	*
FROM	"scans"
WHERE	"package_id" = 9523; -- last pick from driver_id = 17

-- en son paketi alan driver'ın bilgileri
SELECT	*
FROM	"drivers"
WHERE 	"id"= 17;



