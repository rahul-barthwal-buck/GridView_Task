/*Author name: Rahul Barthwal*/
/*Objective: Creation of Resgiter user Stored Procedure*/

USE [GridView_Task]
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 1/14/2022 6:49:48 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Register]
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 1/14/2022 6:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Register]
@UserName NVARCHAR(20),
@Email NVARCHAR(38),
@Password NVARCHAR(16)
AS 
BEGIN
	BEGIN TRY
		INSERT INTO tbl_User(UserName,Email,Password) VALUES(@UserName,@Email,@Password)
	END TRY
	BEGIN CATCH
		DECLARE @ErrorNumber    INT          = ERROR_NUMBER()
		DECLARE @ErrorMessage   NVARCHAR(50) = ERROR_MESSAGE()
		DECLARE @ErrorProcedure NVARCHAR(50) = ERROR_PROCEDURE()
		DECLARE @ErrorState     INT          = ERROR_STATE()
		DECLARE @ErrorSeverity  INT          = ERROR_SEVERITY()
		DECLARE @ErrorLine      INT          = ERROR_LINE()
		RAISERROR ('Error Details: ErrorNumber: %d, ErrorMessage: %s, ErrorProcedure: %s, ErrorState: %d, ErrorSeverity: %d,ErrorLine: %d,',16,1,@Errornumber,@ErrorMessage,@ErrorProcedure,@ErrorState,@ErrorSeverity,@ErrorLine)
	END CATCH
END
GO
