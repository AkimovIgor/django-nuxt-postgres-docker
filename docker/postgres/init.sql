DO
$do$
DECLARE dbname varchar := 'postgres';
DECLARE username varchar := 'postgres';
DECLARE userpassword varchar := 'password';

BEGIN
    IF EXISTS (SELECT FROM pg_database WHERE datname = dbname) THEN
        RAISE NOTICE 'Database already exists';
    ELSE
        PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE ' || dbname);
        EXECUTE format('CREATE USER %I WITH ENCRYPTED PASSWORD %L', username, userpassword);
        GRANT ALL PRIVILEGES ON DATABASE dbname TO username;
    END IF;
END
$do$;
