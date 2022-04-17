-- DDL create
CREATE DATABASE store;


CREATE TABLE countries (
    code INTEGER PRIMARY KEY,
    name VARCHAR(20) UNIQUE,
    continent_name VARCHAR(20) NOT NULL
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    full_name VARCHAR(20),
    email VARCHAR(20) UNIQUE,
    gender char(1) check (gender='m' or gender='f'),
    date_of_birth VARCHAR(15),
    created_at datetime default CURRENT_TIMESTAMP,
    country_code int,
    FOREIGN KEY (country_code) references countries(code)
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    status VARCHAR(6) check (status='start' or status='finish'),
    created_at datetime default CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) references users(id)
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    price INTEGER default 0,
    status VARCHAR(10) check (status='valid' or status='expired'),
    created_at datetime default CURRENT_TIMESTAMP
);

CREATE TABLE order_products (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER default 0,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) references orders(id),
    FOREIGN KEY (product_id) references products(id)
);

-- DML insert
insert into countries values (966,'SA','asia');
insert into users values (1,'Ammar','test@gmail.com','m','1/1/1999','2022-01-01 12:55:31',966);
insert into orders values (4,1,'finish','2022-01-01 12:55:31');
insert into products values (5,'clock',100,'valid','2022-01-01 12:55:31');
insert into products values (6,'door',500,'expired','2022-01-01 12:55:31');
insert into order_products values (4,5,2);
-- DML update
update countries set name='Saudi Arabia' where code=966;
-- DML delete
delete from products where id=6;