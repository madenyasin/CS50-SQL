CREATE TABLE
    Customer (
        id INTEGER NOT NULL,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        PRIMARY key (id)
    );

CREATE TABLE
    Ingredients (
        id INTEGER NOT NULL,
        name TEXT NOT NULL,
        pay_per_unit NUMERIC NOT NULL,
        unit text NOT NULL,
        PRIMARY key (id)
    );

CREATE TABLE
    Donuts (
        id INTEGER NOT NULL,
        name TEXT NOT NULL,
        is_gluten_free TEXT NOT NULL,
        price_per_donut NUMERIC NOT NULL,
        PRIMARY key (id)
    );

CREATE TABLE
    DonutIngredients (
        id INTEGER NOT NULL,
        donut_id INTEGER NOT NULL,
        ingredient_id INTEGER NOT NULL,
        PRIMARY key (id) FOREIGN key (donut_id) REFERENCES Donuts (id),
        FOREIGN key (ingredient_id) REFERENCES Ingredients (id)
    );

CREATE TABLE
    Orders (
        id INTEGER NOT NULL,
        customer_id INTEGER NOT NULL,
        PRIMARY key (id) FOREIGN key (customer_id) REFERENCES Customer (id)
    );

CREATE TABLE
    OrderDetails (
        id INTEGER NOT NULL,
        order_id INTEGER NOT NULL,
        donut_id INTEGER NOT NULL,
        quantity INTEGER CHECK (quantity > 0),
        PRIMARY key (id) FOREIGN key (donut_id) REFERENCES Donuts (id) FOREIGN key (order_id) REFERENCES Orders (id)
    );
