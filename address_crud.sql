use [CustomerLib_Semenkov]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE AddressCreate
	@CustomerId int
	, @Address_Line nvarchar (100)
	, @Address_Line2 nvarchar (100) = null
	, @Address_Type nvarchar (8)
	, @City nvarchar (100)
	, @Postal_Code nvarchar (6)
	, @State nvarchar (15)
	, @Country nvarchar (14)
AS
BEGIN
	SET NOCOUNT ON;
	insert into [Addresses] (CustomerId, [Address Line], [Address Line2 ], [Address Type], City, [Postal Code], [State], [Country])
	values (@CustomerId, @Address_Line, @Address_Line2, @Address_Type, @City, @Postal_Code, @State, @Country)
END

GO
CREATE PROCEDURE AddressUpdate
	@AddressId int
	, @CustomerId int
	, @Address_Line nvarchar (100)
	, @Address_Line2 nvarchar (100) = null
	, @Address_Type nvarchar (8)
	, @City nvarchar (100)
	, @Postal_Code nvarchar (6)
	, @State nvarchar (15)
	, @Country nvarchar (14)
AS
BEGIN
	SET NOCOUNT ON;
	update [Addresses] 
	set CustomerId = @CustomerId, [Address Line] = @Address_Line, [Address Line2 ] = @Address_Line2, [Address Type] = @Address_Type, 
		City = @City, [Postal Code] = @Postal_Code, [State] = @State, [Country] = @Country
	where AddressId = @AddressId
END

GO
CREATE PROCEDURE AddressRead
	@AddressesId int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [Addresses] 
	where AddressesId = @AddressesId
END

GO
CREATE PROCEDURE AddressDelete
	@AddressesId int
AS
BEGIN
	SET NOCOUNT ON;
	Delete from [Addresses]
	where AddressesId = @AddressesId
END
GO