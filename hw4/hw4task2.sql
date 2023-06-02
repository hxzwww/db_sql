with recursive recs(memid, firstname, surname)
                   as (select memid,
                              firstname,
                              surname
                       from cd.members
                       where memid = 1
                       union all
                       select m.memid,
                              m.firstname,
                              m.surname
                       from recs r,
                            cd.members m
                       where m.recommendedby = r.memid)
select *
from recs
where memid != 1
order by memid;
