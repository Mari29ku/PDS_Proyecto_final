drop table if exists cleaned.artists cascade;

create table cleaned.artists as (
select
  "ConstituentID" as constituent_id,
  LOWER("DisplayName") as display_name,
  LOWER("Nationality") as nationality,
  case when "Gender" = 'Male' then 'M' else 'F' end as gender,
  case when "BeginDate" = '0' then NULL else "BeginDate" end as born_year,
  case when "EndDate" = '0' then NULL else "EndDate" end as death_year,
  "Wiki QID" as wiki_qid,
  "ULAN" as ulan from raw.artists
);

create index cleaned_artists_constituent_id on cleaned.artists (constituent_id);

drop table if exists cleaned.artworks;

create table cleaned.artworks as(

select
  "ObjectID"::int as object_id,
  "Artist"::varchar as artist,
  "Title"::varchar as title,
  "ConstituentID" as constituent_id,
  "Nationality"::varchar as nationality,
  "BeginDate" as begin_date,
  "EndDate" as end_date,
  "Gender"::varchar as gender,
  "Date" as date,
  "Medium"::varchar as medium,
  "CreditLine"::varchar as credit_line,
  "Classification"::varchar as classification,
  "Department"::varchar as department,
  "DateAcquired" as date_acquired,
  "Cataloged"::char as cataloged,
  "URL"::varchar as url,
  "ThumbnailURL" as thumbnail_url,
  "Circumference (cm)" as circumference_cm,
  "Depth (cm)" as depth_cm,
  "Diameter (cm)" as diameter_cm,
  "Height (cm)" as height_cm,
  "Length (cm)" as length_cm,
  "Weight (kg)" as weight_kg,
  "Width (cm)" as width_cm,
  "Seat Height (cm)" as seat_height_cm,
  "Duration (sec.)" as duration_sec
  from raw.Artworks
);

create index cleaned_artworks_object_id on cleaned.artworks (object_id);
create index cleaned_artworks_constituent_id on cleaned.artworks (constituent_id);
