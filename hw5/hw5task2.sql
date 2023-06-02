create or replace function serial_generator(start_val_inc integer, last_val_ex integer)
    returns table
            (
                serial_generator integer
            )
as
$$
declare
    cnt integer;
begin
    for cnt in start_val_inc..last_val_ex - 1
        loop
            serial_generator := cnt;
            return next;
        end loop;
end;
$$ language plpgsql;
