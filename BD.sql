USE [master]
GO
/****** Object:  Database [Saveurs]    Script Date: 2/11/2023 09:06:39 ******/
CREATE DATABASE [Saveurs]
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
/****** Object:  User [alumno]    Script Date: 2/11/2023 09:06:39 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 2/11/2023 09:06:39 ******/
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
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 2/11/2023 09:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[IdIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Ingrediente] [varchar](150) NOT NULL,
 CONSTRAINT [PK__Ingredie__3DA4DD60CCC790B6] PRIMARY KEY CLUSTERED 
(
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 2/11/2023 09:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[IdRecetaxIngrediente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Imagen] [varchar](200) NOT NULL,
	[Titulo] [varchar](150) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Pasos] [varchar](400) NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
	[Tiempo] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Video] [varchar](150) NOT NULL,
 CONSTRAINT [PK__Receta__2CEFF1570F5578D6] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta_Carrousel]    Script Date: 2/11/2023 09:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta_Carrousel](
	[IdRecetaCarrousel] [int] IDENTITY(1,1) NOT NULL,
	[IdReceta] [int] NOT NULL,
 CONSTRAINT [PK__Receta_C__1441D1D26561C84A] PRIMARY KEY CLUSTERED 
(
	[IdRecetaCarrousel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetaxIngrediente]    Script Date: 2/11/2023 09:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaxIngrediente](
	[IdRecetaxIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdReceta] [int] NOT NULL,
	[IdIngrediente] [int] NOT NULL,
 CONSTRAINT [PK_RecetaxIngrediente] PRIMARY KEY CLUSTERED 
(
	[IdRecetaxIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/11/2023 09:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Mail] [varchar](200) NOT NULL,
	[Contraseña] [varchar](200) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Usuario__5B65BF97C9B713E0] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (1, N'Pastas', N'Disfruta de la auténtica experiencia italiana en cada bocado', N'https://cloudfront-us-east-1.images.arcpublishing.com/elespectador/RCDPFEWWPRCGVLHJEA3ZK2HA3Y.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (2, N'Carnes', N'Calidad y sabor excepcionales en cada corte de carne', N'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2021/09/8-formas-cocinar-carne-sea-saludable-2458425.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (3, N'Postres', N'Delicias irresistibles para endulzar tu paladar', N'https://www.elmundoeats.com/wp-content/uploads/2020/06/FP-No-Bake-Raspberry-Cheesecake.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (4, N'Ensaladas', N'La naturaleza en tu plato', N'https://media.tiempodesanjuan.com/p/3fb734bc18707f57fc5b6a124d9272f1/adjuntos/331/imagenes/000/395/0000395009/790x0/smart/258594jpg.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (5, N'Pizzas', N' Sabores auténticos y combinaciones irresistibles', N'https://cdn0.recetasgratis.net/es/posts/1/9/3/pizza_casera_31391_orig.jpg')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen]) VALUES (6, N'Hamburguesas', N'Saborea la perfección entre dos panes', N'https://cdn.sanity.io/images/jsdrzfkj/production-esmx/5e2316cc629ede9cd6646163efeafc5486161751-6240x4160.jpg?w=800&h=533&fit=crop')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Categoria]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_RecetaxIngrediente] FOREIGN KEY([IdRecetaxIngrediente])
REFERENCES [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_RecetaxIngrediente]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Usuario]
GO
ALTER TABLE [dbo].[Receta_Carrousel]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Carrousel_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Receta_Carrousel] CHECK CONSTRAINT [FK_Receta_Carrousel_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1] FOREIGN KEY([IdIngrediente])
REFERENCES [dbo].[Ingrediente] ([IdIngrediente])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta1] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta1]
GO
USE [master]
GO
ALTER DATABASE [Saveurs] SET  READ_WRITE 
GO
