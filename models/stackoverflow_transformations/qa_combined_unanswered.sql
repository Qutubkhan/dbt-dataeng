-- Filter questions that were unanswered

select DISTINCT x.id as question_id, accepted_answer_id, x.creation_date
from {{ ref('questions_answers_combined') }} x
where x.answer_count=0