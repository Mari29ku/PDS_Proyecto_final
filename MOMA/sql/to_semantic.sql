-- Creamos la entidad.
-- Basicamente, es un catalogo de clasificaciones de obras de arte.
 
drop table if exists semantic.entities;

create table if not exists semantic.entities (
    id serial,
    classification varchar
);

insert into semantic.entities (classification) (
    select distinct(classification) from cleaned.artworks
);

-- Creamos los eventos.
-- Para esta iteracion estamos considerando solo el evento -ingreso-
-- (cuando una obra de arte ingresa al museo)

drop type if exists event_type cascade;

create type event_type as enum ('art_accession');

drop table if exists semantic.events;

create table if not exists semantic.events (
    id serial,
    event event_type,
    artist_id varchar,
    artwork_id varchar,
    accession_id varchar,
    date_acquired date
);

insert into semantic.events (event, artist_id, artwork_id, accession_id, date_acquired) (
    select
        'art_accession'::event_type,
        constituent_id,
        object_id,
        accession_number,
        date_acquired
    from cleaned.artworks
);

-- Creamos los cohorts.

-- Separamos las obras por siglo.

drop table if exists cohorts.century_19;

create table if not exists cohorts.century_19 (
    id serial,
    artist_id varchar,
    artwork_id varchar,
    accession_id varchar,
    date_acquired date
);

insert into cohorts.century_19 (artist_id, artwork_id, accession_id, date_acquired) (
    SELECT artist_id, artwork_id, accession_id, date_acquired
    FROM semantic.events
    WHERE date_acquired < TO_DATE('2000/01/01', 'YYYY/MM/DD')
);

drop table if exists cohorts.century_20;

create table if not exists cohorts.century_20 (
    id serial,
    artist_id varchar,
    artwork_id varchar,
    accession_id varchar,
    date_acquired date
);

insert into cohorts.century_20 (artist_id, artwork_id, accession_id, date_acquired) (
    SELECT artist_id, artwork_id, accession_id, date_acquired
    FROM semantic.events
    WHERE date_acquired >= TO_DATE('2000/01/01', 'YYYY/MM/DD')
);

drop table if exists cohorts.top_100_artists;

create table if not exists cohorts.top_100_artists (
    artist_id varchar,
    name varchar,
    nationality varchar,
    born int,
    death int,
    number_of_artworks int
);

insert into cohorts.top_100_artists (
    SELECT
        E.artist_id, A.display_name, A.nationality, A.born_year, A.death_year, COUNT(TRUE) as number_of_artworks
    FROM semantic.events AS E INNER JOIN cleaned.artists AS A on E.artist_id::varchar = A.constituent_id::varchar
    GROUP BY E.artist_id, A.display_name, A.nationality, A.born_year, A.death_year ORDER BY 6 DESC LIMIT 100
);
