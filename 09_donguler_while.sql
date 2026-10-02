-- 1. Soru: Kademeli olarak ilk 1, ilk 2 ve ilk 3 siparişi getiren döngü

declare @Limit int
set @Limit = 1

while(@Limit <= 3)
begin
print '--- EN YÜKSEK CİROLU İLK ' + CAST(@Limit AS VARCHAR) + ' SİPARİŞ ---'
select top(@Limit) order_id,customer_name,net_sales
from Sales
order by net_sales desc

set @Limit = @Limit + 1
end

-- 2. Soru: Kümülatif Kâr Eşiği Kontrolü ve Erken Çıkış (BREAK)

DECLARE @KumeKar FLOAT = 0.0;
DECLARE @Sira INT = 1;
DECLARE @GuncelKar FLOAT;

WHILE (@Sira <= 20)
BEGIN
    SELECT @GuncelKar = profit
    FROM Sales
    ORDER BY profit DESC
    OFFSET (@Sira - 1) ROWS FETCH NEXT 1 ROWS ONLY;

    SET @KumeKar = @KumeKar + @GuncelKar;

    IF (@KumeKar >= 1000.0)
    BEGIN
        PRINT 'Hedef 1000 kâr eşiğine ' + CAST(@Sira AS VARCHAR(10)) + '. siparişte ulaşıldı! Toplam Kâr: ' + CAST(ROUND(@KumeKar, 2) AS VARCHAR(30));
        BREAK;
    END;

    SET @Sira = @Sira + 1;
END;



-- 3. Soru: 30-40 aralığındaki puanlarda 35 altını CONTINUE ile atlayıp yüksek puanları sayma

declare @Puan int = 29;
declare @SiparisSayisi int;

while (@Puan < 40)
begin
    set @Puan = @Puan + 1;
    if (@Puan < 35)
    begin
        continue;
    end

    select @SiparisSayisi = count(*) 
    from Sales 
    where customer_rating = @Puan;

    print CAST(@Puan as varchar(5)) + ' puan alan sipariş sayısı: ' + cast(@SiparisSayisi AS VARCHAR(10));
end;

