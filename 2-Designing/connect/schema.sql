CREATE TABLE users (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    user_name TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE schools (
    id INTEGER,
    name TEXT NOT NULL,
    TYPE TEXT NOT NULL,
    location TEXT NOT NULL,
    foundation_year INTEGER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE companies (
    id INTEGER,
    name TEXT NOT NULL,
    industry TEXT,
    location TEXT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE person_connections (
    id INTEGER,
    user_id1 INTEGER,
    user_id2 INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id1) REFERENCES users(id),
    FOREIGN KEY(user_id2) REFERENCES users(id),
    CHECK(user_id1 < user_id2)
);

CREATE TABLE person_and_school_connections (
    id INTEGER,
    user_id INTEGER,
    school_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE,
    degree TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(school_id) REFERENCES schools(id)
);

CREATE TABLE person_and_companies_connections (
    id INTEGER,
    user_id INTEGER,
    company_id INTEGER,
    start_date DATE NOT NULL,
    end_date DATE,
    title TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(company_id) REFERENCES companies(id)
);
