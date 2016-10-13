CREATE TABLE categories (
  id serial PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE types (
  id serial PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE study_entities (
id serial PRIMARY KEY,
title VARCHAR(50),
category_id INTEGER NOT NULL REFERENCES categories(id),
type_id INTEGER NOT NULL REFERENCES types(id)
);

CREATE TABLE time_stamps (
  id serial PRIMARY KEY,
  start_time TIMESTAMP DEFAULT now(),
  end_time TIMESTAMP DEFAULT now(),
  study_entities_id INTEGER NOT NULL REFERENCES study_entities(id)
);

INSERT INTO categories (title) VALUES ('ruby');
INSERT INTO categories (title) VALUES ('rails');
INSERT INTO categories (title) VALUES ('html');
INSERT INTO categories (title) VALUES ('javascript');
INSERT INTO categories (title) VALUES ('web_development');
INSERT INTO categories (title) VALUES ('sinatra');
INSERT INTO categories (title) VALUES ('databases');
INSERT INTO categories (title) VALUES ('sql');

INSERT INTO types (title) VALUES ('coursework');
INSERT INTO types (title) VALUES ('project');
INSERT INTO types (title) VALUES ('exercises');
INSERT INTO types (title) VALUES ('book');
INSERT INTO types (title) VALUES ('tutorial');

INSERT INTO study_entities (title, category_id, type_id) VALUES ('lanuch school databases', 8, 2);
INSERT INTO study_entities (title, category_id, type_id) VALUES ('launch school ruby exercises', 8, 3);

-- INSERT INTO time_stamps (study_entities_id) VALUES (1);
-- UPDATE time_stamps SET end_time = now() WHERE id = 2;
--
-- SELECT sum(EXTRACT(EPOCH FROM (end_time - start_time)))
-- FROM time_stamps
-- WHERE study_entities_id = 1;
