CREATE DATABASE ruby_database;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN 
);

CREATE INDEX idx_item_genre ON item (genre);
CREATE INDEX idx_item_author ON item (author);
CREATE INDEX idx_item_label ON item (label);

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

CREATE TABLE
    author (
        id SERIAL NOT NULL,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    game (
        id SERIAL NOT NULL,
        name VARCHAR(50) NOT NULL,
        multiplayer BOOLEAN NOT NULL,
        publish_date DATE NOT NULL,
        last_played_at DATE NOT NULL,
        PRIMARY KEY (id)
    );

-- create genre table
CREATE TABLE Genre(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL
);

-- create music_album table
CREATE TABLE MusicAlbum(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY(id) REFERENCES item(id) ON UPDATE CASCADE
);

CREATE INDEX idx_item_id_musicalbum ON MusicAlbum (id);
