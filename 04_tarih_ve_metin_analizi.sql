-- 1. Soru: Yıl ve ay bazında toplam ciro analizi

select datepart(year,order_date) as order_year,datepart(month,order_date) as order_month,
sum(net_sales) as total_revenue
from Sales
group by datepart(year,order_date),datepart(month,order_date)
order by order_year,order_month

-- 2. Soru: Müşteri isim formatı ve karakter uzunluğu analizi

select top 15 upper(customer_name) as customer_name_upper,len(customer_name) as name_length
from Sales
where customer_type = 'New'

-- 3. Soru: Teslimat gecikmelerinin analizi (İlk 10)

select top 10 order_id,customer_name,delivery_days,estimated_delivery_days,
delivery_days - estimated_delivery_days as delivery_delay_days
from Sales
where delivery_days > estimated_delivery_days
order by delivery_delay_days desc




		
