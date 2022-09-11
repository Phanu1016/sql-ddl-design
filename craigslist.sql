-- from the terminal run:
-- psql < craigslist.sql


DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO region
  (name)
VALUES
  ('Irvine');

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  region_id INTEGER NOT NULL
);

INSERT INTO users
  (username, password, region_id)
VALUES
  ('willsmith1123', "fjisejfi0sfjiej", 1);

CREATE TABLE category
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO category
  (name)
VALUES
  ('Electronic');

CREATE TABLE post
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  location TEXT NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id),
  region_id INTEGER NOT NULL REFERENCES region(id),
  category_id INTEGER NOT NULL REFERENCES category(id)
);

INSERT INTO post
  (title, text, location, user_id, region_id, category_id)
VALUES
  (
    'ASUS GTX 1060',
    'Minimal use, no scratches',
    'SampleLocation',
    1,
    1,
    1
  );

