-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Orbits around
CREATE TABLE orbits_around
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

INSERT INTO orbits_around
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

-- Galaxy
CREATE TABLE galaxy
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

INSERT INTO galaxy
  (name)
VALUES
  ('Milky Way');

-- Moon
CREATE TABLE moon
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

INSERT INTO moon
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

-- Planet
CREATE TABLE planet
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER NOT NULL REFERENCES orbits_around(id),
  galaxy_id INTEGER NOT NULL REFERENCES galaxy(id)
);

INSERT INTO planet
  (name, orbital_period_in_years, orbits_around_id, galaxy_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

-- Planet_moon
CREATE TABLE planet_moon
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planet(id),
  moon_id INTEGER NOT NULL REFERENCES moon(id)
);

INSERT INTO planet_moon
  (planet_id, moon_id)
VALUES 
  (1,1),
  (2,2),
  (2,3),
  (4,4),
  (4,5),
  (4,6),
  (4,7),
  (4,8),
  (4,9),
  (4,10),
  (4,11),
  (4,12),
  (4,13),
  (4,14),
  (4,15),
  (4,16),
  (4,17);
