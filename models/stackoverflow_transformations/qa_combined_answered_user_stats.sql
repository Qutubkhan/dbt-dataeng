-- Filter questions that were answered and get details of user who answered it

select 
    MIN(reputation) minrep,
    AVG(reputation) avgrep, 
    MAX(reputation) maxrep, 
    MIN(Gold_Badges) mingold, 
    AVG(Gold_Badges) avggold, 
    MAX(Gold_Badges) maxgold, 
    MIN(Silver_Badges) minsilver, 
    AVG(Silver_Badges) avgsilver, 
    MAX(Silver_Badges) maxsilver, 
    MIN(Bronze_Badges) minbronze,
    AVG(Bronze_Badges) avgbronze,
    MAX(Bronze_Badges) maxbronze
from {{ ref('qa_combined_answered') }} x inner join {{ ref('users_combined') }} y on x.answer_owner_user_id=y.id