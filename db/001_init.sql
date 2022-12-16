
DO $$ -- DO: executes an anonymous code block
BEGIN

    CREATE SCHEMA IF NOT EXISTS Spotify;

    RAISE NOTICE 'Creating Tables';

    CREATE TABLE IF NOT EXISTS Spotify.Playlist (

    );

END;
$$