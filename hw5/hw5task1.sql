create or replace function count_non_volatile_days(full_nm TEXT) returns integer as
$$
    declare cnt integer;
begin

    if not exists(select 1 from coins where coins.full_nm = count_non_volatile_days.full_nm) then
        raise no_data_found using message = 'Crypto currency with name ' || full_nm || ' is absent in database!';
    end if;

    select count(1) into cnt from coins c where c.low_price = c.high_price and c.full_nm = $1;

    return cnt;
end;
$$ language plpgsql;
