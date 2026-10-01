-- 1. Soru: Sipariş adedi 1000'den büyük satış kanalları

select sales_channel,count(*) as total_orders
from Sales
group by sales_channel
having count(*) >  1000

-- 2. Soru: Teslimat durumuna göre ortalama teslimat günleri

select delivery_status,avg(delivery_days) as avg_delivery_days
from Sales
group by delivery_status
order by avg(delivery_days) desc

-- 3. Soru: Kârlılık durumuna göre sipariş sınıflandırması (İlk 20)

select top 20 order_id,net_sales,profit,
case 
when profit > 0 then 'Profitable'
when profit = 0 then 'Break-Even'
when profit < 0 then 'Loss'
end as profit_status
from Sales
order by order_date desc, order_time desc








