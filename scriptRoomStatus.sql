-- =============================================
-- Author:		Nicole Alvarado Ramírez
-- Create date: Apr. 26
-- Description:	Get all rooms to check the hotel status
-- =============================================

CREATE PROCEDURE [dbo].[sp_getHotelRoomStatusToday]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @today DATE = CONVERT(date, GETDATE());

    SELECT 
        R.RoomNumber,
        RT.RoomTypeName,
        CASE 
            WHEN EXISTS (
                SELECT 1
                FROM Booking B
                WHERE 
                    B.RoomID = R.RoomId
                    AND B.IsActive = 1
                    AND @today BETWEEN CONVERT(date, B.CheckIn) AND CONVERT(date, B.CheckOut)
            )
            THEN 'OCUPADA'
            ELSE 'DISPONIBLE'
        END AS Status
    FROM Room R
    JOIN RoomType RT ON R.RoomTypeId = RT.RoomTypeId
    WHERE R.IsActice = 1
    ORDER BY R.RoomNumber;
END