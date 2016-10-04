CREATE TABLE language (
id serial PRIMARY KEY,
name VARCHAR(225) NOT NULL
);

CREATE TABLE study_type (
id serial PRIMARY KEY,
name VARCHAR(225) NOT NULL
);

CREATE TABLE time (
id serial PRIMARY KEY,
duration integer NOT NULL,
date_sub date NOT NULL,
title text NOT NULL,
language_id integer NOT NULL REFERENCES language (id),
study_type_id integer NOT NULL REFERENCES study_type (id)
);


INSERT INTO language (name) VALUES ('ruby');
INSERT INTO language (name) VALUES ('rails');
INSERT INTO language (name) VALUES ('javascript');
INSERT INTO language (name) VALUES ('html');
INSERT INTO language (name) VALUES ('web development');
INSERT INTO language (name) VALUES ('sinatra');
INSERT INTO language (name) VALUES ('python');
INSERT INTO language (name) VALUES ('data');
INSERT INTO language (name) VALUES ('testing');
INSERT INTO language (name) VALUES ('computer science');
INSERT INTO language (name) VALUES ('jekyll');
INSERT INTO language (name) VALUES ('canvas');

INSERT INTO study_type (name) VALUES ('coursework');
INSERT INTO study_type (name) VALUES ('project');
INSERT INTO study_type (name) VALUES ('book');
INSERT INTO study_type (name) VALUES ('problem solving');

-- INSERT INTO time (duration, date_sub, title, language_id, type_id) VALUES ()
