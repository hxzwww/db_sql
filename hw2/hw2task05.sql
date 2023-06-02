with mems as (select surname,
                     firstname,
                     memid
              from cd.members),
     books as (select memid,
                      starttime
               from cd.bookings)
select surname,
       firstname,
       m.memid,
       min(starttime) as starttime
from mems m
         join books b on m.memid = b.memid
where date(starttime) >= '2012-09-01'
group by m.memid, firstname, surname
order by memid





