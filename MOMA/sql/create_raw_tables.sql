create schema if not exists raw;

-- Creando la tabla raw.artists

drop table if exists raw.artists;

create table raw.artists (
  "ConstituentID" TEXT,
  "DisplayName" TEXT,
  "ArtistBio" TEXT,
  "Nationality" TEXT,
  "Gender" TEXT,
  "BeginDate" TEXT,
  "EndDate" TEXT,
  "Wiki QID" TEXT,
  "ULAN" TEXT
);

comment on table raw.artists is 'Contiene informacion de artistas cuyas obras son exhibidas en el MoMA';

-- Creando la tabla raw.artworks

drop table if exists raw.artworks;

create table raw.artworks (
  "Title" TEXT,
  "Artist" TEXT,
  "ConstituentID" TEXT,
  "ArtistBio" TEXT,
  "Nationality" TEXT,
  "BeginDate" TEXT,
  "EndDate" TEXT,
  "Gender" TEXT,
  "Date" TEXT,
  "Medium" TEXT,
  "Dimensions" TEXT,
  "CreditLine" TEXT,
  "AccessionNumber" TEXT,
  "Classification" TEXT,
  "Department" TEXT,
  "DateAcquired" TEXT,
  "Cataloged" TEXT,
  "ObjectID" TEXT,
  "URL" TEXT,
  "ThumbnailURL" TEXT,
  "Circumference (cm)" TEXT,
  "Depth (cm)" TEXT,
  "Diameter (cm)" TEXT,
  "Height (cm)" TEXT,
  "Length (cm)" TEXT,
  "Weight (kg)" TEXT,
  "Width (cm)" TEXT,
  "Seat Height (cm)" TEXT,
  "Duration (sec.)" TEXT
);

comment on table raw.artworks is 'Contiene informacion de las obras exhibidas en el MoMA';
