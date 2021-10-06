-- Müþterilerin hangi tarihlerde kiraladýðýný gösteren sorgu --
select * from AKiralama.Musteri left join AKiralama.Kiralama on AKiralama.Musteri.MusteriNo = AKiralama.Kiralama.MusteriNo

-- Hangi marka araçlarýn hangi tarihlerde teslim edildiðini gösteren sorgu --
select * from AKiralama.Arac right join AKiralama.Kiralama on AKiralama.Arac.AracPlakaNo = AKiralama.Kiralama.AracPlakaNo

-- Müþterilerin araç plakalarýný ve kira numaralarýný gösteren sorgu --
select k.MusteriNo, KiraNo, a.AracPlakaNo 
from AKiralama.Musteri k
inner join AKiralama.Kiralama 
on k.MusteriNo = AKiralama.Kiralama.MusteriNo
inner join AKiralama.Arac a
on AKiralama.Kiralama.AracPlakaNo = a.AracPlakaNo

-- Müþterilerin sahip olduðu ehliyet türünü gösteren sorgu  --
select EhliyetTuru from AKiralama.Ehliyet
union all
select EhliyetTuru from AKiralama.Musteri


-- En çok tercih edilen modellerin listelendiði sorgu --
select Model from AKiralama.Arac
intersect 
select Model from AKiralama.Kiralama


-- Kiralama listesinde modeli gözükmeyen araçlarýn listesi --
select Model from  AKiralama.Arac
except
select Model from AKiralama.Kiralama


-- Runealt marka araçlarýn yeni serisi geldiði için listede de yýlý güncelleyen sorgu --
update AKiralama.Arac set ÜretimYili='2021-01-01' where Marka='Renault'

-- Kiralama listesinde modeli ve kira bedeli eksik olan aracýn bilgilerini ekleyen sorgu --
update AKiralama.Kiralama set Model='3.20', KiraBedeli=400 where MusteriNo=4

-- Kira bedeli olmayan araçlarýn kiralarýnýn güncellendiði sorgu --
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=303
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=304
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=307

-- Hangi marka araçtan kaç tane olduðunu gösteren sorgu --
select Marka, Count(*) from AKiralama.Arac group by Marka

-- Araçlarýn kira bedellerini gösteren ve hangi araçtan kaç tane kiralandýðýný gösteren sorgu --
select Model,KiraBedeli, count(KiraBedeli) from AKiralama.Kiralama group by Model, KiraBedeli 

-- Koltuk Sayýsýna göre kira bedellerini gösteren sorgu --
select KoltukSayisi,KiraBedeli from Akiralama.Arac group by KoltukSayisi, KiraBedeli


-- Hazýr fonksiyonlar--
select avg(KiraBedeli) as KiraOrt from AKiralama.Kiralama
select sum(MusteriNo) as MüsteriNoToplamlarý from AKiralama.Musteri where EhliyetTuru='B1'
select max(KiraBedeli) as EnYüksekKira from AKiralama.Kiralama
select min(KiraBedeli) as EnDüþükKira from AKiralama.Kiralama where KiraBedeli!=0
select len(Ad + Soyad) as AdýSoyadýUzunluðu from AKiralama.Musteri
select distinct Ad from AKiralama.Musteri where Ad like 'm%'
select count(MusteriNo) as MusteriSayýsý from AKiralama.Musteri 
select Model,KiraBedeli, count(KiraBedeli) from AKiralama.Kiralama group by Model, KiraBedeli 
select Marka, Count(*) from AKiralama.Arac group by Marka
select len(Marka + Model) as MarkaModelUzunluðu from AKiralama.Arac




create unique index Araclar
on AKiralama.Arac (AracPlakaNo, Marka, Model, ÜretimYili, KoltukSayisi, KiraBedeli);


create nonclustered index Markalar on AKiralama.Arac(Marka)

-- Oluþmadý çözemedim -- 
create clustered index Ehliyetler 
on AKiralama.Ehliyet(MusteriNo, Ad, Soyad, Adres, Telefon,EhliyetTuru)


-- Yüzde alma fonksiyonu --
create function yüzdealma(@sayi1 int,@sayi2 int)
returns int
begin
	declare @ret int;
set @ret=(@sayi1*@sayi2)/100
	return @ret;
end;


select dbo.yüzdealma(10,30)










