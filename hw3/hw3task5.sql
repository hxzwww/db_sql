with books_costs as (select facid,
                            slots * (select case
                                                when bookings.memid = 0 then guestcost
                                                else membercost
                                                end
                                     from cd.facilities
                                     where bookings.facid = facilities.facid) as cost
                     from cd.bookings),
     grouped as (select facid,
                        sum(cost) as cost
                 from books_costs
                 group by facid),
     ntiled as (select (select name
                        from cd.facilities
                        where grouped.facid = facilities.facid) as name,
                       cost                                     as revenue
                from grouped)
select name,
       rank() over (order by revenue desc, name) as rank
from ntiled
limit 3



