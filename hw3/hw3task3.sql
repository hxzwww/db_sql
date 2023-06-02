with firstly as (select memid,
                        round(sum(slots) / 2, -1) as hours
                 from cd.bookings
                 group by memid),
     secondly as (select firstname,
                         surname,
                         (select hours
                          from firstly
                          where members.memid = firstly.memid) as hours
                  from cd.members)
select
    *,
    rank() over (order by -hours) as rank
from secondly
order by rank, surname, firstname
;
