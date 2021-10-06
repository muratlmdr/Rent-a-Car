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

