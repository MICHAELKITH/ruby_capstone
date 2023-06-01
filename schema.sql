CREATE DATABASE ruby_database;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN 
);


CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
  id  INT,
  title VARCHAR(100),
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY(id) REFERENCES item(id)
);
