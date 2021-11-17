use [CustomerLib_Semenkov]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE CustomerCreate
	@Last_Name nvarchar(50)
	, @First_Name nvarchar(50) = null
	, @Phone_Number nvarchar(15) = null
	, @Email nvarchar(40) = null
	, @Notes  nvarchar(max)
	, @Total_Purchases_Amount money = null
AS
BEGIN
	SET NOCOUNT ON;
	insert into [Customers] ([First Name], [Last Name], [Phone Number], Email, Notes, [Total Purchases Amount])
	values (@Last_Name, @First_Name, @Phone_Number, @Email, @Notes, @Total_Purchases_Amount)
END

GO
CREATE PROCEDURE CustomerUpdate
	@Customer_Id int
	, @Last_Name nvarchar(50)
	, @First_Name nvarchar(50) = null
	, @Phone_Number nvarchar(15) = null
	, @Email nvarchar(40) = null
	, @Notes  nvarchar(max)
	, @Total_Purchases_Amount money = null
AS
BEGIN
	SET NOCOUNT ON;
	update [Customers] 
	set [Last Name] = @Last_Name, [First Name] = @First_Name, [Phone Number] = @Phone_Number, Email = @Email, Notes = @Notes, [Total Purchases Amount] = @Total_Purchases_Amount
	where CustomerId = @Customer_Id
END

GO
CREATE PROCEDURE CustomerRead
	@Customer_Id int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [Customers] 
	where CustomerId = @Customer_Id
END

GO
CREATE PROCEDURE CustomerDelete
	@Customer_Id int
AS
BEGIN
	SET NOCOUNT ON;
	Delete from [Customers]
	where CustomerId = @Customer_Id
END
GO