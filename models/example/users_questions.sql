
-- Join users questions_answers_join table to get a full table of all questions asked by each user (posts made)

select y.*,
    x.id as question_id
    from 
    {{ ref('questions_answers_combined') }} x inner join {{ source('bq','users')}} y 
    on x.owner_user_id = y.id

