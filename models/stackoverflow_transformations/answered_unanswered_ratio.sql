-- for every year, find ratio of answered and unaswered

{{ config(materialized='incremental') }}

with cte1 as
(
    select EXTRACT(YEAR FROM creation_date) year, count(*) answered
    from {{ ref('qa_combined_answered') }}
    group by EXTRACT(YEAR FROM creation_date)
),
cte2 as
(
    select EXTRACT(YEAR FROM creation_date) year, count(*) unanswered
    from {{ ref('qa_combined_unanswered') }}
    group by EXTRACT(YEAR FROM creation_date)
), 
cte3 as
(
    select EXTRACT(YEAR FROM creation_date) year, count(*) total
    from {{ ref('questions_answers_combined') }}
    group by EXTRACT(YEAR FROM creation_date)
)

select cte3.year, (answered/total) ans_perc, (unanswered/total) unans_perc
from cte3 inner join cte2 on cte3.year = cte2.year
          inner join cte1 on cte3.year = cte1.year
order by cte3.year 


{% if is_incremental() %}
WHERE cte3.year > (SELECT MAX(cte3.year) FROM {{ this }})
{% endif %}