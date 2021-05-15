-- Pivot the badges table by transforming the 'class' column
-- Tried using dbt_utils.pivot, but BigQuery throws an 'illegal column field' error. 

select
  user_id,
  COUNT(CASE WHEN class = '1' then 1 ELSE NULL END) as Gold,
  COUNT(CASE WHEN class = '2' then 1 ELSE NULL END) as Silver,
  COUNT(CASE WHEN class = '3' then 1 ELSE NULL END) as Bronze 
from {{ ref('badges_casted') }}
group by user_id
