SELECT "first_name", "last_name", "debut" FROM "players"
WHERE "birth_city" = "Pittsburgh" AND "birth_state" = "PA" AND "debut" IS NOT NULL
ORDER BY "debut" DESC;