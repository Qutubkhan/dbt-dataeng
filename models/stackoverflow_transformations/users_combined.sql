-- Augment users data with total questions asked, total answers given, total gold/bronze/silver badges won

with cte1 as
(
    select id, count(*) ct from {{ ref('users_questions') }} group by id
),
cte2 as
(
    select id, count(*) ct from {{ ref('users_answers') }} group by id
)

select x.*,
cte1.ct as total_questions_asked,
cte2.ct as total_answers_given,
y.Gold_Badges,
y.Silver_Badges,
y.Bronze_Badges
from {{ source('bq','users')}} x left join cte1 on x.id = cte1.id
left join
cte2 on x.id = cte2.id
left join 
{{ ref('users_badges') }} y on x.id = y.user_id
