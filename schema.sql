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