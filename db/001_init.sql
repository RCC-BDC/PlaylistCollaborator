
DO $$ -- DO: executes an anonymous code block
BEGIN

    CREATE SCHEMA IF NOT EXISTS Spotify;

    RAISE NOTICE 'Creating Tables';

    CREATE TABLE IF NOT EXISTS Spotify.User (
        id CHAR(256) NOT NULL,
        name CHAR(256) NOT NULL,
        uri CHAR(256) NOT NULL,
        PRIMARY KEY(id)
    );

    CREATE TABLE IF NOT EXISTS Spotify.Playlist (
        id CHAR(256) NOT NULL,
        name CHAR(256) NOT NULL,
        uri CHAR(256) NOT NULL,
        user_id CHAR(256) NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES Spotify.User(id)
    );

    CREATE TABLE IF NOT EXISTS Spotify.Track (
        id CHAR(256) NOT NULL,
        name CHAR(256) NOT NULL,
        artist CHAR(256) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE TABLE IF NOT EXISTS Spotify.Vote (
        user_id CHAR(256) NOT NULL,
        track_id CHAR(256) NOT NULL,
        vote CHAR(1) NOT NULL,
        PRIMARY KEY(user_id, track_id),
        FOREIGN KEY (user_id) REFERENCES Spotify.User(id),
        FOREIGN KEY (track_id) REFERENCES Spotify.Track(id)
    );

END;
$$