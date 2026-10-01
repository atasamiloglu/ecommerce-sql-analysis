-- 1. Soru: Ortalamanın üzerinde ciro getiren ilk 10 sipariş

select top 10 order_id,customer_name,net_sales
from Sales
where net_sales > (select avg(net_sales) from Sales)
order by net_sales desc

-- 2. Soru: En çok harcama yapan müşterinin tüm siparişleri

select customer_id,order_id,order_date,net_sales,payment_method
from Sales
where customer_id = (select top 1 customer_id from Sales
group by customer_id
order by sum(net_sales) desc)

-- 3. Soru: En düşük toplam kâra sahip ilk 2 segmente ait siparişler

select order_id,customer_segment,net_sales,profit
from Sales
where customer_segment in (select top 2 customer_segment from Sales
group by customer_segment
order by sum(profit))



