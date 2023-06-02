with
	selected as (
		SELECT
			upper(m.full_nm) as full_name,
			m.dt as dt,
			t.mx as price
		FROM (
    	SELECT
				full_nm,
				MAX(high_price) AS mx
    	FROM coins
    	GROUP BY full_nm
    	) t JOIN coins m ON m.full_nm = t.full_nm AND t.mx = m.high_price
	),
	aboba as (
		SELECT
			full_name,
			dt,
			price
		FROM selected
		order by -price, full_name
	),
	final as (
		select *
		from aboba a join (
			select
				full_name as flnm,
				min(dt) as dt1
			from aboba
			GROUP by full_name
		) b on a.full_name = b.flnm and a.dt = b.dt1
)
select full_name, dt, price from final
;
