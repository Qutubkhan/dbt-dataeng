-- See how many top 100 overall users are in the top 100 yearly listings


select x.display_name, y.year, x.reputation, y.rank
from {{ ref('top_users_reputation_overall') }} x inner join
{{ ref('top_users_reputation_yearly') }} y
using (display_name)

