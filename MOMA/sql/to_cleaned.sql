drop table if exists cleaned.artists cascade;

create table cleaned.artists as (
select
  "ConstituentID"::int  as constituent_id,
  LOWER("DisplayName")::varchar as display_name,
  LOWER("Nationality")::varchar as nationality,
  case when "Gender" = 'Male' then 'M' else 'F' end::varchar as gender,
  case when "BeginDate" = '0' then NULL else "BeginDate" end::integer as born_year,
  case when "EndDate" = '0' then NULL else "EndDate" end::integer as death_year,
  "Wiki QID"::varchar as wiki_qid,
  "ULAN"::varchar as ulan from raw.artists
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
  "AccessionNumber"::varchar as accession_number,
  "Classification"::varchar as classification,
  "Department"::varchar as department,
  TO_DATE("DateAcquired", 'YYYY-MM-DD')::date as date_acquired,
  "Cataloged"::char as cataloged,
  "URL"::varchar as url,
  "ThumbnailURL" as thumbnail_url,
  case when "Circumference (cm)"='' then Null else "Circumference (cm)" end::decimal  as circumference_cm,
  case when "Depth (cm)"= '' then Null else "Depth (cm)" end::decimal as depth_cm,
  case when "Diameter (cm)"= '' then Null else "Diameter (cm)" end::decimal as diameter_cm,
  case when "Height (cm)"= '' then Null else "Height (cm)" end::decimal as height_cm,
  case when "Length (cm)"='' then Null else "Length (cm)" end::decimal  as length_cm,
  case when "Weight (kg)"='' then Null else "Weight (kg)" end::decimal as weight_kg,
  case when "Width (cm)"='' then Null else "Width (cm)" end::decimal as width_cm,
  case when "Seat Height (cm)"='' then Null else "Seat Height (cm)" end::decimal as seat_height_cm,
  case when "Duration (sec.)"='' then NUll else "Duration (sec.)" end::decimal as duration_sec
  from raw.Artworks
);

create index cleaned_artworks_object_id on cleaned.artworks (object_id);
create index cleaned_artworks_constituent_id on cleaned.artworks (constituent_id);
