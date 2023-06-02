with mems as (select firstname     as memfname,
                     surname       as memsname,
                     recommendedby as recid
              from cd.members),
     recs as (select firstname as recfname,
                     surname   as recsname,
                     memid
              from cd.members)
select memfname,
       memsname,
       recfname,
       recsname
from mems
         left join recs on mems.recid = recs.memid
order by memsname, memfname


