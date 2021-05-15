-- Filter questions that were unanswered

select DISTINCT x.id as question_id, accepted_answer_id
from {{ ref('questions_answers_combined') }} x
where x.accepted_answer_id IS NULL