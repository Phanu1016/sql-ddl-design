-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE league
(
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

INSERT INTO league
  (start_date, end_date)
VALUES
  ('09-10-2022', '10-10-2022');

CREATE TABLE team
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  rank INTEGER NOT NULL
);

INSERT INTO team
  (name, rank)
VALUES
  ('SomeTeamName_1', 1),
  ('SomeTeamName_2', 2);

CREATE TABLE player
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INTEGER NOT NULL REFERENCES team(id)
);

INSERT INTO player
  (name, team_id)
VALUES
  ('Will Smith', 1),
  ('Johnathan Yang', 2);

CREATE TABLE referee
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO referee
  (name)
VALUES
  ('John Smith');

CREATE TABLE match
(
  id SERIAL PRIMARY KEY,
  team1_id INTEGER NOT NULL REFERENCES team(id),
  team2_id INTEGER NOT NULL REFERENCES team(id),
  referee_id INTEGER NOT NULL REFERENCES referee(id)
);

INSERT INTO match
  (team1_id, team2_id, referee_id)
VALUES
  (1, 2, 1);

CREATE TABLE goal
(
  id SERIAL PRIMARY KEY,
  match_id INTEGER NOT NULL REFERENCES match(id),
  player_id INTEGER NOT NULL REFERENCES player(id)
);

INSERT INTO goal
  (match_id, player_id)
VALUES
  (1, 1);
