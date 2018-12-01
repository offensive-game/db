\c offensive

CREATE TABLE lands (
  name VARCHAR PRIMARY KEY
);

CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL
);

CREATE TABLE games (
  id BIGSERIAL PRIMARY KEY,
  players_count SMALLINT NOT NULL,
  name VARCHAR NOT NULL,
  start_time TIMESTAMP NOT NULL
);

CREATE TABLE players (
  id BIGSERIAL PRIMARY KEY,
  userId  BIGINT REFERENCES users(id),
  gameId BIGINT REFERENCES games(id) ON DELETE CASCADE,
  color VARCHAR NOT NULL,
  bot BOOLEAN DEFAULT false,
  units_in_reserve INT DEFAULT 20
);

CREATE TABLE sessions (
  id BIGSERIAL PRIMARY KEY,
  userId BIGINT REFERENCES users(id) ON DELETE CASCADE,
  token VARCHAR NOT NULL
);

CREATE TABLE rounds (
  id BIGSERIAL PRIMARY KEY,
  round VARCHAR,
  phase VARCHAR,
  deadline TIMESTAMP,
  gameId BIGINT REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE board (
  id BIGSERIAL PRIMARY KEY,
  land VARCHAR REFERENCES lands(name),
  playerId BIGINT REFERENCES players(id) ON DELETE CASCADE,
  troops INT
);

CREATE TABLE cards (
  id BIGSERIAL PRIMARY KEY,
  type  VARCHAR,
  gameId BIGINT REFERENCES games(id) ON DELETE CASCADE,
  landId VARCHAR REFERENCES lands(name)
);


INSERT INTO lands VALUES ('iraq');
INSERT INTO lands VALUES ('alaska');
INSERT INTO lands VALUES ('alberta');
INSERT INTO lands VALUES ('arabia');
INSERT INTO lands VALUES ('argentina');
INSERT INTO lands VALUES ('brazil');
INSERT INTO lands VALUES ('central_america');
INSERT INTO lands VALUES ('china');
INSERT INTO lands VALUES ('congo');
INSERT INTO lands VALUES ('east_africa');
INSERT INTO lands VALUES ('east_australia');
INSERT INTO lands VALUES ('eastern_us');
INSERT INTO lands VALUES ('egypt');
INSERT INTO lands VALUES ('france');
INSERT INTO lands VALUES ('germany');
INSERT INTO lands VALUES ('great_britain');
INSERT INTO lands VALUES ('greenland');
INSERT INTO lands VALUES ('iceland');
INSERT INTO lands VALUES ('india');
INSERT INTO lands VALUES ('indonesia');
INSERT INTO lands VALUES ('irkutsk');
INSERT INTO lands VALUES ('japan');
INSERT INTO lands VALUES ('kamchatka');
INSERT INTO lands VALUES ('madagascar');
INSERT INTO lands VALUES ('mongolia');
INSERT INTO lands VALUES ('new_guinea');
INSERT INTO lands VALUES ('north_africa');
INSERT INTO lands VALUES ('north_west_territory');
INSERT INTO lands VALUES ('ontario');
INSERT INTO lands VALUES ('peru');
INSERT INTO lands VALUES ('quebec');
INSERT INTO lands VALUES ('russia');
INSERT INTO lands VALUES ('scandinavia');
INSERT INTO lands VALUES ('serbia');
INSERT INTO lands VALUES ('siam');
INSERT INTO lands VALUES ('siberia');
INSERT INTO lands VALUES ('south_africa');
INSERT INTO lands VALUES ('ural');
INSERT INTO lands VALUES ('venezuela');
INSERT INTO lands VALUES ('western_australia');
INSERT INTO lands VALUES ('western_us');
INSERT INTO lands VALUES ('yakutsk')
