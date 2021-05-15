--Model for joining stackoverflow questions and answers table, and removing unessential columns from answers table.

{{ config(materialized='view') }}

SELECT x.*,
    y.id as answer_id,
    y.body as answer_body, 
    y.comment_count as answer_comment_count,
    y.creation_date as answer_creation_date,
    y.last_activity_date as answer_last_activity_date,
    y.owner_user_id as answer_owner_user_id,
    y.parent_id as answer_parent_id, 
    y.post_type_id as answer_post_type_id,
    y.score as answer_score
FROM 
    {{ source('bq','posts_questions')}} as x
    LEFT JOIN
    {{ source('bq', 'posts_answers')}} as y
    ON x.id = y.parent_id

