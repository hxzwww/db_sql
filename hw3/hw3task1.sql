with firstly as (select dt,
                        sum(vol) as vol
                 from coins
                 group by dt)
select rank() over (order by -vol, dt) as rank,
       dt,
       vol
from firstly
limit 10;
