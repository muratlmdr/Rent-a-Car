-- M��terilerin hangi tarihlerde kiralad���n� g�steren sorgu --
select * from AKiralama.Musteri left join AKiralama.Kiralama on AKiralama.Musteri.MusteriNo = AKiralama.Kiralama.MusteriNo

-- Hangi marka ara�lar�n hangi tarihlerde teslim edildi�ini g�steren sorgu --
select * from AKiralama.Arac right join AKiralama.Kiralama on AKiralama.Arac.AracPlakaNo = AKiralama.Kiralama.AracPlakaNo

-- M��terilerin ara� plakalar�n� ve kira numaralar�n� g�steren sorgu --
select k.MusteriNo, KiraNo, a.AracPlakaNo 
from AKiralama.Musteri k
inner join AKiralama.Kiralama 
on k.MusteriNo = AKiralama.Kiralama.MusteriNo
inner join AKiralama.Arac a
on AKiralama.Kiralama.AracPlakaNo = a.AracPlakaNo

-- M��terilerin sahip oldu�u ehliyet t�r�n� g�steren sorgu  --
select EhliyetTuru from AKiralama.Ehliyet
union all
select EhliyetTuru from AKiralama.Musteri


-- En �ok tercih edilen modellerin listelendi�i sorgu --
select Model from AKiralama.Arac
intersect 
select Model from AKiralama.Kiralama


-- Kiralama listesinde modeli g�z�kmeyen ara�lar�n listesi --
select Model from  AKiralama.Arac
except
select Model from AKiralama.Kiralama


-- Runealt marka ara�lar�n yeni serisi geldi�i i�in listede de y�l� g�ncelleyen sorgu --
update AKiralama.Arac set �retimYili='2021-01-01' where Marka='Renault'

-- Kiralama listesinde modeli ve kira bedeli eksik olan arac�n bilgilerini ekleyen sorgu --
update AKiralama.Kiralama set Model='3.20', KiraBedeli=400 where MusteriNo=4

-- Kira bedeli olmayan ara�lar�n kiralar�n�n g�ncellendi�i sorgu --
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=303
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=304
update AKiralama.Arac set KiraBedeli=400 where AracPlakaNo=307

-- Hangi marka ara�tan ka� tane oldu�unu g�steren sorgu --
select Marka, Count(*) from AKiralama.Arac group by Marka

-- Ara�lar�n kira bedellerini g�steren ve hangi ara�tan ka� tane kiraland���n� g�steren sorgu --
select Model,KiraBedeli, count(KiraBedeli) from AKiralama.Kiralama group by Model, KiraBedeli 

-- Koltuk Say�s�na g�re kira bedellerini g�steren sorgu --
select KoltukSayisi,KiraBedeli from Akiralama.Arac group by KoltukSayisi, KiraBedeli


-- Haz�r fonksiyonlar--
select avg(KiraBedeli) as KiraOrt from AKiralama.Kiralama
select sum(MusteriNo) as M�steriNoToplamlar� from AKiralama.Musteri where EhliyetTuru='B1'
select max(KiraBedeli) as EnY�ksekKira from AKiralama.Kiralama
select min(KiraBedeli) as EnD���kKira from AKiralama.Kiralama where KiraBedeli!=0
select len(Ad + Soyad) as Ad�Soyad�Uzunlu�u from AKiralama.Musteri
select distinct Ad from AKiralama.Musteri where Ad like 'm%'
select count(MusteriNo) as MusteriSay�s� from AKiralama.Musteri 
select Model,KiraBedeli, count(KiraBedeli) from AKiralama.Kiralama group by Model, KiraBedeli 
select Marka, Count(*) from AKiralama.Arac group by Marka
select len(Marka + Model) as MarkaModelUzunlu�u from AKiralama.Arac




create unique index Araclar
on AKiralama.Arac (AracPlakaNo, Marka, Model, �retimYili, KoltukSayisi, KiraBedeli);


create nonclustered index Markalar on AKiralama.Arac(Marka)

-- Olu�mad� ��zemedim -- 
create clustered index Ehliyetler 
on AKiralama.Ehliyet(MusteriNo, Ad, Soyad, Adres, Telefon,EhliyetTuru)


-- Y�zde alma fonksiyonu --
create function y�zdealma(@sayi1 int,@sayi2 int)
returns int
begin
	declare @ret int;
set @ret=(@sayi1*@sayi2)/100
	return @ret;
end;


select dbo.y�zdealma(10,30)










