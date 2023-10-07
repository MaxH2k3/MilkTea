/****** Object:  Database [MilkTeaDB]    Script Date: 7/8/2022 2:33:10 AM ******/
CREATE DATABASE [MilkTeaDB2]
Go
USE [MilkTeaDB2]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 7/8/2022 2:33:10 AM ******/
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/8/2022 2:33:10 AM ******/

CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) PRIMARY KEY,
	[name] [varchar](50) NOT NULL)

GO

/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/8/2022 2:33:10 AM ******/

CREATE TABLE [dbo].[tblUsers](
	[userID] [bigint] IDENTITY(1,1) PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
	[userName] [varchar](20) NOT NULL UNIQUE,
	[gender] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	FOREIGN KEY ([roleID]) REFERENCES [dbo].[tblRoles]([roleID])		
)

GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] [nvarchar](50) NOT NULL
)
GO

/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/8/2022 2:33:10 AM ******/
CREATE TABLE [dbo].[tblProducts](
	[productID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] [varchar](50) NOT NULL unique,
	[price] [float] NOT NULL,
	[image] [VARBINARY](MAX) NOT NULL,
	[categoryID] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[dateCreate] [DATE],
	FOREIGN KEY ([categoryID]) REFERENCES [dbo].[tblCategories]([categoryID])	
)

GO


/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/8/2022 2:33:10 AM ******/
CREATE TABLE [dbo].[tblOrders](
	[orderID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[userID] [bigint] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[total] [float] NOT NULL,
	FOREIGN KEY ([userID]) REFERENCES [dbo].[tblUsers]([userID])	
	)

GO

/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 7/8/2022 2:33:10 AM ******/
CREATE TABLE [Payment] (
	[paymentId] [int] IDENTITY(1,1) primary key,
	[method] [NVARCHAR](50) UNIQUE
)

CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailsID] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[orderID] [bigint] NOT NULL,
	[productID] [bigint] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[paymentId] [int] NOT NULL,
	FOREIGN KEY ([productID]) REFERENCES [dbo].[tblProducts]([productID]),
	FOREIGN KEY ([orderID]) REFERENCES [dbo].[tblOrders]([orderID]),
	FOREIGN KEY ([paymentId]) REFERENCES [dbo].[Payment]([paymentId])	
)

CREATE TABLE VOUCHER(
	[idVoucher] [char](50) primary key,
	[DateCreate] [Date],
	[DateEnd] [Date],
	[Amount] [int],
	[Discount] [int]
)

GO

SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([name]) VALUES (N'Trà')
INSERT [dbo].[tblCategories] ([name]) VALUES (N'Trà sữa')
INSERT [dbo].[tblCategories] ([name]) VALUES (N'Caffe')
INSERT [dbo].[tblCategories] ([name]) VALUES (N'Nước ép')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF



INSERT [dbo].[tblProducts] ([name], [price], [image], [categoryID], [status], [description]) VALUES (N'Matcha MilkTea', 70000, N'/images/matcha_milktea.png', 2, 1, N'So Good')
INSERT [dbo].[tblProducts] ([name], [price], [image], [categoryID], [status], [description]) VALUES (N'Olong Tea', 45000, N'/images/olong_tea.png', 1, 1, N'Nice')
INSERT [dbo].[tblProducts] ([name], [price], [image], [categoryID], [status], [description]) VALUES (N'LongThanh Milk 100% Fresh', 35000, N'/images/longthanh_milk.png', 3, 1, N'So Fresh')
INSERT [dbo].[tblProducts] ([name], [price], [image], [categoryID], [status], [description]) VALUES (N'100% Fresh', 35000, N'/images/longthanh_milk.png', 3, 1, N'So Fresh')



INSERT [dbo].[tblRoles] ([name]) VALUES (N'ADMIN')
INSERT [dbo].[tblRoles] ([name]) VALUES (N'USER')


INSERT [dbo].[tblUsers] ([name], [phone], [address], [email], [roleID], [password], [userName], [status], [gender]) VALUES (N'customer 1', N'123123123', N'123 HCM', N'cus1@gmail.com', 2, N'123', N'customer1', 1, 1)
INSERT [dbo].[tblUsers] ([name], [phone], [address], [email], [roleID], [password], [userName], [status], [gender]) VALUES (N'customer 2', N'123132123', N'121 HCM', N'cus2@gmail.com', 2, N'123', N'customer2', 1, 1)
INSERT [dbo].[tblUsers] ([name], [phone], [address], [email], [roleID], [password], [userName], [status], [gender]) VALUES (N'admin', N'111111111', N'123 CT', N'admin@gmail.com', 1, N'123', N'admin', 1, 0)



GO


INSERT INTO Payment(method)
VALUES ('Money'),
('Momo'),
('Bank')

-- Example 1
INSERT INTO [tblProducts] (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 11', 10.99, 'image1.jpg', 1, 1, 'Description 1', GETDATE());

-- Example 2
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 2', 19.99, 'image2.jpg', 2, 1, 'Description 2', GETDATE());

-- Example 3
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 3', 8.49, 'image3.jpg', 1, 1, 'Description 3', GETDATE());

-- Example 4
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 4', 12.79, 'image4.jpg', 2, 1, 'Description 4', GETDATE());

-- Example 5
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 5', 15.99, 'image5.jpg', 3, 1, 'Description 5', GETDATE());

-- Example 6
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 6', 7.99, 'image6.jpg', 3, 1, 'Description 6', GETDATE());

-- Example 7
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 7', 24.99, 'image7.jpg', 1, 1, 'Description 7', GETDATE());

-- Example 8
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 8', 18.29, 'image8.jpg', 2, 1, 'Description 8', GETDATE());

-- Example 9
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 9', 6.99, 'image9.jpg', 3, 1, 'Description 9', GETDATE());

-- Example 10
INSERT INTO tblProducts (name, price, image, categoryID, status, description, dateCreate)
VALUES ('Product 10', 14.49, 'image10.jpg', 1, 1, 'Description 10', GETDATE());


INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('VOUCHER123', '2023-08-01', '2023-08-31', 20, 5);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('DISCOUNT50', '2023-07-15', '2023-12-31', 10, 13);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('SUMMERDEAL', '2023-06-10', '2023-09-10', 5, 12);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('SALE2023', '2023-01-01', '2023-12-31', 0, 1);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('EARLYBIRD', '2023-09-01', '2023-09-15', 1, 20);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('EARLYBIRD', '2023-09-01', '2023-01-15', 1, 20);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('EARLYBIRD', '2023-09-01', '2023-05-7', 1, 20);

INSERT INTO VOUCHER (idVoucher, DateCreate, DateEnd, Amount, Discount)
VALUES ('oke123', '2023-07-15', '2023-12-31', 10, 13);





