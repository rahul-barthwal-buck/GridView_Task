/*Author name: Rahul Barthwal*/
/*Objective: Creation of ProductDetails Stored Procedure*/

USE [GridView_Task]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductDetails_GridView]    Script Date: 1/14/2022 6:48:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[sp_ProductDetails_GridView]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductDetails_GridView]    Script Date: 1/14/2022 6:48:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ProductDetails_GridView] @ProductId INT               = 0
              , @ProductName                                  NVARCHAR ( 30 )   = Null
              , @QuantityPerUnit                              INT               = 0
              , @UnitPrice                                    decimal ( 12, 2 ) = 0
              , @UnitsInStock                                 INT               = 0
              , @Event                                        VARCHAR ( 10 ) AS BEGIN
BEGIN TRY
    if(@Event='Select')
    BEGIN
        SELECT *
        FROM
               tbl_ProductDetails
        ;
    
    END
    else
    if(@Event='Add')
    BEGIN
        INSERT INTO tbl_ProductDetails
               (Name
                    , Quantity_Per_Unit
                    , Unit_Price
                    , Units_In_Stock
               )
               values
               (@ProductName
                    , @QuantityPerUnit
                    , @UnitPrice
                    , @UnitsInStock
               )
        ;
    
    END
    else
    if(@Event='UPDATE')
    BEGIN
        UPDATE
               tbl_ProductDetails
        SET    Name             = @ProductName
             , Quantity_Per_Unit=@QuantityPerUnit
             , Unit_Price       = @UnitPrice
             , Units_In_Stock   =@UnitsInStock
        WHERE
               Product_Id = @ProductId
        ;
    
    END
    else
    if(@Event='Search')
    BEGIN
        SELECT *
        FROM
               tbl_ProductDetails
        WHERE
               Name                 LIKE '%' + @ProductName + '%'
        ;
    
    END
    else
    BEGIN
        delete
        FROM
               tbl_ProductDetails
        WHERE
               Product_Id = @ProductId
        ;
    
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
