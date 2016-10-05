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
INSERT INTO language (name) VALUES ('sql');

INSERT INTO study_type (name) VALUES ('coursework');
INSERT INTO study_type (name) VALUES ('project');
INSERT INTO study_type (name) VALUES ('book');
INSERT INTO study_type (name) VALUES ('problem solving');
INSERT INTO study_type (name) VALUES ('tutorial');

INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1326, '2016-10-03', 'launch school databases', 13, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(41, '2016-10-03', 'launch school prepwork', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(46, '2016-10-03', 'launch school exercises', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(54, '2016-10-03', 'study records', 13, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1140, '2016-09-26', 'launch school databases', 13, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(80, '2016-09-26', 'launch school html prepwork', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(252, '2016-09-26', 'Launch School exercises', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1402, '2016-09-19', 'Launch school databases', 13, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1459, '2016-09-16', 'Launch school web development / sinatra', 6, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1749, '2016-09-05', 'launch school web development / sinatra', 6, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1012, '2016-08-29', 'launch school web development / sinatra', 6, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1204, '2016-08-22', 'launch school web development / sinatra', 6, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1290, '2016-08-15', 'launch school web development / sinatra', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(2288, '2016-08-07', 'launch school web development / sinatra', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(879, '2016-08-01', 'launch school Web Development', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1222, '2016-08-01', 'launch school Object Oriented Programing', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(695, '2016-07-26', 'launch school Object Oriented Programing', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1508, '2016-07-18', 'launch school Object Oriented Programing', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1725, '2016-07-11', 'launch school Object Oriented Programing', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1705, '2016-07-03', 'launch school Object Oriented Programing', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1640, '2016-06-26', 'launch school ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1505, '2016-06-19', 'launch school ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(511, '2016-06-12', 'udacity web development fundamentals', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1161, '2016-06-12', 'launch school ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(362, '2016-06-07', 'a byte of python', 7, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(244, '2016-06-07', 'udacity computer science python', 10, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(154, '2016-06-07', 'udacity web development fundamentals', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(75, '2016-06-07', 'exercism.io', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(353, '2016-06-07', 'launch school api', 8, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-06-07', 'harvard cs50', 10, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(78, '2016-05-30', 'my udemy ruby course', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(608, '2016-05-30', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2016-05-30', 'jumpstart labs ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(197, '2016-05-30', 'exercism.io ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(287, '2016-05-30', 'http request launch school', 5, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(137, '2016-05-23', 'udemy ruby course', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(44, '2016-05-23', 'jumpstart labs ruby', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(929, '2016-05-23', 'udacity nanodegree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(156, '2016-05-23', 'my udemy ruby course', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(205, '2016-05-16', 'bastards book of ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(486, '2016-05-16', 'api data project ruby', 8, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(158, '2016-05-16', 'jumpstart labs event manager ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(252, '2016-05-16', 'udemy ruby course', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(306, '2016-05-16', 'launch school Object Oriented Programing ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(112, '2016-05-08', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1001, '2016-05-08', 'udemy ruby course', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(393, '2016-05-08', 'my udemy course ruby', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(249, '2016-05-08', 'launch school Object Oriented Programing ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1153, '2016-05-01', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-05-01', 'ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1295, '2016-04-24', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1220, '2016-04-18', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1365, '2016-04-10', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(127, '2016-04-04', 'launch school Object Oriented Programing ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1358, '2016-04-04', 'udacity nano degree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1281, '2016-03-28', 'udacity nanodegree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(26, '2016-03-21', 'udemy ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(158, '2016-03-21', 'udemy rails course', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(133, '2016-03-21', 'contribute to free code camp ROR tutorial', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-03-21', 'pragmatic blocks and iterators ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1135, '2016-03-13', 'udacity nanodegree ruby', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(549, '2016-03-13', 'udemy rails', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(244, '2016-03-13', 'classroom games javascript', 3, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-03-13', 'free code camp javascript', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(184, '2016-03-08', 'free code camp javascript', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(71, '2016-03-08', 'games project javascript', 3, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(225, '2016-03-08', 'scott murray d3.js', 8, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(90, '2016-03-08', 'udacity d3.js', 8, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(121, '2016-03-08', 'udemy bootcamp javascript', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(63, '2016-03-08', 'udacity jQuery', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(87, '2016-03-01', 'udacity object oriented programing', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1313, '2016-02-29', 'udemy bootcamp javascript', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(361, '2016-02-29', 'udacity basic javascript', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(181, '2016-02-29', 'udacity HTMLcanvas', 12, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(97, '2016-02-29', 'exploring data visualization', 8, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(212, '2016-02-29', 'classroom games javascript', 3, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-02-22', 'gaby marketplace rails project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(285, '2016-02-22', 'rails blog tutorial', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(570, '2016-02-22', 'my store rails project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-02-22', 'udemy responsive web design', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1037, '2016-02-22', 'udemy javascript bootcamp', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(156, '2016-02-15', 'udacity responsive web design', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(586, '2016-02-15', 'udacity html intro', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(422, '2016-02-15', 'my store html rails project', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(83, '2016-02-15', 'udemy bootcamp html', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(86, '2016-02-15', 'bookstore html', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2016-02-07', 'css zen garden', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(382, '2016-02-07', 'udemy bootcamp html', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(200, '2016-02-07', 'thoughtbot testing book', 9, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(435, '2016-02-07', 'jumpstart labs rails blogger2', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(905, '2016-02-01', 'udemy project', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(243, '2016-01-24', 'udemy bootcamp html', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(269, '2016-01-24', 'pragmatic studo ruby blocks', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(70, '2016-01-24', 'ruby koans', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(515, '2016-01-24', 'pragmatic studios rails clone', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(88, '2016-01-24', 'css garden', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1085, '2016-01-24', 'udemy code challenge', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(697, '2016-01-18', 'Photogram rails (testing)', 9, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(305, '2016-01-18', 'exercism.io ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(20, '2016-01-18', 'thoughtbot book (testing)', 9, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(136, '2016-01-18', 'ruby koans', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(152, '2016-01-18', 'udemy bootcamp html', 4, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(459, '2016-01-18', 'pragmatic studio ruby blocks', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(400, '2016-01-18', 'pragmatic clone', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(250, '2016-01-11', 'ruby monk', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1134, '2016-01-11', 'exercism.io ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(198, '2016-01-11', 'free code camp portfolio', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1104, '2016-01-11', 'Photogram rails (testing)', 9, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(323, '2016-01-04', 'exercism ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(316, '2016-01-04', 'Photogram rails (testing)', 9, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(14, '2016-01-04', 'indeed project', 8, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(260, '2016-01-04', 'ruby monk', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(640, '2016-01-04', 'launch school prep', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(201, '2016-01-04', 'free code camp', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(390, '2015-12-27', 'free code camp', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(90, '2015-12-27', 'launch school prep', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-12-20', 'free code camp problems', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(24, '2015-12-20', 'code place', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(321, '2015-12-20', 'angular MEAN introduction', 3, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(31, '2015-12-20', 'sinatra', 6, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(64, '2015-12-20', 'indeed project', 8, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(619, '2015-12-15', 'udemy bdd testing rspec capybara', 9, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-12-15', 'html css bootstrap', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(158, '2015-12-15', 'indeed project', 8, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(260, '2015-12-15', 'code place', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1098, '2015-12-06', 'read my code (project)', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-12-06', 'odin videos', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(30, '2015-12-06', 'ruby koans', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(271, '2015-12-06', 'udemy complete ruby on rails developer course', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1050, '2015-11-30', 'udemy complete ruby on rails developer course', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(30, '2015-11-30', 'odin project', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(23, '2015-11-30', 'codecademy jquery', 3, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(113, '2015-11-30', 'codecademy rails', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(90, '2015-11-30', 'html', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-11-30', 'go rails forum', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2015-11-30', 'teacher-forum rails project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(90, '2015-11-22', 'Udacity Javascript basics', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(515, '2015-11-22', 'udemy compute ruby on rails developer course', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(165, '2015-11-22', 'html', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(450, '2015-11-22', 'time sheet project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(255, '2015-11-22', 'go rails forum', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(217, '2015-11-16', 'udemy complete ruby on rails developer course', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(40, '2015-11-16', 'Udacity Ajax', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(530, '2015-11-16', 'Udacity Javascript basics', 3, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(200, '2015-11-16', 'html template and rails', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(173, '2015-11-16', 'Rails javascript tutorial, reading and video examples', 3, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(145, '2015-11-09', 'project - authentication - points / upvotes - pagnation', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(258, '2015-11-09', 'udemy professional rails developer', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(315, '2015-11-09', 'stuk.io beta', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(32, '2015-11-09', 'stuk.io project', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(469, '2015-11-09', 'firehose project preview', 1, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(41, '2015-11-09', 'responsive html', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(75, '2015-11-02', 'ionic angular rails tutorial', 3, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(370, '2015-11-02', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(433, '2015-11-02', 'image_uploader - upvote', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(320, '2015-10-25', 'rails ionic angular tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-10-25', 'point-pad project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(366, '2015-10-25', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(305, '2015-10-19', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(325, '2015-10-17', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(30, '2015-10-17', 'rails docs practice', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(75, '2015-10-05', 'gaby blue', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(150, '2015-10-05', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(128, '2015-09-14', 'stuk.io', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2015-09-14', 'gaby blue', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(135, '2015-09-14', 'ruby monk', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(26, '2015-09-14', 'blog tutorial practice', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(313, '2015-09-14', 'udemy professional rails developer', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(69, '2015-09-07', 'hassle project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(35, '2015-09-07', 'thinkful tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(633, '2015-09-07', 'stuk.io', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(95, '2015-09-0', 'my tutorial', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(105, '2015-08-30', 'my tutorial', 1, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(320, '2015-08-30', 'stuk.io', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2015-08-30', 'Jekyll', 11, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(75, '2015-08-30', 'gaby blue', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(183, '2015-08-30', 'people can code', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(270, '2015-08-24', 'hartl tutorial', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-08-24', 'rails apps devise', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-08-24', 'explore rails resources', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(183, '2015-08-24', 'The Odin Project', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(210, '2015-08-24', 'people can code', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2015-08-24', 'stuk.io', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(22, '2015-08-17', 'ruby', 1, 4);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(142, '2015-08-17', 'gaby-blue', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(257, '2015-08-17', 'eloquent javascript', 3, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(188, '2015-08-17', 'michael hartl rails tutorial', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(156, '2015-08-17', 'html5 template', 4, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(280, '2015-08-10', 'gaby_blue', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(65, '2015-08-10', 'ruby_rails_experienments', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(271, '2015-08-10', 'hartl tutorial', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(238, '2015-08-10', 'korean nomad', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(30, '2015-08-03', 'rails girls guides', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(308, '2015-08-03', 'hartl tutorial', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(99, '2015-08-03', '12_12 tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-08-03', 'rails coding', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(197, '2015-08-03', 'rails edge guides', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(229, '2015-08-03', 'gaby boolean project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(285, '2015-07-27', 'jquery material design for bootstrap', 3, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(150, '2015-07-27', 'rails girls tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(244, '2015-07-27', 'edge rails tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(210, '2015-07-27', 'project html building', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(200, '2015-07-20', 'project practice', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(220, '2015-07-20', 'project building', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(244, '2015-07-20', 'code tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(90, '2015-07-13', 'rails tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(183, '2015-07-13', 'gaby coding', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(183, '2015-07-13', 'tutorial html', 4, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(488, '2015-07-13', 'rails tutorial coding', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(61, '2015-07-06', 'html tutorial', 4, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(427, '2015-07-06', 'Rails tutorial coding', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(465, '2015-07-01', 'rails coding practice', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(195, '2015-07-01', 'rails blogger', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(427, '2015-07-01', 'code school html', 4, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(305, '2015-06-22', 'rails (coding)', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(183, '2015-06-22', 'code school html', 4, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(450, '2015-06-22', 'video tutorial rails prep', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(244, '2015-06-22', 'html css practice', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(676, '2015-06-15', 'html css practice', 4, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(153, '2015-06-15', 'video tutorial preperation', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(516, '2015-06-15', 'Ruby tutorial (code building practice)', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(165, '2015-06-15', 'Ruby on rails tutorial Michael Hartl', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(366, '2015-06-08', 'rails tutorial (code building)', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(750, '2015-06-08', 'Ruby on rails tutorial Michal Hartl', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(270, '2015-06-02', 'Rails_apps tutorial', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(862, '2015-06-02', 'Ruby on rails tutorial Michael Hartl', 2, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(881, '2015-05-25', 'Rails_apps tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(329, '2015-05-18', 'Rails_apps tutorial', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(30, '2015-05-18', 'ruby/rails project', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(20, '2015-05-18', 'rails codecademy', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(793, '2015-05-18', 'rails guides (coding)', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(48, '2015-05-11', 'rails code academy', 2, 1);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(113, '2015-05-11', 'rails various reading', 2, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(498, '2015-05-11', 'rails guide (coding)', 2, 2);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(74, '2015-05-04', 'tea leaf object oriented programing', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(67, '2015-05-04', 'learn ruby the hard way', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(50, '2015-05-04', 'codecademy', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(95, '2015-05-04', 'pickax ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(132, '2015-04-27', 'tea leaf ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(434, '2015-04-27', 'pickax ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(49, '2015-04-27', 'codecademy', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(122, '2015-04-27', 'learn ruby the hard way', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(286, '2015-04-20', 'tea leaf', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(444, '2015-04-20', 'pickax', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(363, '2015-04-20', 'codecademy', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(50, '2015-04-12', 'example code Mississippi college', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(294, '2015-04-12', 'codecademy', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(643, '2015-04-12', 'Tea leaf ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(841, '2015-04-05', 'Tea Leaf Ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(400, '2015-03-30', 'Tea Leaf Ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(180, '2015-03-30', 'codecademy', 1, 5);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(205, '2015-03-23', 'Learn Ruby the Hard Way', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(50, '2015-03-16', 'Learn Ruby the Hard Way', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(335, '2015-03-07', 'Learn Ruby the Hard Way', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(226, '2015-02-23', 'Learn To Program With Ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(1209, '2015-02-16', 'Learn to Program with Ruby', 1, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(931, '2015-02-09', 'Python', 7, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(999, '2015-01-26', 'Python Kids', 7, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(896, '2015-01-26', 'python kids', 7, 3);
INSERT INTO time (duration, date_sub, title, language_id, study_type_id) VALUES(558, '2015-01-06', 'Python Kids', 7, 5);
