---- Insertar pÃ¡ginas
--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('PÃ¡gina de inicio', 'Bienvenido a nuestra web. Este es el contenido de la pÃ¡gina principal.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Sobre nosotros', 'En Hotel Brisas del Mar, nos especializamos en ofrecer una experiencia Ãºnica y acogedora para nuestros huÃ©spedes. Ubicado en Puerto viejo, LimÃ³n, nuestro hotel combina confort, elegancia y hospitalidad excepcional para garantizar una estadÃ­a inolvidable. Desde el momento en que cruzas nuestras puertas, te recibimos con un ambiente cÃ¡lido y un servicio personalizado. Nuestras habitaciones estÃ¡n diseÃ±adas para brindar el mÃ¡ximo confort, con comodidades modernas y detalles que hacen la diferencia. AdemÃ¡s, ofrecemos una amplia gama de servicios, incluyendo restaurante de alta cocina, spa, piscina y acceso a las principales atracciones de la zona. Ya sea que viajes por negocios o placer, nuestro compromiso es hacer que tu estancia sea inigualable. Â¡Esperamos darte la bienvenida pronto y hacer de tu visita una experiencia inolvidable!.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Contáctenos', 'Teléfonos: 2222-7070 / 2222-7171; Apartado Postal: 41001; Correo electrónico: info@brisasdelmar.com; Facebook: brisasdelmar.facebook.com; Instagram: @brisasdelmarig');

---- Insertar imÃ¡genes
--INSERT INTO Image (ImagePath)
--VALUES ('/images/banner_principal.jpg');

--INSERT INTO Image (ImagePath)
--VALUES ('/images/equipo.jpg');

--INSERT INTO Image (ImagePath)
--VALUES ('/images/logo.png');

--INSERT INTO Image (ImagePath)
--VALUES ('/images/contacto.jpg');

---- Insertar relaciones en PageImages
--INSERT INTO PageImage (PageID, ImageID)
--VALUES (1, 1); -- PÃ¡gina inicio tiene banner principal

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (1, 3); -- PÃ¡gina inicio tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 2); -- PÃ¡gina sobre nosotros tiene foto del equipo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 3); -- PÃ¡gina sobre nosotros tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (3, 4); -- PÃ¡gina contacto tiene imagen de contacto

-----------------Stored procedure---------------
--CREATE PROCEDURE GetPagesWithImages
--AS
--BEGIN
--    SELECT 
--        p.PageID, p.PageTitle, p.PageContent, i.ImagePath
--    FROM Page p
--    LEFT JOIN PageImage pi ON p.PageID = pi.PageID
--    LEFT JOIN Image i ON pi.ImageID = i.PageImageID
--END

--EXEC GetPagesWithImages


--CREATE PROCEDURE GetMainAds
--AS
--BEGIN
--	Select AdID, Name, Img, ImgUrl 
--	from [dbo].[Ad]
--	Where IsActive = 1
--	AND (GETDATE() BETWEEN [StartDate] AND [EndDate])
--END

--exec GetMainAds

-- Insertar anuncio de Coca-Cola (con fecha de inicio desde hoy)
--INSERT INTO [dbo].[Ad] ([Name], [StartDate], [EndDate], [IsActive], [Img], [ImgUrl])
--VALUES 
--('Coca-Cola Promoción Verano', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-2.jpg', 
-- 'https://www.coca-cola.com');

---- Insertar anuncio de McDonald's (con fecha de inicio desde hoy)
--INSERT INTO [dbo].[Ad] ([Name], [StartDate], [EndDate], [IsActive], [Img], [ImgUrl])
--VALUES 
--('McDonalds Promoción Big Mac', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-5.jpg', 
-- 'https://www.mcdonalds.com');

---- Insertar anuncio de KFC (con fecha de inicio desde hoy)
--INSERT INTO [dbo].[Ad] ([Name], [StartDate], [EndDate], [IsActive], [Img], [ImgUrl])
--VALUES 
--('KFC Oferta Especial Combo Familiar', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-4.jpg', 
-- 'https://www.kfc.com');

--CREATE PROCEDURE GetMainPromotions
--AS
--BEGIN
--SELECT [PromotionID],[PromotionName],[Img]
--FROM [dbo].[Promotion]
--WHERE IsActive = 1
--AND (GETDATE() BETWEEN [StartDate] AND [EndDate])
--END

--EXEC GetMainPromotions

--insertar ejemplos para promociones
--INSERT INTO [dbo].[Promotion] ([PromotionName], [StartDate], [EndDate], [IsActive], [Percent], [Img])
--VALUES 
--('Coca-Cola Promoción Verano', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 15, -- Descuento aleatorio
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-2.jpg');

--INSERT INTO [dbo].[Promotion] ([PromotionName], [StartDate], [EndDate], [IsActive], [Percent], [Img])
--VALUES 
--('McDonalds Promoción Big Mac', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 20, -- Descuento aleatorio
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-5.jpg');

--INSERT INTO [dbo].[Promotion] ([PromotionName], [StartDate], [EndDate], [IsActive], [Percent], [Img])
--VALUES 
--('KFC Oferta Especial Combo Familiar', 
-- GETDATE(), -- Fecha de inicio desde hoy
-- DATEADD(MONTH, 3, GETDATE()), -- Fecha de fin dentro de 3 meses
-- 1, 
-- 25, -- Descuento aleatorio
-- 'https://res.cloudinary.com/dl2vh2h4h/image/upload/v1742841420/cld-sample-4.jpg');

--CREATE PROCEDURE sp_get_facilities
--    @PageTitle NVARCHAR(50)
--AS
--BEGIN
--    SELECT 
--        p.PageID,
--        p.PageTitle,
--        p.PageContent,
--        i.ImagePath 
--    FROM [dbo].[Page] p
--    JOIN [dbo].[PageImage] pi ON p.PageID = pi.PageId
--    JOIN [dbo].[Image] i ON pi.ImageId = i.PageImageId
--    WHERE p.PageTitle = @PageTitle; 
--END;

--exec sp_get_facilities 'Facilidades';

--exec sp_get_facilities 'Facilidades'

--insert into Page  (PageTitle,PageContent) values ('Facilidades','Sumérgete en un oasis de tranquilidad en nuestra exclusiva piscina rodeada de exuberante vegetación tropical. Diseñada para brindar una experiencia relajante, esta piscina cuenta con fuentes de agua que añaden un toque de serenidad al ambiente. El área de la piscina está cuidadosamente decorada con palmeras y plantas exóticas, creando un entorno natural y fresco.')
--insert into Page  (PageTitle,PageContent) values ('Facilidades','Para aquellos que disfrutan preparando sus propias comidas, nuestro hotel ofrece una cocina totalmente equipada para huéspedes. Este espacio cuenta con todo lo necesario para que puedas cocinar con comodidad, incluyendo estufa, horno, refrigerador, utensilios de cocina, vajilla y una zona de comedor.')
--insert into Page  (PageTitle,PageContent) values ('Facilidades','Facilidades	Nuestro hotel cuenta con un parqueo verde, un espacio diseñado para ofrecer comodidad a nuestros huéspedes mientras cuidamos el medio ambiente. Ubicado en una zona rodeada de naturaleza, este estacionamiento combina áreas pavimentadas con superficies permeables que permiten la filtración del agua, reduciendo el impacto ambiental.	')

--insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
--insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
--insert into [Image]  (ImagePath) values ('https://media-cdn.tripadvisor.com/media/photo-s/1c/50/ee/77/acceso-para-cualquier.jpg')
 
--insert into PageImage (PageID,ImageID) VALUES (4,5)
--insert into PageImage (PageID,ImageID) VALUES (5,6)
--insert into PageImage (PageID,ImageID) VALUES (6,7)
-- INSERT IMAGES 

--INSERT INTO [dbo].[Image]
--           ([ImagePath])
--     VALUES
--           ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131527/areadepiscina_uqh9fc.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131523/alrededores_y4fgsv.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131523/areadepiscina5_pkemkt.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131524/restaurante2_hqnsan.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131524/restaurante_pjaza3.webp'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131525/salas_qymi1s.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131524/habitacion_f3zkjf.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131524/habitacion2_k65csg.webp'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131526/areadepiscina3_lvq2xt.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131524/areadepiscina2_qddrnc.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131522/areadepiscina4_iietjt.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743135093/areadepiscina6_boqwvc.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743136634/restaurante3_da8mb5.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743136631/alrededores8_p4tsam.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743136631/alrededores9_o1xp5q.jpg'),
--		   ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1743136632/areadepiscina7_f8oz0e.jpg')


-- INSERT IMAGES+PAGES - este puede variar el orden en caso de que ya hayan agregado imágenes previamente, pues los IDs de Image serían distintos

--INSERT INTO [dbo].[PageImage]
--           ([PageID]
--           ,[ImageID])
--     VALUES
--           (2,5), (2,6), (2,7), (2,8), (2,9), (2,10), (2,11), (2,12), (2,13), (2,14), (2,15), (2,16), (2,17), (2,18), (2,19), (2,20)

----------------------------------------
--RESERVA
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description, Image)VALUES('Normal', 500,'La habitación cuanta con dos camas, una matrimonial y una individual','Perfecto para una pareja con su hijo', 'https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131523/alrededores_y4fgsv.jpg')
--INSERT INTO RoomType(RoomTypeName, Price,Characteristics,description, Image)VALUES('Premium', 1000,'La habitación cuanta con dos camas matrimoniales y una Jacuzzi','Perfecto para una pareja con su hijo', 'https://res.cloudinary.com/dqmusg1pu/image/upload/v1743131527/areadepiscina_uqh9fc.jpg')

--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,1,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,2,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,3,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,4,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,5,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,6,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,7,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,8,0)
--INSERT INTO Room(RoomTypeId,[IsActice],[RoomNumber],[Status])VALUES(1,1,9,0)



-------------------SP roomType-----------------------------------------------

--CREATE PROCEDURE sp_get_all_RoomType
--AS
--BEGIN
--SELECT RoomTypeName
--FROM RoomType
--END
--EXEC sp_get_all_RoomType

-- Imagen para Contact
-- INSERT INTO [dbo].[Image] ([ImagePath]) VALUES ('https://res.cloudinary.com/dqmusg1pu/image/upload/v1744483188/istockphoto-2057973065-1024x1024_uwxx2c.jpg') 
-- INSERT INTO [dbo].[PageImage] ([PageID],[ImageID]) VALUES (3,/*num generado por el id de la imagen anteriormente ingresada*/)

--------------------INSERTS ROOMRATE PAGE------------------
--insert into Page  (PageTitle,PageContent) values ('RoomRate','')
--insert into Page  (PageTitle,PageContent) values ('RoomRate','')
--insert into Page  (PageTitle,PageContent) values ('RoomRate','')

--insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
--insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
--insert into [Image]  (ImagePath) values ('https://media-cdn.tripadvisor.com/media/photo-s/1c/50/ee/77/acceso-para-cualquier.jpg')


---------------------Insert in RoomType--------------------------
--Estas imagenes seran segun la cantidad de tipos de habitacion que se tenga
insert into PageImage (PageID,ImageID) VALUES (10,5)
insert into PageImage (PageID,ImageID) VALUES (11,6)

---------------------SP ROOMRATE PAGE----------------------
--Insert season
INSERT INTO Season 
    (SeasonName, StartDate, EndDate, [Percent], IsActive, IsHigh)
VALUES 
    ('Temporada Alta', GETDATE(), DATEADD(DAY, 6, GETDATE()), 15, 1, 1);

CREATE PROCEDURE sp_get_RoomType_season
As
BEGIN
	SELECT 
		rt.RoomTypeId,
		rt.RoomTypeName,
		CAST(rt.Price * (1 + CASE WHEN s.IsHigh = 1 THEN s.[Percent] / 100.0 ELSE -s.[Percent] / 100.0 END)AS INT)AS Price,
		rt.Characteristics,
		rt.description,
		rt.Image
	FROM 
		RoomType rt
	INNER JOIN 
		Season s
		ON GETDATE() BETWEEN s.StartDate AND s.EndDate
	WHERE 
		s.IsActive = 1;
END

Exec sp_get_RoomType_season
