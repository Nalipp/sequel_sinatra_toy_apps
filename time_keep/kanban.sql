CREATE TABLE language (
id serial PRIMARY KEY,
name VARCHAR(225) NOT NULL
);

CREATE TABLE type (
id serial PRIMARY KEY,
name VARCHAR(225) NOT NULL
);

CREATE TABLE time (
id serial PRIMARY KEY,
duration integer,
date_sub date,
memo text NOT NULL,
language_id integer NOT NULL REFERENCES language (id),
type_id integer NOT NULL REFERENCES type (id)
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

INSERT INTO type (name) VALUES ('coursework');
INSERT INTO type (name) VALUES ('project');
INSERT INTO type (name) VALUES ('book');
INSERT INTO type (name) VALUES ('problem solving');

INSERT INTO time (duration, date_sub, memo, language_id, type_id) VALUES ()
