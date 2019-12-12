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
