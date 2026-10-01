-- 1. Soru: Toplam sipariş hacmini kontrol edip duruma göre mesaj yazdırma

declare @ToplamSiparis int
select @ToplamSiparis = count(*) 
from Sales

if (@ToplamSiparis > 1000)
begin
print 'Sistemde yeterli sipariş verisi mevcut. Toplam sipariş: ' + cast (@ToplamSiparis as varchar(50))
end
else
begin
print 'Sipariş sayısı kritik eşiğin altında'
end

-- 2. Soru: İptal edilen sipariş eşiğine göre uyarı mesajı ve detaylı liste getirme

declare @IptalSayisi int

select @IptalSayisi = count(*) 
from Sales
where delivery_status = 'Cancelled'

if @IptalSayisi > 50
begin
print 'DİKKAT: İptal oranı yüksek' select top 5 order_id,customer_name,net_sales
from Sales WHERE delivery_status = 'Cancelled';
end
else
begin 
print 'İptal oranları kabul edilebilir seviyede.'
end

-- 3. Soru: Müşteri memnuniyetini ortalama puana göre ELSE IF ile kademeli değerlendirme

declare @OrtalamaPuan decimal(5,2)
select @OrtalamaPuan = avg(cast(customer_rating as decimal(5,2))) from Sales

if(@OrtalamaPuan >= 40)
begin
print 'Müşteri memnuniyeti çok yüksek. Ortalama : ' + cast(@OrtalamaPuan as varchar(20))
end

else if(@OrtalamaPuan >=30)
begin
print 'Müşteri memnuniyeti orta seviyede. İyileştirme yapılabilir. Ortalama : ' + cast(@OrtalamaPuan as varchar(20))
end

else
begin
print 'Müşteri memnuniyeti kritik seviyede düşük!'
end

