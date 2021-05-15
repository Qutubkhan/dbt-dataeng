
with cte as
    (
        select id, count(*) as ct
        from {{ ref('questions_answers_combined' )}}
        group by id
    )
select
    cte.id
from cte inner join {{ ref('questions_answers_combined' )}} as x 
on cte.id = x.id
where cte.ct!=x.answer_count and x.answer_count!=0