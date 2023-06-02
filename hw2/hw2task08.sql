with ten_owners as (select distinct memid, facid
                    from cd.bookings
                    where facid in (select facid
                                    from cd.facilities
                                    where name like 'Tennis Court%'))
select
    concat(cm.firstname, ' ', cm.surname) as member,
    (select
         name
     from cd.facilities
     where tow.facid = facilities.facid) as facility
from cd.members cm
         join ten_owners tow on cm.memid = tow.memid
order by member, facility


