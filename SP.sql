---- Insertar pÃ¡ginas
--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('PÃ¡gina de inicio', 'Bienvenido a nuestra web. Este es el contenido de la pÃ¡gina principal.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Sobre nosotros', 'En Hotel Brisas del Mar, nos especializamos en ofrecer una experiencia Ãºnica y acogedora para nuestros huÃ©spedes. Ubicado en Puerto viejo, LimÃ³n, nuestro hotel combina confort, elegancia y hospitalidad excepcional para garantizar una estadÃ­a inolvidable. Desde el momento en que cruzas nuestras puertas, te recibimos con un ambiente cÃ¡lido y un servicio personalizado. Nuestras habitaciones estÃ¡n diseÃ±adas para brindar el mÃ¡ximo confort, con comodidades modernas y detalles que hacen la diferencia. AdemÃ¡s, ofrecemos una amplia gama de servicios, incluyendo restaurante de alta cocina, spa, piscina y acceso a las principales atracciones de la zona. Ya sea que viajes por negocios o placer, nuestro compromiso es hacer que tu estancia sea inigualable. Â¡Esperamos darte la bienvenida pronto y hacer de tu visita una experiencia inolvidable!.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Contacto', 'Puedes contactarnos en info@ejemplo.com o llamando al +123456789.');

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

EXEC GetPagesWithImages


--CREATE PROCEDURE GetMainAds
--AS
--BEGIN
--	Select AdID, Name, Img, ImgUrl 
--	from [dbo].[Ad]
--	Where IsActive = 1
--	AND (GETDATE() BETWEEN [StartDate] AND [EndDate])
--END

exec GetMainAds

---- Insertar anuncio de Coca-Cola (con fecha de inicio desde hoy)
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

EXEC GetMainPromotions

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
--

-- INSERT IMAGES+PAGES - este puede variar el orden en caso de que ya hayan agregado imágenes previamente, pues los IDs de Image serían distintos

--INSERT INTO [dbo].[PageImage]
--           ([PageID]
--           ,[ImageID])
--     VALUES
--           (2,5), (2,6), (2,7), (2,8), (2,9), (2,10), (2,11), (2,12), (2,13), (2,14), (2,15), (2,16), (2,17), (2,18), (2,19), (2,20)
--
