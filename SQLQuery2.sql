USE [Saveurs]
GO
/****** Object:  StoredProcedure [dbo].[CargarRecetasCarrousel]    Script Date: 16/11/2023 09:01:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*CARROUSEL*/
ALTER PROCEDURE [dbo].[CargarRecetasCarrousel]
AS
BEGIN
	SELECT Receta.* FROM Receta_Carrousel 
		INNER JOIN Receta ON Receta.IdReceta = Receta_Carrousel.IdReceta
END
