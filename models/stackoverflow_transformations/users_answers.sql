
-- Join users questions_answers_join table to get a full table of all answers given by each user

select y.*,
    x.id as question_id,
    x.answer_id
    from 
    {{ ref('questions_answers_combined') }} x inner join {{ source('bq','users')}} y 
    on x.answer_owner_user_id = y.id

