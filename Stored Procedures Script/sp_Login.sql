/*Author name: Rahul Barthwal*/
/*Objective: Creation of Login Stored Procedure*/

USE [GridView_Task]
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 1/14/2022 6:47:01 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_Login]
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 1/14/2022 6:47:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Login]
@UserName NVARCHAR(20),
@Password NVARCHAR(16) = NULL,
@Event NVARCHAR(15)
AS
BEGIN
	BEGIN TRY
	 IF(@Event='CheckUserName')
	 BEGIN
		SELECT COUNT(*) FROM tbl_User WHERE UserName = @UserName
	 END
	 IF(@Event='CheckPassword')
	 BEGIN
		SELECT COUNT(*) FROM tbl_User WHERE UserName = @UserName AND Password = @Password
	 END
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
