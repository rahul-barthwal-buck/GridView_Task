/*Author name: Rahul Barthwal*/
/*Objective: Creation of ForgetPassword Stored Procedure*/

USE [GridView_Task]
GO
/****** Object:  StoredProcedure [dbo].[sp_ForgetPassword]    Script Date: 1/14/2022 6:45:37 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_ForgetPassword]
GO
/****** Object:  StoredProcedure [dbo].[sp_ForgetPassword]    Script Date: 1/14/2022 6:45:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ForgetPassword]
@Email NVARCHAR(38) = NULL,
@NewPassword NVARCHAR(16) = NULL,
@UserId INT = 0,
@Event NVARCHAR(15)
AS
BEGIN
	BEGIN TRY
     IF(@Event='CheckEmail')
	 BEGIN
		SELECT * FROM tbl_User WHERE Email = @Email
	 END
	 IF(@Event='ChangePassword')
	 BEGIN
		UPDATE tbl_User SET Password = @NewPassword WHERE UserId = @UserId
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
