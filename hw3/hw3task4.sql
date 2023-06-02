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
                       ntile(3) over (
                           order by cost desc
                           )                                    as revenue
                from grouped)
select name,
       case
           when revenue = 1 then
               'high'
           when revenue = 2 then
               'average'
           else
               'low'
           end as revenue
from ntiled
order by ntiled.revenue, name
;
