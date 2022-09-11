-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- Customer
CREATE TABLE customer
  (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
  );
INSERT INTO customer
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

-- Airline
CREATE TABLE airline
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );
INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

-- City
CREATE TABLE city
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );
INSERT INTO city
  (name)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'),
  ('Santiago');

-- Country
CREATE TABLE country
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );
INSERT INTO country
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

-- Ticket
CREATE TABLE ticket
 (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER NOT NULL REFERENCES airline(id)
 );

INSERT INTO ticket
  (seat, departure, arrival, airline_id)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7);

-- Ticket City Destination
CREATE TABLE ticket_city_destination
 (
  id SERIAL PRIMARY KEY,
  ticket_id INTEGER NOT NULL REFERENCES ticket(id),
  from_city_id INTEGER NOT NULL REFERENCES city(id),
  to_city_id INTEGER NOT NULL REFERENCES city(id)
 );
 INSERT INTO ticket_city_destination
  (ticket_id, from_city_id, to_city_id)
 VALUES
  (1,1,2),
  (2,3,4),
  (3,5,6),
  (4,2,7),
  (5,8,9),
  (6,10,11),
  (7,12,13),
  (8,14,15),
  (9,13,16),
  (10,17,18);

-- Ticket Country Destination
CREATE TABLE ticket_country_destination
 (
  id SERIAL PRIMARY KEY,
  ticket_id INTEGER NOT NULL REFERENCES ticket(id),
  from_country_id INTEGER NOT NULL REFERENCES country(id),
  to_country_id INTEGER NOT NULL REFERENCES country(id)
 );
 INSERT INTO ticket_country_destination
  (ticket_id, from_country_id, to_country_id)
 VALUES
  (1,1,1),
  (2,2,3),
  (3,1,1),
  (4,1,4),
  (5,5,6),
  (6,7,8),
  (7,1,1),
  (8,1,1),
  (9,1,1),
  (10,9,10);