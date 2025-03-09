DROP TABLE IF EXISTS OrderItems;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Dishes;

-- Таблица "Dishes" (Блюда)
CREATE TABLE IF NOT EXISTS Dishes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL
);

-- Таблица "Orders" (Заказы)
CREATE TABLE IF NOT EXISTS Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL -- Дата в формате 'YYYY-MM-DD'
);

-- Таблица "OrderItems" (Заказано)
CREATE TABLE IF NOT EXISTS OrderItems (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    dish_id INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders (id),
    FOREIGN KEY (dish_id) REFERENCES Dishes (id)
);

-- Добавляем блюда
INSERT INTO
    Dishes (name, price)
VALUES ('Пицца Маргарита', 12.99),
    ('Салат Цезарь', 8.50),
    ('Томатный суп', 6.75),
    ('Спагетти Карбонара', 10.25),
    ('Тирамису', 7.00);

-- Добавляем заказы
INSERT INTO
    Orders (date)
VALUES ('2023-10-01'),
    ('2023-10-02'),
    ('2023-10-03');

-- Добавляем связи между заказами и блюдами
INSERT INTO
    OrderItems (order_id, dish_id)
VALUES
    -- Заказ 1 (3 блюда)
    (1, 1),
    (1, 2),
    (1, 3),
    -- Заказ 2 (2 блюда)
    (2, 3),
    (2, 4),
    -- Заказ 3 (2 блюда)
    (3, 4),
    (3, 5);