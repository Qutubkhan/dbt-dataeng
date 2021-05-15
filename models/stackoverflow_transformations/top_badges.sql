-- Select top 10 most commonly won badges
with cte as
(
    select name, count(*)
    from {{ source('bq','badges')}}
    group by name
    order by count(*) desc
    limit 10
)
select name from cte



