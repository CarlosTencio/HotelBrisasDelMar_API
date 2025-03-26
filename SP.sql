---- Insertar páginas
--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Página de inicio', 'Bienvenido a nuestra web. Este es el contenido de la página principal.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Sobre nosotros', 'En Hotel Brisas del Mar, nos especializamos en ofrecer una experiencia única y acogedora para nuestros huéspedes. Ubicado en Puerto viejo, Limón, nuestro hotel combina confort, elegancia y hospitalidad excepcional para garantizar una estadía inolvidable. Desde el momento en que cruzas nuestras puertas, te recibimos con un ambiente cálido y un servicio personalizado. Nuestras habitaciones están diseñadas para brindar el máximo confort, con comodidades modernas y detalles que hacen la diferencia. Además, ofrecemos una amplia gama de servicios, incluyendo restaurante de alta cocina, spa, piscina y acceso a las principales atracciones de la zona. Ya sea que viajes por negocios o placer, nuestro compromiso es hacer que tu estancia sea inigualable. ¡Esperamos darte la bienvenida pronto y hacer de tu visita una experiencia inolvidable!.');

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

CREATE PROCEDURE sp_get_page_for_title
    @PageTitle NVARCHAR(50)
AS
BEGIN
    SELECT 
        p.PageID,
        p.PageTitle,
        p.PageContent,
        i.ImagePath 
    FROM [dbo].[Page] p
    JOIN [dbo].[PageImage] pi ON p.PageID = pi.PageId
    JOIN [dbo].[Image] i ON pi.ImageId = i.PageImageId
    WHERE p.PageTitle = @PageTitle; 
END;

exec sp_get_page_for_title 'Facilidades';