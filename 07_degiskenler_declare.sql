-- 1. Soru: Belirli bir ciro eşiğini değişken olarak tanımlayıp üstündeki siparişleri filtreleme

declare @HedefCiro decimal(18,2)
set @HedefCiro = 500

select order_id,customer_name,net_sales
from Sales
where net_sales > @HedefCiro

-- 2. Soru: Şirket genel ortalama cirosunu değişkene atayıp ortalamanın üstündeki ilk 10 satışı getirme

declare @OrtalamaCiro decimal(18,2)
set @OrtalamaCiro = (select avg(net_sales) from Sales)

select top 10 order_id,customer_name,net_sales
from Sales
where net_sales > @OrtalamaCiro
order by net_sales desc

-- 3. Soru: Şehir ve minimum puan parametrelerini değişken olarak tanımlayıp dinamik filtreleme

declare @ArananSehir varchar(15)
set @ArananSehir = 'New Michaelton'

declare @MinPuan int
set @MinPuan = 36

select order_id,customer_city,customer_rating,net_sales
from Sales
where customer_city = @ArananSehir and customer_rating > @MinPuan



