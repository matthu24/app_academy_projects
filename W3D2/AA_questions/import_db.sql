DROP TABLE IF EXISTS users;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  follower_id INTEGER NOT NULL,

  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body VARCHAR(255) NOT NULL,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Matthew', 'Hu'),
  ('Vickie', 'Chen'),
  ('Bob','Johnson');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Random', 'Random question', (SELECT id FROM users WHERE fname = 'Matthew' AND lname = 'Hu')),
  ('Random2', 'Vickie''s question', (SELECT id FROM users WHERE fname = 'Vickie' AND lname = 'Chen')),
  ('Random3', 'Another random question', (SELECT id FROM users WHERE fname = 'Vickie' AND lname = 'Chen'));

INSERT INTO
  question_follows (question_id, follower_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 2),
  (1, 2),
  (2, 1),
  (3, 2);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 2, 'Hey'),
  (1, 1, 1, 'Hi'),
  (2, NULL, 1, 'Something');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 2),
  (2, 1);
