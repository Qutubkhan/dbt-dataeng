-- Cast 'name' of badges table

select id, name, date, tag_based, user_id, CAST(class AS STRING) as class from {{ source('bq','badges')}}