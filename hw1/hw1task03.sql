with bmi_list as (select (weight / 2.2046) / (height * 0.0254)^2 as bmi from hw) select count(bmi) as underweight_count from bmi_list where bmi < 18.5;
