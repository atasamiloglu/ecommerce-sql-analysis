-- 1. Soru: Reytingi 35 ve üstü, satışı 7e16 ve üstü müşterilerin isimleri ve sipariş numaraları

create procedure sp_GetHighValueOrdersByRating(@MinRating int,@MinSales float)
as
select order_id,customer_name,customer_rating,net_sales
from Sales
where customer_rating >= @MinRating
and
net_sales >= @MinSales
order by net_sales desc
go

exec sp_GetHighValueOrdersByRating 35,7E16
go

-- 2.Soru: Kullanıcı parametre belirtmezse varsayılan değerleri kullanır;
-- parametre verilirse girilen değerlerle çalışır.

create procedure GetOrdersByCityOrDefault(@City nvarchar(50) = 'Reyesview',@TopLimit INT = 5)
as
begin
select top (@TopLimit) order_id,customer_name,customer_city,net_sales
from Sales
where customer_city = @City
order by net_sales desc
end
go

exec GetOrdersByCityOrDefault 
exec GetOrdersByCityOrDefault @City = 'Ginaport', @TopLimit = 3;
go

-- 3.Soru : OUTPUT Parametreleri ile Şehir Bazlı Satış Özeti

create procedure sp_GetCitySalesSummary(
@City nvarchar(50),
@TotalSales float output,
@OrderCount int output
)
as
begin
select 
	@TotalSales = sum(net_sales),
	@OrderCount = count(*)
from Sales
where customer_city = @City
end
go

declare @GelenCiro float,@GelenAdet int
exec sp_GetCitySalesSummary 
	@City = 'Boyerland',
	@TotalSales = @GelenCiro output,
	@OrderCount = @GelenAdet output

print '--- ŞEHİR SATIŞ ÖZETİ ---'
print 'Toplam Sipariş Adedi : ' + cast(@GelenAdet as varchar(10))
print 'Toplam Net Satış : ' + cast(@GelenCiro as varchar(30))










