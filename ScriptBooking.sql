-------Booking----------------
--RESERVA
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description)VALUES('Normal', 500,'La habitación cuanta con dos camas, una matrimonial y una individual','Perfecto para una pareja con su hijo')
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description)VALUES('Premium', 1000,'La habitación cuanta con dos camas matrimoniales y una Jacuzzi','Perfecto para una pareja con su hijo')

--isActive 1=se puede usar
--status 1=ocupada
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(3,1,1,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(3,1,2,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(3,1,3,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(3,1,4,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(4,1,5,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(4,1,6,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(4,1,7,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(4,1,8,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(3,1,10,0)

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



--INSERT INTO [HotelDB].[dbo].[Booking] ([CreationDate], [BookingReferenceNumber], [CheckIn], [CheckOut], [CustomerID], [Transaction], [IsActive],[RoomId])
--('2025-04-01 10:00:00', 'BR123456', '2025-04-10', '2025-04-15', 1, 'TXN001', 1,28),
--( '2025-04-03 14:00:00', 'BR123458', '2025-04-15', '2025-04-20', 3, 'TXN003', 1,29),
--( '2025-04-04 16:00:00', 'BR123459', '2025-04-20', '2025-04-25', 4, 'TXN004', 1,30),
--( '2025-04-05 18:00:00', 'BR123460', '2025-04-25', '2025-04-30', 5, 'TXN005', 1,31),
--( '2025-04-06 20:00:00', 'BR123461', '2025-04-28', '2025-05-02', 6, 'TXN006', 1,32),
--('2025-04-07 22:00:00', 'BR123462', '2025-05-01', '2025-05-05', 7, 'TXN007', 1,33),
--( '2025-04-08 10:30:00', 'BR123463', '2025-05-03', '2025-05-08', 8, 'TXN008', 1,34)
INSERT INTO [HotelDB].[dbo].[Booking] 
([CreationDate], [BookingReferenceNumber], [CheckIn], [CheckOut], [CustomerID], [Transaction], [IsActive], [RoomId])
VALUES
('2025-04-03 14:00:00', 'BR123456', '2025-04-10', '2025-04-15', 1, 'TXN001', 1, 28),
('2025-04-03 14:00:00', 'BR123458', '2025-04-10', '2025-04-15', 3, 'TXN003', 1, 29),      
('2025-04-04 16:00:00', 'BR123459', '2025-04-10', '2025-04-15', 4, 'TXN004', 1, 30),
('2025-04-05 18:00:00', 'BR123460', '2025-04-10', '2025-04-15', 5, 'TXN005', 1, 31),
('2025-04-06 20:00:00', 'BR123461', '2025-04-10', '2025-04-15', 6, 'TXN006', 1, 32),
('2025-04-07 22:00:00', 'BR123462', '2025-04-10', '2025-04-15', 7, 'TXN007', 1, 33),
('2025-04-08 10:30:00', 'BR123463', '2025-04-10', '2025-04-15', 8, 'TXN008', 1, 34);

-------------------SP roomType-----------------------------------------------

--CREATE PROCEDURE sp_get_all_RoomType
--AS
--BEGIN
--SELECT RoomTypeId,RoomTypeName,Price,Characteristics,description
--FROM RoomType
--END

--EXEC sp_get_all_RoomType


----------------------SP check_availability -------------------------------------------------------
--CREATE PROCEDURE sp_check_availability
--    @RoomType INT,
--    @StartTime DATETIME,
--    @EndTime DATETIME
--AS
--BEGIN
--    SET NOCOUNT ON;

--    SELECT TOP 1 R.RoomNumber, R.RoomTypeId,rt.RoomTypeName,rt.description
--    FROM Room R
--	JOIN RoomType RT ON RT.RoomTypeId=R.RoomTypeId
--    WHERE R.RoomTypeId = @RoomType  -- filtrar por tipo de habitación
--    AND R.RoomId NOT IN (
--        SELECT B.RoomId
--        FROM Booking B
--        WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn) -- Compara con fechas de la reserva
--    );
--END

CREATE PROCEDURE sp_check_availability
    @RoomType INT,
    @StartTime DATETIME,
    @EndTime DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Calcular el número de noches
    DECLARE @NumNights INT;
    SET @NumNights = DATEDIFF(DAY, @StartTime, @EndTime);
    
    SELECT TOP 1 
        R.RoomNumber, 
        R.RoomTypeId,
        RT.RoomTypeName,
        RT.Description,
        RT.Price AS PricePerNight,
        @NumNights AS NumberOfNights,
        (RT.Price * @NumNights) AS TotalPrice
    FROM Room R
    JOIN RoomType RT ON RT.RoomTypeId = R.RoomTypeId
    WHERE R.RoomTypeId = @RoomType
    AND R.RoomId NOT IN (
        SELECT B.RoomId
        FROM Booking B
        WHERE (@StartTime < B.CheckOut AND @EndTime > B.CheckIn)
    );
END


	EXEC [dbo].[sp_check_availability]
		@RoomType = 4,
		@StartTime = N'2025-04-10',
		@EndTime = N'2025-04-15'

		select *
		from Booking

				select *
		from room

		delete Room
		where
		RoomId ='38'