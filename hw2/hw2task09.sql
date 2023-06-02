with books as (select memid,
                      (select name
                       from cd.facilities
                       where bookings.facid = facilities.facid)         as facility,
                      (select case
                                  when memid = 0 then guestcost
                                  else membercost
                                  end
                       from cd.facilities
                       where bookings.facid = facilities.facid) * slots as cost
               from cd.bookings
               where date(starttime) = '2012-09-14'),
     high_cost_books as (select memid,
                                facility,
                                cost
                         from books
                         where cost > 30)
select
    (select concat(firstname, ' ', surname)
     from cd.members
     where high_cost_books.memid = members.memid) as member,
    facility,
    cost
from high_cost_books
order by cost desc, member, facility





