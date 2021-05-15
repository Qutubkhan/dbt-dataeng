-- Perform some tests on users combined data

select *
from 
{{ ref('users_combined') }}
where 
CAST(age AS INT64) < 0
or 
CAST(reputation AS INT64) < 0