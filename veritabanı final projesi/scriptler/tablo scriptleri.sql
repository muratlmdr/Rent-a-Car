create database GunsteR_Final

create schema AKiralama


create table AKiralama.Sube
(
	SatýsYerNo int identity(1,1) primary key,
	Adres ntext,
	Telefon varchar(100) not null,
)



create table AKiralama.Arac
(
	AracPlakaNo varchar(10) primary key,
	Marka varchar(15) Not null,
	Model varchar(15),
	ÜretimYili date ,
	KoltukSayisi smallint not null,
	KiraBedeli money,
	SatýsYerNo int foreign key references AKiralama.Sube (SatýsYerNo)
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
	AlimGün smalldatetime not null,
	TeslimEdilenGün smalldatetime not null,
	Adres ntext,
	Model varchar(15),
	KiraBedeli money,
	MusteriNo int foreign key references Akiralama.Musteri (MusteriNo),
	AracPlakaNo varchar(10) foreign key references AKiralama.Arac(AracPlakaNo)
	
)
