 -------Booking----------------
--RESERVA
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description)VALUES('Normal', 500,'La habitación cuanta con dos camas, una matrimonial y una individual','Perfecto para una pareja con su hijo')
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description)VALUES('Premium', 1000,'La habitación cuanta con dos camas matrimoniales y una Jacuzzi','Perfecto para una pareja con su hijo')
select * from RoomType
----isActive 1=se puede usar
--status 1=ocupada
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,1,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,2,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,3,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,4,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(2,1,5,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(2,1,6,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(2,1,7,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(2,1,8,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,10,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,11,0)
--INSERT INTO [HotelDB].[dbo].[Customer] ([CustomerName], [CustomerLastName], [CustomerEmail], [CardNumber])
--VALUES 
--('John', 'Doe', 'johndoe@example.com', '1234-5678-9876-5432'),
--('Jane', 'Smith', 'janesmith@example.com', '2345-6789-8765-4321'),
--('Michael', 'Johnson', 'michaeljohnson@example.com', '3456-7890-7654-3210'),
--('Emily', 'Davis', 'emilydavis@example.com', '4567-8901-6543-2109'),
--('David', 'Brown', 'davidbrown@example.com', '5678-9012-5432-1098'),
--('Sarah', 'Miller', 'sarahmiller@example.com', '6789-0123-4321-0987'),
--('James', 'Wilson', 'jameswilson@example.com', '7890-1234-3210-9876'),
--('Linda', 'Moore', 'lindamoore@example.com', '8901-2345-2109-8765'),
--('Robert', 'Taylor', 'roberttaylor@example.com', '9012-3456-1098-7654'),
--('Olivia', 'Anderson', 'oliviaanderson@example.com', '0123-4567-9876-6543');

--select * from [Booking]

--INSERT INTO [HotelDB].[dbo].[Booking] ([CreationDate], [BookingReferenceNumber], [CheckIn], [CheckOut], [CustomerID], [Transaction], [IsActive],[RoomId])
--VALUES
--('2025-04-01 10:00:00', 'BR123456', '2025-04-10', '2025-04-15', 1, 'TXN001', 1,28),
--( '2025-04-03 14:00:00', 'BR123458', '2025-04-15', '2025-04-20', 3, 'TXN003', 1,29),
--( '2025-04-04 16:00:00', 'BR123459', '2025-04-20', '2025-04-25', 4, 'TXN004', 1,30),
--( '2025-04-05 18:00:00', 'BR123460', '2025-04-25', '2025-04-30', 5, 'TXN005', 1,31),
--( '2025-04-06 20:00:00', 'BR123461', '2025-04-28', '2025-05-02', 6, 'TXN006', 1,32),
--('2025-04-07 22:00:00', 'BR123462', '2025-05-01', '2025-05-05', 7, 'TXN007', 1,33),
--( '2025-04-08 10:30:00', 'BR123463', '2025-05-03', '2025-05-08', 8, 'TXN008', 1,34)
--INSERT INTO [HotelDB].[dbo].[Booking] 
--([CreationDate], [BookingReferenceNumber], [CheckIn], [CheckOut], [CustomerID], [Transaction], [IsActive], [RoomId])
--VALUES
--('2025-04-03 14:00:00', 'BR123456', '2025-04-10', '2025-04-15', 1, 'TXN001', 1, 37),
--('2025-04-03 14:00:00', 'BR123458', '2025-04-10', '2025-04-15', 3, 'TXN003', 1, 38),      
--('2025-04-04 16:00:00', 'BR123459', '2025-04-10', '2025-04-15', 4, 'TXN004', 1, 39),
--('2025-04-05 18:00:00', 'BR123460', '2025-04-10', '2025-04-15', 5, 'TXN005', 1, 40),
--('2025-04-06 20:00:00', 'BR123461', '2025-04-10', '2025-04-15', 6, 'TXN006', 1, 41),
--('2025-04-03 14:00:00', 'BR123456', '2025-04-10', '2025-04-15', 1, 'TXN001', 1, 42),
--('2025-04-07 22:00:00', 'BR123462', '2025-04-10', '2025-04-15', 7, 'TXN007', 1, 43),
--('2025-04-08 10:30:00', 'BR123463', '2025-04-10', '2025-04-15', 8, 'TXN008', 1, 44),
--('2025-04-08 10:30:00', 'BR123463', '2025-04-10', '2025-04-15', 8, 'TXN008', 1, 45);
---------------------SP roomType-----------------------------------------------

--CREATE PROCEDURE sp_get_all_RoomType
--AS
--BEGIN
--SELECT RoomTypeId,RoomTypeName
--FROM RoomType
--END

--EXEC sp_get_all_RoomType


--------------------------SP check_availability -------------------------------------------------------

--CREATE PROCEDURE sp_check_availability
--    @RoomType INT,
--    @StartTime DATETIME,
--    @EndTime DATETIME
--AS
--BEGIN
--    SET NOCOUNT ON;

--    -- Calcular número de noches
--    DECLARE @NumNights INT;
--    SET @NumNights = DATEDIFF(DAY, @StartTime, @EndTime);

--    -- Sumar promociones activas
--    DECLARE @TotalDiscountPercent DECIMAL(10,2);
--    SELECT @TotalDiscountPercent = ISNULL(SUM([Percent]), 0)
--    FROM Promotion
--    WHERE IsActive = 1
--      AND GETDATE() BETWEEN StartDate AND EndDate;

--    -- Verifica disponibilidad exacta
--    IF EXISTS (
--        SELECT 1
--        FROM Room R
--        INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--        INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--        WHERE S.IsActive = 1
--          AND R.RoomTypeId = @RoomType 
--          AND R.RoomId NOT IN (
--              SELECT B.RoomId
--              FROM Booking B
--              WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn)
--          )
--    )
--    BEGIN
--        SELECT TOP 1 
--            R.RoomNumber, 
--            R.RoomId,
--            R.RoomTypeId,
--            RT.RoomTypeName,
--            RT.Description,
--            CAST(@NumNights * RT.Price * 
--                (1 + CASE WHEN S.IsHigh = 1 THEN S.[Percent] / 100.0 ELSE -S.[Percent] / 100.0 END) *
--                (1 - @TotalDiscountPercent / 100.0) AS INT) AS Price,
--            RT.Image AS ImgUrl,
--            @StartTime AS CheckIn,
--            @EndTime AS CheckOut,
--            'Available' AS ResultType
--        FROM Room R
--        INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--        INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--        WHERE S.IsActive = 1
--          AND R.RoomTypeId = @RoomType
--          AND R.RoomId NOT IN (
--              SELECT B.RoomId
--              FROM Booking B
--              WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn)
--          );
--    END
--    ELSE IF EXISTS (
--        SELECT 1
--        FROM Room R
--        INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--        INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--        WHERE S.IsActive = 1
--          AND R.RoomId NOT IN (
--              SELECT B.RoomId
--              FROM Booking B
--              WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn)
--          )
--    )
--    BEGIN
--        -- Otra habitación de diferente tipo en el mismo rango de fechas
--        SELECT TOP 1 
--            R.RoomNumber, 
--            R.RoomId,
--            R.RoomTypeId,
--            RT.RoomTypeName,
--            RT.Description,
--            CAST(@NumNights * RT.Price * 
--                (1 + CASE WHEN S.IsHigh = 1 THEN S.[Percent] / 100.0 ELSE -S.[Percent] / 100.0 END) *
--                (1 - @TotalDiscountPercent / 100.0) AS INT) AS Price,
--            RT.Image AS ImgUrl,
--            @StartTime AS CheckIn,
--            @EndTime AS CheckOut,
--            'Recommendation' AS ResultType
--        FROM Room R
--        INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--        INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--        WHERE S.IsActive = 1
--          AND R.RoomId NOT IN (
--              SELECT B.RoomId
--              FROM Booking B
--              WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn)
--          );
--    END
--       ELSE
--    BEGIN
--        -- Busca la primera fecha disponible a partir del @EndTime
--        DECLARE @AltStart DATETIME = @EndTime;
--        DECLARE @AltEnd DATETIME;
--        DECLARE @MaxSearchDays INT = 30; -- Máximo de días que puede recomendar
--        DECLARE @DaysChecked INT = 0;

--        WHILE @DaysChecked < @MaxSearchDays
--        BEGIN
--            SET @AltEnd = DATEADD(DAY, @NumNights, @AltStart);

--            IF EXISTS (
--                SELECT 1
--                FROM Room R
--                INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--                INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--                WHERE S.IsActive = 1
--                  AND R.RoomTypeId = @RoomType
--                  AND R.RoomId NOT IN (
--                      SELECT B.RoomId
--                      FROM Booking B
--                      WHERE (@AltStart < B.CheckOut AND @AltEnd > B.CheckIn)
--                  )
--            )
--            BEGIN
             
--                SELECT TOP 1 
--                    R.RoomNumber, 
--                    R.RoomId,
--                    R.RoomTypeId,
--                    RT.RoomTypeName,
--                    RT.Description,
--                    CAST(@NumNights * RT.Price * 
--                        (1 + CASE WHEN S.IsHigh = 1 THEN S.[Percent] / 100.0 ELSE -S.[Percent] / 100.0 END) *
--                        (1 - @TotalDiscountPercent / 100.0) AS INT) AS Price,
--                    RT.Image AS ImgUrl,
--                    @AltStart AS CheckIn,
--                    @AltEnd AS CheckOut,
--                    'AlternativeDates' AS ResultType
--                FROM Room R
--                INNER JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
--                INNER JOIN Season S ON GETDATE() BETWEEN S.StartDate AND S.EndDate
--                WHERE S.IsActive = 1
--                  AND R.RoomTypeId = @RoomType
--                  AND R.RoomId NOT IN (
--                      SELECT B.RoomId
--                      FROM Booking B
--                      WHERE (@AltStart < B.CheckOut AND @AltEnd > B.CheckIn)
--                  );

--                BREAK;
--            END

--            -- Si no encontró, prueba siguiente día
--            SET @AltStart = DATEADD(DAY, 1, @AltStart);
--            SET @DaysChecked += 1;
--        END
--		IF @DaysChecked = @MaxSearchDays
--BEGIN
--    SELECT 
--        NULL AS RoomNumber, 
--        NULL AS RoomId,
--        @RoomType AS RoomTypeId,
--        NULL AS RoomTypeName,
--        NULL AS Description,
--        NULL AS Price,
--        NULL AS ImgUrl,
--        NULL AS CheckIn,
--        NULL AS CheckOut,
--        'NoAvailability' AS ResultType;
--      END
--    END -- Fin ELSE final (AlternativeDates)
--END -- Fin del procedimiento


		
EXEC [dbo].[sp_check_availability]
			@RoomType =1,
			@StartTime = N'2025-04-19',
			@EndTime = N'2025-04-25'

		delete Booking
		
		select * 
		from Booking

		update room
		set Status=0 

		select *
		from Room

--	delete from Booking
-----------------------sp reserva--------------------------------------

--CREATE PROCEDURE sp_CreateBooking
--    @CustomerName nvarchar(max),
--    @CustomerLastName nvarchar(max),
--    @CustomerEmail nvarchar(max),
--    @CardNumber nvarchar(max),
--	    @RoomID INT,
--    @CheckIn datetime2(7),
--    @CheckOut datetime2(7),
--    @Transaction INT
--AS
--BEGIN
--    SET NOCOUNT ON;
    
--    BEGIN TRY
--         ----Iniciar la transacción
--        BEGIN TRANSACTION;
        
--        DECLARE @CustomerID INT;
        
--         ----Verificar si el cliente ya existe (por email)
--        SELECT @CustomerID = CustomerID 
--        FROM dbo.Customer 
--        WHERE CustomerEmail = @CustomerEmail;
        
--         ----Si el cliente no existe, insertarlo
--        IF @CustomerID IS NULL
--        BEGIN
--            INSERT INTO dbo.Customer (
--                CustomerName,
--                CustomerLastName,
--                CustomerEmail,
--                CardNumber
--            )
--            VALUES (
--                @CustomerName,
--                @CustomerLastName,
--                @CustomerEmail,
--                @CardNumber
--            );
            
--             ----Obtener el ID del cliente recién insertado
--            SET @CustomerID = SCOPE_IDENTITY();
--        END;
        
--         ----Generar número de referencia único
--        DECLARE @BookingReference nvarchar(max);
--        SET @BookingReference = 'RES-' + CONVERT(VARCHAR(8), GETDATE(), 112) + 
--                               '-' + RIGHT('000000' + CAST(ABS(CHECKSUM(NEWID())) % 1000000 AS VARCHAR(6)), 6);
        
--         ----Insertar la reserva
--        INSERT INTO dbo.Booking (
--            CreationDate,
--            BookingReferenceNumber,
--            CheckIn,
--            CheckOut,
--            CustomerID,
--            RoomID,
--            [Transaction],
--            IsActive
--        )
--        VALUES (
--            GETDATE(),                   
--            @BookingReference,           
--            @CheckIn,
--            @CheckOut,
--            @CustomerID,                 
--            @RoomID,
--            @Transaction,
--            1                           
--        );

--		----Actualizar estado de habitación
--		Update Room
--		SET Status = 1
--		WHERE RoomId=  @RoomID;
        
--         ----Confirmar la transacción
--        COMMIT TRANSACTION;
        
--         ----Devuelve información sobre la operación exitosa
--        SELECT 
--            'Success' AS Status,
--            @BookingReference AS BookingReference,
--			@CustomerName AS Name,
--			@CustomerLastName AS LastName,
--			@CustomerEmail AS Email
            
--    END TRY
--    BEGIN CATCH
--         ----Si ocurre algún error, hacer rollback
--        IF @@TRANCOUNT > 0
--            ROLLBACK TRANSACTION;
        
--         ----Devolver información del error
--        SELECT 
--            'Error' AS Status,
--            ERROR_MESSAGE() AS ErrorMessage,
--            ERROR_NUMBER() AS ErrorNumber,
--            ERROR_SEVERITY() AS ErrorSeverity,
--            ERROR_STATE() AS ErrorState,
--            ERROR_PROCEDURE() AS ErrorProcedure,
--            ERROR_LINE() AS ErrorLine;
--    END CATCH;
--END;