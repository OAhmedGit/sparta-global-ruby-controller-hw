DROP TABLE IF EXISTS post;

CREATE TABLE post (

id SERIAL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(255),
age INT
);

INSERT INTO post (first_name , last_name, email, age) VALUES ('Osama' , 'Ahmed', '123@gmail.com', 24);
INSERT INTO post (first_name , last_name, email, age) VALUES ('Alex' , 'Metzgen', '456@gmail.com', 24);
INSERT INTO post (first_name , last_name, email, age) VALUES ('Jira' , 'W', '789@gmail.com', 24);
