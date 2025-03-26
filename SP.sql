---- Insertar p�ginas
--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('P�gina de inicio', 'Bienvenido a nuestra web. Este es el contenido de la p�gina principal.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Sobre nosotros', 'En Hotel Brisas del Mar, nos especializamos en ofrecer una experiencia �nica y acogedora para nuestros hu�spedes. Ubicado en Puerto viejo, Lim�n, nuestro hotel combina confort, elegancia y hospitalidad excepcional para garantizar una estad�a inolvidable. Desde el momento en que cruzas nuestras puertas, te recibimos con un ambiente c�lido y un servicio personalizado. Nuestras habitaciones est�n dise�adas para brindar el m�ximo confort, con comodidades modernas y detalles que hacen la diferencia. Adem�s, ofrecemos una amplia gama de servicios, incluyendo restaurante de alta cocina, spa, piscina y acceso a las principales atracciones de la zona. Ya sea que viajes por negocios o placer, nuestro compromiso es hacer que tu estancia sea inigualable. �Esperamos darte la bienvenida pronto y hacer de tu visita una experiencia inolvidable!.');

--INSERT INTO Page (PageTitle, PageContent)
--VALUES ('Contacto', 'Puedes contactarnos en info@ejemplo.com o llamando al +123456789.');

---- Insertar im�genes
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
--VALUES (1, 1); -- P�gina inicio tiene banner principal

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (1, 3); -- P�gina inicio tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 2); -- P�gina sobre nosotros tiene foto del equipo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (2, 3); -- P�gina sobre nosotros tiene logo

--INSERT INTO PageImage (PageID, ImageID)
--VALUES (3, 4); -- P�gina contacto tiene imagen de contacto

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