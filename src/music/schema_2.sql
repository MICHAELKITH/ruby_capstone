-- create genre table
CREATE TABLE Genre(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL
);

-- create item table

CREATE TABLE item(
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 genre_id INT,
 author_id INT,
 source_id INT,
 label_id INT,
 publish_date Date,
 archived BOOLEAN,
 FOREIGN KEY(genre_id) REFERENCES Genre(id) ON UPDATE CASCADE,
 FOREIGN KEY(author_id) REFERENCES Author(id) ON UPDATE CASCADE,
 FOREIGN KEY(source_id) REFERENCES Source(id) ON UPDATE CASCADE,
 FOREIGN KEY(label_id) REFERENCES Label(id) ON UPDATE CASCADE
);

-- create music_album table
CREATE TABLE MusicAlbum(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY(id) REFERENCES item(id) ON UPDATE CASCADE
);