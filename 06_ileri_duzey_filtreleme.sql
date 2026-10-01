-- 1. Soru: İptal edilen ve belirli ciro aralığındaki siparişlerin analizi (500 - 600 arası)

select order_id, customer_name,net_sales,delivery_status
from Sales
where delivery_status = 'Cancelled' and net_sales between 500 and 600
order by net_sales desc

-- 2. Soru: Müşteri yorumlarında olumlu geri bildirim içeren ('Good' veya 'Satisfied') siparişlerin listelenmesi

select order_id,customer_name,customer_rating,customer_review
from Sales
where customer_review like('%good%') or customer_review like ('%satisfied%')

-- 3. Soru: Kart dışı alternatif yöntemlerle (PayPal, Digital Wallet vb.) ödenen ilk 15 sipariş

select top 15 order_id,customer_city,payment_method,net_sales
from Sales
where payment_method not in ('Debit Card','Credit Card')




