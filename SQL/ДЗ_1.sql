CREATE TABLE films (
    title text,
    id INTEGER NOT NULL, 
    country TEXT, 
    box_office MONEY,
    release_date INTEGER
);

INSERT INTO
    films
VALUES
    ('Lost in Translation', 1, 'USA, Japan', 44585453, 2003),
    ('Leon', 2, 'USA', 19501238, 1994),
    ('Ghost in the shell', 3, 'Japan', 515905, 1995),
    ('Johnny Mnemonic', 4, 'Canada, USA', 19075720, 1995),
    ('Edward Scissorhands', 5, 'USA', 56362352, 1990);

CREATE TABLE persons (
    id INTEGER,
    fio TEXT
);

INSERT INTO
    persons
VALUES
    (11, 'Sofia Coppola'),
    (22, 'Luc Besson'),
    (33, 'Mamoru Oshii'),
    (44, 'Robert Longo'),
    (55, 'Tim Burton');

CREATE TABLE persons2content (
    person_id INTEGER,
    film_id INTEGER PRIMARY KEY,
    person_type TEXT
);

INSERT INTO
    persons2content
VALUES
    (11, 1, 'director'),
    (22, 2, 'director'),
    (33, 3, 'director'),
    (44, 4, 'director'),
    (55, 5, 'director');