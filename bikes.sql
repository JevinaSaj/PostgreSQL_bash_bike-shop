------------------------------------------------------------
1.Create Database and connect to it
------------------------------------------------------------
psql --username=freecodecamp --dbname=postgres;

CREATE DATABASE bikes;

\c bikes

------------------------------------------------------------
2. Create tables as required conditions
------------------------------------------------------------

CREATE TABLE bikes (
    bike_id SERIAL NOT NULL,
    type VARCHAR(50) NOT NULL,
    size INT NOT NULL,
    available BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE customers (
    customer_id SERIAL NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE rentals (
    rental_id SERIAL NOT NULL,
    customer_id INT NOT NULL,
    bike_id INT NOT NULL,
    date_rented DATE NOT NULL DEFAULT NOW(),
    date_returned DATE
);
------------------------------------------------------------
3. Primary Key and Foreign Key assignment
------------------------------------------------------------
ALTER TABLE bikes ADD PRIMARY KEY (bike_id)
ALTER TABLE customers ADD PRIMARY KEY (customer_id)
ALTER TABLE rentals ADD PRIMARY KEY (rental_id)
ALTER TABLE rentals ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
ALTER TABLE rentals ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id)

------------------------------------------------------------
4. Create rows as required 
------------------------------------------------------------
INSERT INTO bikes(type, size) VALUES('Mountain', 27), ('Mountain', 28), ('Mountain', 29), ('Road', 27), ('Road', 28), ('Road', 29), ('BMX', 19), ('BMX', 20), ('BMX', 21)
  
------------------------------------------------------------
5.Give executable permission to shell scipt files
------------------------------------------------------------
chmod +x bike-shop.sh

------------------------------------------------------------
6.Copy & Run shell script files (NOTE : insert data first)
------------------------------------------------------------
./bike-shop.sh
