with recursive fibon(a, b, n) as (values (1::numeric, 1::numeric, 0)
                                  union
                                  select b,
                                         a + b,
                                         n + 1
                                  from fibon
                                  where n < 99)
select n as nth,
       a as value
from fibon;
