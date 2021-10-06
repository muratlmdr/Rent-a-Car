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
