-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

/*REGISTRO*/
CREATE PROCEDURE LoginUsuario
	-- Add the parameters for the stored procedure here
	@pUsername varchar, @pContrase�a varchar
AS
BEGIN
	SELECT * FROM Usuario WHERE @pUsername= Username AND @pContrase�a=Contrase�a 
END
GO

CREATE PROCEDURE Login_VerificarContrase�a
	-- Add the parameters for the stored procedure here
	@Contrase�a varchar
AS
BEGIN
	SELECT Contrase�a FROM Usuario WHERE  @Contrase�a=Contrase�a 
END
GO

CREATE PROCEDURE Registro_VerificarExistencia
	-- Add the parameters for the stored procedure here
	@Username varchar
AS
BEGIN
	SELECT Username FROM Usuario WHERE @Username= Username
END
GO

CREATE PROCEDURE Registro
	-- Add the parameters for the stored procedure here
	@Username varchar, @Contrase�a varchar, @Mail varchar
AS
BEGIN
	INSERT INTO Usuario(Username, Contrase�a, Mail) VALUES (@Username, @Contrase�a, @Mail)
END
GO

CREATE PROCEDURE OlvideMiContrase�a
	-- Add the parameters for the stored procedure here
	@Mail varchar
AS
BEGIN
	SELECT Contrase�a FROM Usuario WHERE @Mail=Mail
END
GO

/*------------------------------------------------------------------------------------------------------------*/
/*CATEGORIA*/
CREATE PROCEDURE CargarCategoriaCard
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT Categoria.* FROM Categoria 
END
GO

/*CARROUSEL*/
CREATE PROCEDURE [dbo].[CargarRecetasCarrousel]
AS
BEGIN
	SELECT Receta.* FROM Receta_Carrousel 
		INNER JOIN Receta ON Receta.IdReceta = Receta_Carrousel.IdReceta
END

/*USUARIO*/
CREATE PROCEDURE CargarInfoUsuario
	-- Add the parameters for the stored procedure here
	@IdUsuario INT
AS
BEGIN
	SELECT Mail, Username, Foto FROM Usuario WHERE @IdUsuario=IdUsuario
END
GO

/* RECETAS*/
CREATE PROCEDURE CargarReceta
	-- Add the parameters for the stored procedure here
	@IdReceta INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdReceta=IdReceta
END
GO

/* BUSCADOR*/
CREATE PROCEDURE BuscarPorReceta
	-- Add the parameters for the stored procedure here
	@Titulo varchar
AS
BEGIN
	SELECT * FROM Receta WHERE @Titulo=Titulo
END
GO

CREATE PROCEDURE BuscarPorIngrediente
	-- Add the parameters for the stored procedure here
	@NombreIngrediente varchar
AS
BEGIN
	SELECT IdIngrediente FROM Ingrediente WHERE @NombreIngrediente = Nombre_Ingrediente and IdIngrediente IN (SELECT IdReceta FROM RecetaxIngrediente)
END
GO

CREATE PROCEDURE CargarRecetaxCategoria
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdCategoria=IdCategoria
END
GO

CREATE PROCEDURE CargarCategoriaxId
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Categoria WHERE @IdCategoria=IdCategoria
END
GO

CREATE PROCEDURE AgregarReceta
	-- Add the parameters for the stored procedure here
	@IdCategoria INT, @Imagen varchar(500), @Titulo varchar(150), @Descripcion varchar(150),@Pasos INT,@CantidadPersonas INT,@Tiempo INT,@Precio INT,@Video varchar(650)
AS
BEGIN
	INSERT INTO Receta (Imagen, Titulo, Descripcion, Pasos, CantidadPersonas, Tiempo, Precio, Video, IdCategoria)
	VALUES (@Imagen, @Titulo, @Descripcion, @Pasos, @CantidadPersonas, @Tiempo, @Precio, @Video, @IdCategoria)
END
GO
