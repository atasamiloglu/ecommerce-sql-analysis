--1.Soru : Kar Oranını fonksiyon yardımı ile bulma
create function karOrani(@verilenKod varchar(50))
returns decimal(5,2)
as
begin
	declare @Kar float
	declare @Satis float
	declare @Oran decimal(5,2)

select 
	@Kar = profit,
	@Satis = net_sales
from Sales
where order_id = @verilenKod

set @Oran = cast((@Kar / nullif(@Satis,0)) * 100 as decimal (5,2))

return @Oran
end
go

-- 2.Soru : İstenilen şehirden kaç sipariş geldiğini fonksiyon ile bulma

create function fn_GetOrderCountByCity(@City nvarchar(50))
returns int
as
begin
	declare @ToplamAdet int
select
	@ToplamAdet = count(*)
	from Sales
	where customer_city = @City

return @ToplamAdet
end
go
select dbo.fn_GetOrderCountByCity('New Brettport') as [Sipariş Sayısı]
go

-- 3.Soru : Şehir Bazlı Sipariş Listesi (Table-Valued Function)

create function GetOrdersByCity(@City nvarchar(50))
returns table
as
return (
	select order_id,customer_name,net_sales,customer_rating
	from Sales
	where customer_city = @City
	)
	
go

select *
from dbo.GetOrdersByCity('North Kristin')
go



