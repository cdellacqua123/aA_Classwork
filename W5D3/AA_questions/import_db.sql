PRAGMA foreign_keys = ON;

CREATE TABLE users (
    u_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    q_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(u_id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    follower_user_id INTEGER NOT NULL,
    initial_q_id INTEGER NOT NULL,

    FOREIGN KEY (follower_user_id) REFERENCES users(u_id)
    FOREIGN KEY (initial_q_id) REFERENCES questions(q_id)
);

CREATE TABLE replies (
    reply_id INTEGER PRIMARY KEY,
    subject_q_id INTEGER NOT NULL,
    parent_id INTEGER,
    reply_user_id INTEGER NOT NULL,
    reply_body TEXT NOT NULL,

    FOREIGN KEY (parent_id) REFERENCES replies(reply_id)
    FOREIGN KEY (subject_q_id) REFERENCES questions(q_id)
    FOREIGN KEY (reply_user_id) REFERENCES users(u_id)
);

CREATE TABLE question_likes (
    like_id INTEGER PRIMARY KEY,
    like_user_id INTEGER NOT NULL,
    like_q_id INTEGER NOT NULL,

    FOREIGN KEY (like_user_id) REFERENCES users(u_id)
    FOREIGN KEY (like_q_id) REFERENCES questions(q_id)
);

INSERT INTO 
    users (fname,lname)
VALUES
    ('Renee', 'Descartes'),
    ('Plato', 'Aristocles'),
    ('Socrates', 'DaAthens'),
    ('Immanuel', 'Kant'),
    ('Friedrich', 'Nietzsche');

INSERT INTO
    questions (title,body,author_id)
VALUES
    ('Do I exist?', 'I think, therefore, I am', (SELECT u_id FROM users WHERE lname = 'Descartes')),
    ('What creates human perception?', 'Knowledge can only come via philosphical reasoning', (SELECT u_id FROM users WHERE lname = 'Aristocles')),
    ('What to question?', 'Everything', (SELECT u_id FROM users WHERE lname = 'DaAthens')),
    ('What is enlightment?', 'How to enlighten?', (SELECT u_id FROM users WHERE lname = 'Kant')),
    ('What should we treasure?', 'Nothing materialistic', (SELECT u_id FROM users WHERE lname = 'Nietzsche'));

INSERT INTO
    question_follows (follower_user_id, initial_q_id)
VALUES
    ((SELECT u_id FROM users WHERE fname = 'Renee') , (SELECT q_id FROM questions WHERE title = 'Do I exist?') ),
    ((SELECT u_id FROM users WHERE fname = 'Plato') , (SELECT q_id FROM questions WHERE title = 'What creates human perception?') ),
    ((SELECT u_id FROM users WHERE fname = 'Socrates') , (SELECT q_id FROM questions WHERE title = 'What to question?') ),
    ((SELECT u_id FROM users WHERE fname = 'Immanuel') , (SELECT q_id FROM questions WHERE title = 'What is enlightment?') ),
    ((SELECT u_id FROM users WHERE fname = 'Friedrich') , (SELECT q_id FROM questions WHERE title = 'What should we treasure?') );




INSERT INTO 
    replies (subject_q_id, reply_user_id, reply_body, parent_id)
VALUES
    ((SELECT q_id FROM questions WHERE title = 'What creates human perception?'), 
    (SELECT u_id FROM users WHERE lname = 'DaAthens'), 'That is so cute, young one', NULL),

    ((SELECT q_id FROM questions WHERE title = 'Do I exist?'), 
    (SELECT u_id FROM users WHERE lname = 'Nietzsche'), 'What is "I"?', NULL),

    ((SELECT q_id FROM questions WHERE title = 'What should we treasure?'), 
    (SELECT u_id FROM users WHERE lname = 'Kant'), 'But what about my money?', NULL),

    ((SELECT q_id FROM questions WHERE title = 'What to question?'), 
    (SELECT u_id FROM users WHERE lname = 'Descartes'), 'So true!', NULL);
    

INSERT INTO 
    replies (subject_q_id, reply_user_id, reply_body, parent_id)
VALUES
    ((SELECT q_id FROM questions WHERE title = 'What creates human perception?'), 
    (SELECT u_id FROM users WHERE lname = 'Aristocles'), 'Plz leave me alone',
    (SELECT reply_id FROM replies WHERE reply_body = 'That is so cute, young one'));


INSERT INTO
    question_likes (like_user_id,like_q_id)
VALUES
    ((SELECT u_id FROM users WHERE fname = 'Friedrich') , (SELECT q_id FROM questions WHERE title = 'What should we treasure?')),
    ((SELECT u_id FROM users WHERE fname = 'Immanuel') , (SELECT q_id FROM questions WHERE title = 'What should we treasure?')),
    ((SELECT u_id FROM users WHERE fname = 'Friedrich') , (SELECT q_id FROM questions WHERE title = 'What to question?' )),
    ((SELECT u_id FROM users WHERE fname = 'Renee') , (SELECT q_id FROM questions WHERE title = 'What creates human perception?' ));