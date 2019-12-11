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
