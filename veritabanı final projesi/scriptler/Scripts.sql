
-- Tablo scriptleri --

create database GunsteR_Final

create schema AKiralama


create table AKiralama.Sube
(
	Sat�sYerNo int identity(1,1) primary key,
	Adres ntext,
	Telefon varchar(100) not null,
)



create table AKiralama.Arac
(
	AracPlakaNo varchar(10) primary key,
	Marka varchar(15) Not null,
	Model varchar(15),
	�retimYili date ,
	KoltukSayisi smallint not null,
	KiraBedeli money,
	Sat�sYerNo int foreign key references AKiralama.Sube (Sat�sYerNo)
)

create table AKiralama.Ehliyet
(
	EhliyetTuru varchar(10)  primary key,
	SurucuLisansi varchar(10) 
)


create table AKiralama.Musteri
(
	MusteriNo int identity(1,1) primary key,
	Ad varchar(20) not null,
	Soyad varchar(20) not null,
	Adres ntext not null,
	Telefon varchar(10) not null,
	EhliyetTuru varchar(10) foreign key references AKiralama.Ehliyet (EhliyetTuru) 
)


create table AKiralama.Kiralama
(
	KiraNo int identity primary key,
	AlimG�n smalldatetime not null,
	TeslimEdilenG�n smalldatetime not null,
	Adres ntext,
	Model varchar(15),
	KiraBedeli money,
	MusteriNo int foreign key references Akiralama.Musteri (MusteriNo),
	AracPlakaNo varchar(10) foreign key references AKiralama.Arac(AracPlakaNo)
	
)



-- Insert scripleri --

insert into AKiralama.Sube (Adres,Telefon) values 
('Trabzon Havaliman�','4627170000'),
('Samsun Atakum','3628080000'),
('�stanbul Kad�k�y','2166120000'),
('�zmir �e�me','2328270000'),
('Antalya Kuru�ay','2428940000'),
('Adana Seyhan','3227410000'),
('Ankara Cebeci','3124560000'),
('','4627890000'),
('','2122080000'),
('Erzurum Merkez','4425160000')



insert into AKiralama.Arac (AracPlakaNo,Marka,Model,�retimYili,KoltukSayisi,KiraBedeli,Sat�sYerNo) values
('300','Renault','Symbol','2020','5','150','1'),
('301','Renault','Megan','2020','4','200','2'),
('302','Dacia','Sandero','2020','4','175','3'),
('303','BMW','','2020','4','','4'),
('304','Mercedes','','2020','4','','5'),
('305','Citroen','Berlingo','2020','5','250','6'),
('306','Fiat','Egea','2020','4','225','7'),
('307','Audi','','2020','4','','8'),
('308','Kia','Sportage','2020','5','450','9'),
('309','Hyundai','I20','2020','4','245','10')



insert into AKiralama.Ehliyet (EhliyetTuru,SurucuLisansi) values
('B1','Var')


insert into AKiralama.Musteri (Ad,Soyad,Adres,Telefon,EhliyetTuru) values
('U�ur','�ak�r','Trabzon','5382660000','B1'),
('�brahim','Adanur','Samsun','5350530000','B1'),
('Murat','Alemdar','�stanbul','5382790000','B1'),
('Halit','Sekban','�zmir','5414080000','B1'),
('Mustafa','Y�lmaz','Antalya','5530030000','B1'),
('Batuhan','Ayd�n','Adana','5415520000','B1'),
('Batuhan','�ebi','Ankara','5560980000','B1'),
('Bedirhan','Delimehmet','Trabzon','5428080000','B1'),
('Serkan','�elik','�stanbul','5367940000','B1'),
('M�cahit','�ak�r','Erzurum','5585940000','B1')


insert into AKiralama.Kiralama (AlimG�n,TeslimEdilenG�n,Adres,Model,KiraBedeli,MusteriNo,AracPlakaNo) values
('20210501 12:30:00','20210503 12:30:00','Trabzon Havaliman�','Symbol','150','1','300'),
('20210502 11:00:00','20210506 11:00:00','Samsun Atakum','Megan','200','2','301'),
('20210502 10:20:00','20210504 10:20:00','�stanbul Kad�k�y','','175','3','302'),
('20210504 14:25:00','20210509 14:25:00','�zmir �e�me','','','4','303'),
('20210401 12:15:00','20210403 12:15:00','Antalya Kuru�ay','','','5','304'),
('20210205 14:25:00','20210210 14:25:00','Adana Seyhan','Berlingo','250','6','305'),
('20210515 09:10:00','20210615 09:10:00','Ankara Cebeci','Egea','225','7','306'),
('20210604 08:15:00','20210608 08:15:00','Trabzon Havaliman�','','','8','307'),
('20210508 18:30:00','20210512 18:30:00','','Sportage','450','9','308'),
('20210101 21:00:00','20210106 21:00:00','','','245','10','309')





-- �stenilen t�m select scriptleri (3. maddenin tamam�) --

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










