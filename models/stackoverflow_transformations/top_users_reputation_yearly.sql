-- Find top 100 users by reputation for every year
with cte as
(   select 
    EXTRACT(YEAR FROM last_access_date) as year,
    id, display_name, reputation, Gold_Badges, Silver_Badges, Bronze_Badges,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM last_access_date) ORDER BY reputation desc) as rank
    from {{ ref('users_combined') }}
    order by EXTRACT(YEAR FROM last_access_date), rank
)

select year,id, display_name, reputation, rank
from cte
where rank<=10