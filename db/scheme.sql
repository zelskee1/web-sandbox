CREATE TABLE products (
    id          INTEGER         NOT NULL PRIMARY KEY AUTOINCREMENT,
    name        VARCHAR(50)     NOT NULL,
    description VARCHAR(100)    NOT NULL,
    category_id INTEGER         NOT NULL,
    enabled     BOOLEAN         NOT NULL DEFAULT false,
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE variants (
  id            INTEGER              PRIMARY KEY AUTOINCREMENT,
  product_id    INTEGER              NOT NULL,
  stock         INTEGER              NOT NULL DEFAULT 0,
  size          VARCHAR(4)           NOT NULL,
  color         VARCHAR(30)          NOT NULL,
  unit_price    DOUBLE PRECISION     NOT NULL,
  FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE users (
    id              INTEGER     NOT NULL PRIMARY KEY AUTOINCREMENT,
    register_date   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_amount    INTEGER     NOT NULL DEFAULT 0,
    f_name          VARCHAR(50) NOT NULL,
    l_name          VARCHAR(50) NOT NULL,
    enabled         BOOLEAN     DEFAULT true
);   

CREATE TABLE categories (
    id              INTEGER         NOT NULL PRIMARY KEY AUTOINCREMENT,
    name            VARCHAR(30)     NOT NULL UNIQUE,
    description     VARCHAR(100)    NOT NULL,
    enabled         BOOLEAN         NOT NULL DEFAULT false
);

CREATE TABLE orders (
    id              INTEGER         NOT NULL PRIMARY KEY AUTOINCREMENT,
    user_id         INTEGER         NOT NULL,
    status          VARCHAR(20)     NOT NULL DEFAULT 'PENDING',
    creation_time   TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (status in ('PENDING', 'SHIPPED', 'CANCELLED', 'DELIVERED'))
    FOREIGN KEY(user_id) REFERENCES users(id)
)

CREATE TABLE order_items (  
    order_id        INTEGER             NOT NULL,
    variants_id     INTEGER             NOT NULL,
    amount          INTEGER             NOT NULL,
    price           DOUBLE PRECISION    NOT NULL,
    PRIMARY KEY(order_id, variants_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(variants_id) REFERENCES variants(id)
)
