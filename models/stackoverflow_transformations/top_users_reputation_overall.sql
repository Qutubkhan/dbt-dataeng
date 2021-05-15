-- Find top 100 users by reputation overall 

select id,display_name, reputation, Gold_Badges, Silver_Badges, Bronze_Badges
from {{ ref('users_combined') }}
order by reputation desc
limit 100