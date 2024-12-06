CREATE TABLE medlemmer (
    id INTEGER PRIMARY KEY,
    name NVARCHAR(128),
    email NVARCHAR(128),
    age INT,
    city NVARCHAR(128)
);

INSERT INTO medlemmer (id, name, email, age, city) VALUES
(1, 'Lars Lathans', 'lars@example.com', 30, 'Krokeide'),
(2, 'Maria Markløft', 'maria@example.com', 28, 'Krokeide'),
(3, 'Erik Enstøing', 'erik@example.com', 35, 'Krokeide'),
(4, 'Viggo Venn', 'viggo@example.com', 40, 'Bergen'),
(5, 'Lise Listig', 'lise@example.com', 25, 'Krokeide');

CREATE TABLE treningsokter (
    id INTEGER PRIMARY KEY,
    name NVARCHAR(128),
    category NVARCHAR(128),
    duration INT
);

INSERT INTO treningsokter (id, name, category, duration) VALUES
(1, 'Yoga', 'Gruppetimer', 60),
(2, 'Kondisjon', 'Gruppetimer', 45),
(3, 'Styrketrening', 'Individuelle', 75),
(4, 'Pilates', 'Gruppetimer', 50),
(5, 'Svømming', 'Individuelle', 60);

CREATE TABLE medlemskap (
    id INTEGER PRIMARY KEY,
    member_id INT,
    start_date DATETIME2 ,
    status NVARCHAR(128),
    FOREIGN KEY (member_id) REFERENCES medlemmer(id)
);

INSERT INTO medlemskap (id, member_id, start_date, status) VALUES
(1, 1, '2024-01-01', 'Aktiv'),
(2, 2, '2024-02-01', 'Aktiv'),
(3, 3, '2024-03-01', 'Aktiv'),
(4, 4, '2024-04-01', 'Utgått'),
(5, 5, '2024-05-01', 'Aktiv');

CREATE TABLE besok (
    visit_id INT PRIMARY KEY,
    member_id INT,
    session_id INT,
    visit_date DATETIME2,
    duration INT,
    FOREIGN KEY (member_id) REFERENCES medlemmer(id),
    FOREIGN KEY (session_id) REFERENCES treningsokter(id)
);

INSERT INTO besok (visit_id, member_id, session_id, visit_date, duration) VALUES
(1, 1, 1, '2024-05-10', 60),
(2, 1, 2, '2024-05-12', 45),
(3, 2, 3, '2024-05-13', 75),
(4, 3, 4, '2024-05-14', 50),
(5, 4, 5, '2024-05-15', 60),
(6, 5, 1, '2024-05-16', 60),
(7, 2, 2, '2024-05-17', 45),
(8, 3, 3, '2024-05-18', 75);

CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    member_id INT,
    session_id INT,
    rating INT,
    comments NVARCHAR(128),
    FOREIGN KEY (member_id) REFERENCES medlemmer(id),
    FOREIGN KEY (session_id) REFERENCES treningsokter(id)
);

INSERT INTO feedback (feedback_id, member_id, session_id, rating, comments) VALUES
(1, 1, 1, 4, 'Flott yogaøkt, men litt for lang pause.'),
(2, 2, 2, 5, 'Veldig bra kondisjonstrening, elsket timen!'),
(3, 3, 3, 3, 'Styrketreningen var bra, men instruktøren kunne vært mer engasjert.'),
(4, 4, 4, 4, 'God pilatesøkt, men kan bli bedre med mer variasjon.'),
(5, 5, 5, 5, 'Svømming var fantastisk, perfekt for helsen!');

DROP TABLE demo 


