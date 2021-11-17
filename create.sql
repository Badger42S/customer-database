use [master]
create database [Customer Database]
go
use [Customer Database]
create table [Customers]
(
	CustomerId int identity(1,1) not null constraint [Customer_Id] primary key clustered
	, [Last Name] nvarchar(50) not null
	, [First Name] nvarchar(50)
	, [Phone Number] nvarchar(15) 
	, Email nvarchar(40) 
	, Notes nvarchar(max) not null
	, [Total Purchases Amount] money
	, constraint phone_number_cc check ([Phone Number] like '+[1-9]'+ REPLICATE('[0-9]', 13))
	, constraint email_cc check (Email like '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%')
)
create table [Addresses]
(
	AdressId int identity(1,1) not null constraint [Adress_Id] primary key clustered
	, CustomerId int not null foreign key references Customers(CustomerId)
	, [Address Line] nvarchar(100) not null
	, [Address Line2 ] nvarchar(100) 
	, [Address Type] nvarchar(8) not null constraint address_type_cc check ([Address Type] in ('Shipping', 'Billing')) 
	, City nvarchar(100) not null
	, [Postal Code] nvarchar(6) not null
	, [State] nvarchar(15) not null
	, Country nvarchar(14) constraint country_cc check (Country in ('United States', 'Canada'))
)