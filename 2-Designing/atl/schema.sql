CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "check-ins"(
    "id" INTEGER,
    "flight_id" INTEGER,
    "date_time" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id") FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK(
        "concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')
    ),
    PRIMARY KEY ("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "airline_id" NUMERIC,
    "flight_number" TEXT NOT NULL,
    "from_airport" TEXT NOT NULL,
    "to_airport" TEXT NOT NULL,
    "departure_date_time" DATETIME NOT NULL,
    "arrival_date_time" DATETIME NOT NULL,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE bookings (
    id INTEGER,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(id),
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);
