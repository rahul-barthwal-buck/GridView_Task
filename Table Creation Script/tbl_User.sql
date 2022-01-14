/*Author name: Rahul Barthwal*/
/*Objective: Creation of User table*/

USE [GridView_Task]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 1/14/2022 6:42:27 PM ******/
DROP TABLE IF EXISTS [dbo].[tbl_User]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 1/14/2022 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](38) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 
GO
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password]) VALUES (1, N'Rahulbuck34', N'rahul.barthwal@buck.com', N'Rahul9876')
GO
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
