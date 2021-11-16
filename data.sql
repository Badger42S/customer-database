insert into [Customers] ([First Name], [Last Name], [Phone Number], Email, Notes, [Total Purchases Amount])
values ('Fedor', 'Popov', '+10000000000009', 'sdf@gmsil.cow', 'Some text', 55)

insert into [Customers] ([Last Name], Notes)
values ('Levop', 'Some text')

declare @Customer_id_for_address int;
set @Customer_id_for_address = (select top 1 CustomerId from [Customers])
insert into [Adresses] (CustomerId, [Address Line], [Address Line2 ], [Address Type], City, [Postal Code], [State], Country)
values (@Customer_id_for_address, 'first line', 'second line', 'Shipping', 'Toronto', 'm9m', 'Ontario', 'Canada')

set @Customer_id_for_address = @Customer_id_for_address + 1
insert into [Adresses] (CustomerId, [Address Line], [Address Type], City, [Postal Code], [State], Country)
values (@Customer_id_for_address, 'first line',  'Billing', 'Toronto', 'm9m', 'Ontario', 'Canada')

insert into [Customers] ([First Name], [Last Name], [Phone Number], Email, Notes, [Total Purchases Amount])
values ('Fedor', 'Popov', '+1000000000000', 'sdf@gmsilcow', 'jh', 55)