USE [master]
GO
/****** Object:  Database [Saveurs]    Script Date: 27/10/2023 13:46:11 ******/
CREATE DATABASE [Saveurs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Saveurs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Saveurs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Saveurs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Saveurs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Saveurs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Saveurs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Saveurs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Saveurs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Saveurs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Saveurs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Saveurs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Saveurs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Saveurs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Saveurs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Saveurs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Saveurs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Saveurs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Saveurs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Saveurs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Saveurs] SET RECOVERY FULL 
GO
ALTER DATABASE [Saveurs] SET  MULTI_USER 
GO
ALTER DATABASE [Saveurs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Saveurs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Saveurs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Saveurs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Saveurs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Saveurs', N'ON'
GO
ALTER DATABASE [Saveurs] SET QUERY_STORE = OFF
GO
USE [Saveurs]
GO
/****** Object:  User [alumno]    Script Date: 27/10/2023 13:46:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](200) NULL,
	[Descripcion] [varchar](500) NULL,
	[Imagen] [varchar](150) NULL,
 CONSTRAINT [PK__Categori__A3C02A100680C461] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comida_Card]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comida_Card](
	[IdComida] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdReceta] [int] NULL,
	[NombreComida] [varchar](150) NULL,
	[Imagen] [varchar](300) NULL,
	[Video] [varchar](300) NULL,
	[Titulo] [varchar](100) NULL,
 CONSTRAINT [PK__Comida_C__055A1AA3B1B57B8C] PRIMARY KEY CLUSTERED 
(
	[IdComida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[IdIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Ingrediente] [varchar](150) NULL,
	[Cantidad] [int] NULL,
	[IdReceta] [int] NULL,
 CONSTRAINT [PK__Ingredie__3DA4DD60CCC790B6] PRIMARY KEY CLUSTERED 
(
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[Imagen] [varchar](200) NULL,
	[Titulo] [varchar](150) NULL,
	[IdUsuario] [int] NULL,
	[Pasos] [varchar](400) NULL,
 CONSTRAINT [PK__Receta__2CEFF1570F5578D6] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta_Carrousel]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta_Carrousel](
	[IdRecetaCarrousel] [int] IDENTITY(1,1) NOT NULL,
	[DeescripcionRecetaCarrousel] [varchar](300) NULL,
	[Tiempo] [int] NULL,
	[Precio] [int] NULL,
	[CantidadPersonas] [int] NULL,
	[IdCategoria] [int] NULL,
 CONSTRAINT [PK__Receta_C__1441D1D26561C84A] PRIMARY KEY CLUSTERED 
(
	[IdRecetaCarrousel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/10/2023 13:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [varchar](200) NULL,
	[Contraseña] [varchar](200) NULL,
	[Username] [varchar](50) NULL,
 CONSTRAINT [PK__Usuario__5B65BF97C9B713E0] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comida_Card]  WITH CHECK ADD  CONSTRAINT [FK_Comida_Card_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Comida_Card] CHECK CONSTRAINT [FK_Comida_Card_Categoria]
GO
ALTER TABLE [dbo].[Comida_Card]  WITH CHECK ADD  CONSTRAINT [FK_Comida_Card_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Comida_Card] CHECK CONSTRAINT [FK_Comida_Card_Receta]
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_Ingrediente_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [FK_Ingrediente_Receta]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Usuario]
GO
ALTER TABLE [dbo].[Receta_Carrousel]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Carrousel_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Receta_Carrousel] CHECK CONSTRAINT [FK_Receta_Carrousel_Categoria]
GO
USE [master]
GO
ALTER DATABASE [Saveurs] SET  READ_WRITE 
GO
