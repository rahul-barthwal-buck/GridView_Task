/*Author name: Rahul Barthwal*/
/*Objective: Creation of Stored Procedure for User Register*/

USE [GridView_Task]
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 1/13/2022 6:05:41 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Register]
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 1/13/2022 6:05:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Register]
@UserName NVARCHAR(20),
@Password NVARCHAR(20)
AS 
BEGIN
	BEGIN TRY
		INSERT INTO tbl_User(UserName,Password) VALUES(@UserName,@Password)
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
