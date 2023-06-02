select
    recommendedby,
    count(memid)
from cd.members
where (recommendedby is not null)
group by recommendedby
order by recommendedby
;