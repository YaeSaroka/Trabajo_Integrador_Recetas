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
	@Username varchar, @Contraseņa varchar
AS
BEGIN
	SELECT * FROM Usuario WHERE @Username= Username AND @Contraseņa=Contraseņa 
END
GO

CREATE PROCEDURE Login_VerificarContraseņa
	-- Add the parameters for the stored procedure here
	@Contraseņa varchar
AS
BEGIN
	SELECT Contraseņa FROM Usuario WHERE  @Contraseņa=Contraseņa 
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
	@Username varchar, @Contraseņa varchar, @Mail varchar
AS
BEGIN
	INSERT INTO Usuario(Username, Contraseņa, Mail) VALUES (@Username, @Contraseņa, @Mail)
END
GO

CREATE PROCEDURE OlvideMiContraseņa
	-- Add the parameters for the stored procedure here
	@Mail varchar
AS
BEGIN
	SELECT Contraseņa FROM Usuario WHERE @Mail=Mail
END
GO

/*------------------------------------------------------------------------------------------------------------*/
/*CATEGORIA*/
CREATE PROCEDURE CargarCategoriaCard
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Categoria WHERE IdCategoria=@IdCategoria
END
GO

/*CARROUSEL*/
CREATE PROCEDURE CargarRecetasCarrousel
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT * FROM Receta WHERE IdReceta IN (SELECT IdReceta FROM Receta_Carrousel)
END
GO

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
