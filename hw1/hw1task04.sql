with bmi_list as (
	select
		id,
		weight / 2.2046 / (height * 0.0254)^2 as bmi
	from hw
),
bmi_table as (
	select
		id,
		bmi,
		case
			when bmi < 18.5 then
				'underweight'
			when 18.5 <= bmi and bmi < 25 then
				'normal'
			when 25 <= bmi and bmi < 30 then
				'overweight'
			when 30 <= bmi and bmi < 35 then
				'obese'
			else
				'extremely obese'
		end as bmi_class
	from bmi_list
)
select
	id,
	bmi,
	bmi_class as type
from bmi_table
order by -bmi, id;
