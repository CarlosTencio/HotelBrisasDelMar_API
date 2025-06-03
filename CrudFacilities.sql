--update facilities
USE [HotelDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_deleteFacility]    Script Date: 01/06/2025 12:41:25 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_deleteFacility]
    @PageID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar si la página existe
    IF NOT EXISTS (SELECT 1 FROM Page WHERE PageID = @PageID)
    BEGIN
        SELECT 
            1 AS CodigoResultado,
            'Facilidad no encontrada.' AS Mensaje;
        RETURN;
    END

    -- Tabla temporal para guardar las imágenes relacionadas con la página
    DECLARE @ImageIDs TABLE (ImageID INT);

    INSERT INTO @ImageIDs (ImageID)
    SELECT ImageID
    FROM PageImage
    WHERE PageID = @PageID;

    -- Eliminar relaciones en PageImage
    DELETE FROM PageImage
    WHERE PageID = @PageID;

    -- Eliminar la página
    DELETE FROM Page
    WHERE PageID = @PageID;

    -- Eliminar las imágenes que ya no están relacionadas con ninguna otra página
    DELETE FROM Image
    WHERE PageImageID IN (
        SELECT ImageID
        FROM @ImageIDs
        WHERE ImageID NOT IN (
            SELECT ImageID FROM PageImage
        )
    );

    -- Devolver resultado exitoso
    SELECT 
        0 AS CodigoResultado,
        'Facilidad eliminada correctamente.' AS Mensaje;
END;
GO






 insert into Page  (PageTitle,PageContent) values ('Facilidades','Sumérgete en un oasis de tranquilidad en nuestra exclusiva piscina rodeada de exuberante vegetación tropical. Diseñada para brindar una experiencia relajante, esta piscina cuenta con fuentes de agua que añaden un toque de serenidad al ambiente. El área de la piscina está cuidadosamente decorada con palmeras y plantas exóticas, creando un entorno natural y fresco.')
 insert into Page  (PageTitle,PageContent) values ('Facilidades','Para aquellos que disfrutan preparando sus propias comidas, nuestro hotel ofrece una cocina totalmente equipada para huéspedes. Este espacio cuenta con todo lo necesario para que puedas cocinar con comodidad, incluyendo estufa, horno, refrigerador, utensilios de cocina, vajilla y una zona de comedor.')
 insert into Page  (PageTitle,PageContent) values ('Facilidades','Facilidades	Nuestro hotel cuenta con un parqueo verde, un espacio diseñado para ofrecer comodidad a nuestros huéspedes mientras cuidamos el medio ambiente. Ubicado en una zona rodeada de naturaleza, este estacionamiento combina áreas pavimentadas con superficies permeables que permiten la filtración del agua, reduciendo el impacto ambiental.	')

 insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
 insert into [Image]  (ImagePath) values ('https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/22/b5/f0/piscina.jpg?w=1900&h=1400&s=1')
 insert into [Image]  (ImagePath) values ('https://media-cdn.tripadvisor.com/media/photo-s/1c/50/ee/77/acceso-para-cualquier.jpg')
 
 insert into PageImage (PageID,ImageID) VALUES (2043,1022)
 insert into PageImage (PageID,ImageID) VALUES (2044,1022)
 insert into PageImage (PageID,ImageID) VALUES (2045,1022)
 insert into PageImage (PageID,ImageID) VALUES (2047,1022)
 insert into PageImage (PageID,ImageID) VALUES (2046,1022)
 insert into PageImage (PageID,ImageID) VALUES (2049,1022)

 select * from Page

