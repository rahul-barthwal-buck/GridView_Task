/*Author name: Rahul Barthwal*/
/*Objective: Creation of PoductDetails table*/

USE [GridView_Task]
GO
/****** Object:  Table [dbo].[tbl_ProductDetails]    Script Date: 1/14/2022 6:41:02 PM ******/
DROP TABLE IF EXISTS [dbo].[tbl_ProductDetails]
GO
/****** Object:  Table [dbo].[tbl_ProductDetails]    Script Date: 1/14/2022 6:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductDetails](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Quantity_Per_Unit] [int] NOT NULL,
	[Unit_Price] [decimal](12, 2) NOT NULL,
	[Units_In_Stock] [int] NOT NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_ProductDetails] ON 
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (11, N'Realme X2 pro', 24, CAST(450.00 AS Decimal(12, 2)), 10)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (12, N'Realme Nazro 50A', 35, CAST(340.00 AS Decimal(12, 2)), 12)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (14, N'IPhone 13 mini', 34, CAST(1300.00 AS Decimal(12, 2)), 30)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (15, N'Oppo reno', 11, CAST(500.00 AS Decimal(12, 2)), 33)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (16, N'Nokia 123', 45, CAST(400.00 AS Decimal(12, 2)), 24)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (17, N'Nokia k234', 23, CAST(345.00 AS Decimal(12, 2)), 56)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (18, N'Micromax k10', 324, CAST(200.00 AS Decimal(12, 2)), 70)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (19, N'Samsung A31', 23, CAST(500.00 AS Decimal(12, 2)), 11)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (22, N'Poco X3', 23, CAST(400.00 AS Decimal(12, 2)), 25)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (27, N'Ipad Pro 2021', 32, CAST(1900.00 AS Decimal(12, 2)), 10)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (28, N'Asus ROG 3', 5, CAST(800.00 AS Decimal(12, 2)), 20)
GO
INSERT [dbo].[tbl_ProductDetails] ([Product_Id], [Name], [Quantity_Per_Unit], [Unit_Price], [Units_In_Stock]) VALUES (29, N'Oppo reno Z', 35, CAST(1500.00 AS Decimal(12, 2)), 27)
GO
SET IDENTITY_INSERT [dbo].[tbl_ProductDetails] OFF
GO
