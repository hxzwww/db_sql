with members_copy as (select firstname,
                             surname,
                             memid
                      from cd.members)
select concat(firstname, ' ', surname) as member,
       case
           when recommendedby is null then null
           else (select concat(firstname, ' ', surname)
                 from members_copy
                 where members_copy.memid = members.recommendedby)
           end                         as recommender
from cd.members
order by member