USE [master]
GO
/****** Object:  Database [AlmacenSD]    Script Date: 7/4/2019 10:48:32 a. m. ******/
CREATE DATABASE [AlmacenSD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmacenSD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AlmacenSD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmacenSD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AlmacenSD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AlmacenSD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmacenSD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmacenSD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmacenSD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmacenSD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmacenSD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmacenSD] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmacenSD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmacenSD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmacenSD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmacenSD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmacenSD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmacenSD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmacenSD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmacenSD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmacenSD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmacenSD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AlmacenSD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmacenSD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmacenSD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmacenSD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmacenSD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmacenSD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmacenSD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmacenSD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AlmacenSD] SET  MULTI_USER 
GO
ALTER DATABASE [AlmacenSD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmacenSD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmacenSD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmacenSD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmacenSD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlmacenSD] SET QUERY_STORE = OFF
GO
USE [AlmacenSD]
GO
/****** Object:  Table [dbo].[Chofer]    Script Date: 7/4/2019 10:48:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chofer](
	[ChoferId] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Cedula] [varchar](50) NULL,
	[Licencia] [varchar](50) NULL,
 CONSTRAINT [PK_Chofer] PRIMARY KEY CLUSTERED 
(
	[ChoferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 7/4/2019 10:48:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Cedula] [varchar](50) NULL,
	[Direccion] [varchar](max) NULL,
	[Telefono] [varchar](13) NULL,
	[Correo Electronico] [varchar](50) NULL,
	[Sexo] [char](1) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Despacho de Productos.]    Script Date: 7/4/2019 10:48:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Despacho de Productos.](
	[Cliente/EmpresaId] [int] NOT NULL,
	[ChoferId] [varchar](50) NULL,
	[MercanciaId] [int] NULL,
	[Cantidad] [bigint] NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Despacho de Productos.] PRIMARY KEY CLUSTERED 
(
	[Cliente/EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 7/4/2019 10:48:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[EmpresaId] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [varchar](13) NULL,
	[Direccion] [varchar](max) NULL,
	[Correo Electronico] [varchar](50) NULL,
	[RNC] [varchar](50) NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden de Compras.]    Script Date: 7/4/2019 10:48:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden de Compras.](
	[SuplidorId] [int] NOT NULL,
	[MercanciaId] [int] NULL,
	[Cantidad] [bigint] NULL,
 CONSTRAINT [PK_Orden de Compras.] PRIMARY KEY CLUSTERED 
(
	[SuplidorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recepcion de Mercancia.]    Script Date: 7/4/2019 10:48:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recepcion de Mercancia.](
	[MercanciaId] [int] NOT NULL,
	[Descripcion del Producto] [varchar](50) NULL,
	[Cantidad] [bigint] NULL,
 CONSTRAINT [PK_Recepcion de Mercancia.] PRIMARY KEY CLUSTERED 
(
	[MercanciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recepcion de Productos.]    Script Date: 7/4/2019 10:48:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recepcion de Productos.](
	[DistribuidorId] [int] NOT NULL,
	[Descripcion del Producto] [varchar](50) NULL,
	[Cantidad] [bigint] NULL,
	[Chofer] [varchar](50) NULL,
 CONSTRAINT [PK_Recepcion de Productos.] PRIMARY KEY CLUSTERED 
(
	[DistribuidorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'1', N' Juan Jose', N'Alcantara Rodriguez', N'400-0000000-1', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'10', N'Ariel', N'Lopez Adames', N'400-00000009-1', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'2', N'Ricardo', N'Montez', N'400-0000000-2', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'3', N'Patricio', N'Villanueva Smith ', N'400-0000000-3', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'4', N'Manuel ', N'Diaz Peres', N'400-0000000-4', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'5', N'Roberto', N'Cadenas Romero', N'400-0000000-5', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'6', N'Miguel Angel', N'Ortega Diez', N'400-0000000-6', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'7', N'Bladimir ', N'Alcantaras Torrez', N'400-0000000-7', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'8', N'Carlos Luis', N'Romero Mejia', N'400-0000000-8', N'Activa')
INSERT [dbo].[Chofer] ([ChoferId], [Nombre], [Apellido], [Cedula], [Licencia]) VALUES (N'9', N'Luis ', N'Areas de los Santos', N'400-0000000-9', N'Activa')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (1, N'Genesis ', N'Mota Feliz', N'300-0000000-1', N'San Juan de la maguana', N'809-000-0000', N'motagenesis@gmail.com', N'F')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (2, N'Victor', N'Areas', N'300-0000000-2', N'Santo Domingo', N'809-000-0001', N'VictorA123@gmail.com', N'M')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (3, N'Samuel', N'Castillo Acevedo', N'300-0000000-3', N'La Vega', N'829-000-8907', N'Samuel65544@gmail.com', N'M')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (4, N'Chavely', N'Montez Lora', N'300-0000000-4', N'El puerto de Villa Altagracia', N'829-876-0987', N'ChayDf56@gmail.com', N'F')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (5, N'Kelvin Manuel', N'Mejia de Los Santos', N'300-0000000-5', N'Los Prados', N'849-876-9877', N'KmRg564@hotmail.com', N'M')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (6, N'Juana', N'Uribe Felix', N'300-0000000-6', N'Santo Domingo Este', N'849-346-8627', N'UribeF@gmail.com', N'F')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (7, N'Wilson Miguel', N'Mota Sanchez', N'300-0000000-7', N'El Cibao', N'809-987-3455', N'WillFM@gmail.com', N'M')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (8, N'Joseph ', N'Romero Herrera', N'300-0000000-8', N'Cotui', N'809-543-1234', N'herreratamato34@gmail.com', N'M')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (9, N'Irelis', N'de Jesus Quezada', N'300-0000000-9', N'Bonao', N'849-323-3983', N'dejesusirelis@hotmail.com', N'F')
INSERT [dbo].[Cliente] ([ClienteId], [Nombre], [Apellido], [Cedula], [Direccion], [Telefono], [Correo Electronico], [Sexo]) VALUES (10, N'Dennis', N'Alcantara Calderon', N'345-0000000-9', N'Villa Consuelo', N'809-378-5646', N'noodDenisLic@hotmail.com', N'F')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (1, N'1', 1, 183, N'Borrador de goma')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (2, N'5', 6, 647, N'Catedra')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (3, N'3', 2, 389, N'Lapicero Mate')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (4, N'8', 9, 574, N'Lapiz para colorear')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (5, N'2', 4, 123, N'Hoja Bon')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (6, N'9', 7, 145, N'Mochila')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (7, N'6', 3, 1678, N'Cartulinas')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (8, N'7', 5, 1890, N'Cuadernos')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (9, N'4', 8, 1654, N'Sacapuntas')
INSERT [dbo].[Despacho de Productos.] ([Cliente/EmpresaId], [ChoferId], [MercanciaId], [Cantidad], [Descripcion]) VALUES (10, N'10', 10, 166, N'Pinceles')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (1, N'Motor', N'809-000-0090', N'SD', N'motors56@gmail.com', N'234-77777-1')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (2, N'Luis', N'809-765-7898', N'SD', N'Luisvariedad46@hotmail.com', N'456-98756-9')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (3, N'Innovation ', N'809-098-8759', N'SD', N'aotro_nivel13@Gmail.com', N'345-78689-0')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (4, N'La Fuerza', N'809-765-8765', N'SD', N' vuggtdzssdr@gmail.com', N'130-75643-5')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (5, N'Ramirrez', N'809-632-8536', N'SD', N'gdcdgfvfg@gmail.com', N'124-67534-3')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (6, N'Florentina', N'809-324-4567', N'SD', N'SEETHECLIMB@gmail.com', N'654-75437-9')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (7, N'El Panita', N'809-643-5643', N'SD', N'Panita01@gmail.com', N'432-52383-8')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (8, N'Spidia', N'809-231-6543', N'SD', N'MONTEROEXXPRES@Gmail.com', N'123-65437-7')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (9, N'Milano', N'809-356-9873', N'SD', N'Millanodseg@gail.com', N'098-56432-4')
INSERT [dbo].[Empresa] ([EmpresaId], [Nombre], [Telefono], [Direccion], [Correo Electronico], [RNC]) VALUES (10, N'RGT', N'809-452-2289', N'SD', N'RGTvar@gmail.con', N'986-98674-7')
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (1, 1, 234)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (2, 3, 123)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (3, 2, 234)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (4, 8, 321)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (5, 6, 241)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (6, 5, 342)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (7, 4, 123)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (8, 10, 324)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (9, 7, 123)
INSERT [dbo].[Orden de Compras.] ([SuplidorId], [MercanciaId], [Cantidad]) VALUES (10, 9, 231)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (1, N'Borrador de Goma Pequeña', 11856)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (2, N'Lapiceros Mate', 23478)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (3, N'Cartulina', 987)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (4, N'Hoja Bon', 647)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (5, N'Cuadernos', 367)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (6, N'Catedra', 284)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (7, N'Mochila', 345)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (8, N'Sacapuntas', 643)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (9, N'Lapiz para colorear', 358)
INSERT [dbo].[Recepcion de Mercancia.] ([MercanciaId], [Descripcion del Producto], [Cantidad]) VALUES (10, N'Pinceles', 489)
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (1, N'Chinografo 2.0, 0.5 y 0.7', 76543, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (2, N'Carpetas Fundas ', 89, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (3, N'Cuadernos de 200 pag', 400, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (4, N'Papel Bon', 589, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (5, N'Papel Fabriano', 654, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (6, N'Libros de Gestion por Proceso', 102, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (7, N'Reglas T', 876, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (8, N'Lapicero Mate por unidad', 165, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (9, N'Borra de Goma', 453, N'administrado')
INSERT [dbo].[Recepcion de Productos.] ([DistribuidorId], [Descripcion del Producto], [Cantidad], [Chofer]) VALUES (10, N'Corrector Mate Liquido', 324, N'administrado')
ALTER TABLE [dbo].[Despacho de Productos.]  WITH CHECK ADD  CONSTRAINT [FK_Despacho de Productos._Chofer] FOREIGN KEY([ChoferId])
REFERENCES [dbo].[Chofer] ([ChoferId])
GO
ALTER TABLE [dbo].[Despacho de Productos.] CHECK CONSTRAINT [FK_Despacho de Productos._Chofer]
GO
ALTER TABLE [dbo].[Despacho de Productos.]  WITH CHECK ADD  CONSTRAINT [FK_Despacho de Productos._Cliente] FOREIGN KEY([Cliente/EmpresaId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[Despacho de Productos.] CHECK CONSTRAINT [FK_Despacho de Productos._Cliente]
GO
ALTER TABLE [dbo].[Despacho de Productos.]  WITH CHECK ADD  CONSTRAINT [FK_Despacho de Productos._Empresa] FOREIGN KEY([Cliente/EmpresaId])
REFERENCES [dbo].[Empresa] ([EmpresaId])
GO
ALTER TABLE [dbo].[Despacho de Productos.] CHECK CONSTRAINT [FK_Despacho de Productos._Empresa]
GO
ALTER TABLE [dbo].[Despacho de Productos.]  WITH CHECK ADD  CONSTRAINT [FK_Despacho de Productos._Recepcion de Mercancia.] FOREIGN KEY([MercanciaId])
REFERENCES [dbo].[Recepcion de Mercancia.] ([MercanciaId])
GO
ALTER TABLE [dbo].[Despacho de Productos.] CHECK CONSTRAINT [FK_Despacho de Productos._Recepcion de Mercancia.]
GO
ALTER TABLE [dbo].[Orden de Compras.]  WITH CHECK ADD  CONSTRAINT [FK_Orden de Compras._Recepcion de Mercancia.] FOREIGN KEY([MercanciaId])
REFERENCES [dbo].[Recepcion de Mercancia.] ([MercanciaId])
GO
ALTER TABLE [dbo].[Orden de Compras.] CHECK CONSTRAINT [FK_Orden de Compras._Recepcion de Mercancia.]
GO
ALTER TABLE [dbo].[Recepcion de Mercancia.]  WITH CHECK ADD  CONSTRAINT [FK_Recepcion de Mercancia._Recepcion de Productos.] FOREIGN KEY([MercanciaId])
REFERENCES [dbo].[Recepcion de Productos.] ([DistribuidorId])
GO
ALTER TABLE [dbo].[Recepcion de Mercancia.] CHECK CONSTRAINT [FK_Recepcion de Mercancia._Recepcion de Productos.]
GO
USE [master]
GO
ALTER DATABASE [AlmacenSD] SET  READ_WRITE 
GO
