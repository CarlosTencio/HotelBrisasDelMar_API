USE [HotelDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_updateContactUs]    Script Date: 23/6/2025 20:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicole Alvarado Ramírez
-- Create date: June 21, 2025
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_updateContactUs]
    @PageID INT,
    @PageContent NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        DECLARE @ExistingImageID INT;

        UPDATE dbo.Page 
        SET PageContent = @PageContent
        WHERE PageID = @PageID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
    END CATCH
END;
