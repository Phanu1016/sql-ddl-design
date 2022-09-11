-- from the terminal run:
-- psql < medical_center.sql


DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctor
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO doctor
  (name)
VALUES
  ('John Smith');

CREATE TABLE patient
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO patient
  (name)
VALUES
  ('Will Arnett');

CREATE TABLE disease
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO disease
  (name)
VALUES
  ('Gum disease');

CREATE TABLE visit
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER NOT NULL REFERENCES doctor(id),
  patient_id INTEGER NOT NULL REFERENCES patient(id)
);

INSERT INTO visit
  (doctor_id, patient_id)
VALUES
  (1, 1);

CREATE TABLE diagnose
(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES disease(id),
    visit_id INTEGER NOT NULL REFERENCES visit(id)
);

INSERT INTO diagnose
  (disease_id, visit_id)
VALUES
  (1, 1);