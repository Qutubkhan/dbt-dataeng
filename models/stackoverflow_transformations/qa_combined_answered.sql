-- Filter questions that were answered

select DISTINCT x.id as question_id, accepted_answer_id, answer_owner_user_id
from {{ ref('questions_answers_combined') }} x
where x.accepted_answer_id IS NOT NULL