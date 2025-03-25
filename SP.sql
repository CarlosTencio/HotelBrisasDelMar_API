---- Insertar páginas
--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Página de inicio', 'Bienvenido a nuestra web. Este es el contenido de la página principal.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Sobre nosotros', 'Somos una empresa dedicada al desarrollo de software.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Contacto', 'Puedes contactarnos en info@ejemplo.com o llamando al +123456789.');

---- Insertar imágenes
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
--VALUES (1, 1); -- Página inicio tiene banner principal

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (1, 3); -- Página inicio tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 2); -- Página sobre nosotros tiene foto del equipo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 3); -- Página sobre nosotros tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (3, 4); -- Página contacto tiene imagen de contacto

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