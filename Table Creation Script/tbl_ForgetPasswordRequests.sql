/*Author name: Rahul Barthwal*/
/*Objective: Creation of ForgetPassword request table*/

USE [GridView_Task]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ForgetPasswordRequests]') AND type in (N'U'))
ALTER TABLE [dbo].[tbl_ForgetPasswordRequests] DROP CONSTRAINT IF EXISTS [FK_User]
GO
/****** Object:  Table [dbo].[tbl_ForgetPasswordRequests]    Script Date: 1/14/2022 6:39:20 PM ******/
DROP TABLE IF EXISTS [dbo].[tbl_ForgetPasswordRequests]
GO
/****** Object:  Table [dbo].[tbl_ForgetPasswordRequests]    Script Date: 1/14/2022 6:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ForgetPasswordRequests](
	[Id] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[RequestDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_ForgetPasswordRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_ForgetPasswordRequests]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([UserId])
GO
ALTER TABLE [dbo].[tbl_ForgetPasswordRequests] CHECK CONSTRAINT [FK_User]
GO
