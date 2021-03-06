USE [master]
GO
/****** Object:  Database [SupermarketsChain]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
CREATE DATABASE [SupermarketsChain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SupermarketsChain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SupermarketsChain.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SupermarketsChain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SupermarketsChain_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SupermarketsChain] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SupermarketsChain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SupermarketsChain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SupermarketsChain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SupermarketsChain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SupermarketsChain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SupermarketsChain] SET ARITHABORT OFF 
GO
ALTER DATABASE [SupermarketsChain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SupermarketsChain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SupermarketsChain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SupermarketsChain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SupermarketsChain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SupermarketsChain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SupermarketsChain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SupermarketsChain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SupermarketsChain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SupermarketsChain] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SupermarketsChain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SupermarketsChain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SupermarketsChain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SupermarketsChain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SupermarketsChain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SupermarketsChain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SupermarketsChain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SupermarketsChain] SET RECOVERY FULL 
GO
ALTER DATABASE [SupermarketsChain] SET  MULTI_USER 
GO
ALTER DATABASE [SupermarketsChain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SupermarketsChain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SupermarketsChain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SupermarketsChain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SupermarketsChain] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SupermarketsChain', N'ON'
GO
USE [SupermarketsChain]
GO
/****** Object:  Schema [o2ss]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
CREATE SCHEMA [o2ss]
GO
/****** Object:  Table [dbo].[MeasurmentUnits]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MeasurmentUnits](
	[Id] [numeric](38, 0) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [MEASURMENT_UNITS_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [numeric](38, 0) NOT NULL,
	[Name] [varchar](40) NOT NULL,
	[VendorId] [numeric](38, 0) NOT NULL,
	[MeasurmentUnitId] [numeric](38, 0) NOT NULL,
	[Price] [numeric](19, 4) NOT NULL,
 CONSTRAINT [PRODUCTS_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [numeric](38, 0) NOT NULL,
	[SoldOn] [datetime2](0) NOT NULL,
	[SupermarketId] [numeric](38, 0) NOT NULL,
	[ProductId] [numeric](38, 0) NOT NULL,
	[Quantity] [numeric](38, 0) NOT NULL,
 CONSTRAINT [SALES_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supermarkets]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supermarkets](
	[Id] [numeric](38, 0) NOT NULL,
	[Name] [varchar](60) NOT NULL,
 CONSTRAINT [SUPERMARKETS_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 16.3.2015 г. 14:00:59 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendors](
	[Id] [numeric](38, 0) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [VENDORS_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MeasurmentUnits] ([Id], [Name]) VALUES (CAST(1 AS Numeric(38, 0)), N'liter')
INSERT [dbo].[MeasurmentUnits] ([Id], [Name]) VALUES (CAST(2 AS Numeric(38, 0)), N'kilograms')
INSERT [dbo].[MeasurmentUnits] ([Id], [Name]) VALUES (CAST(3 AS Numeric(38, 0)), N'packs')
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(1 AS Numeric(38, 0)), N'Chai', CAST(1 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(2 AS Numeric(38, 0)), N'Chang', CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(19.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(3 AS Numeric(38, 0)), N'Aniseed Syrup', CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(10.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(4 AS Numeric(38, 0)), N'Chef Anton''s Cajun Seasoning', CAST(2 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(22.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(5 AS Numeric(38, 0)), N'Chef Anton''s Gumbo Mix', CAST(2 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(21.3500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(6 AS Numeric(38, 0)), N'Grandma''s Boysenberry Spread', CAST(3 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(25.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(7 AS Numeric(38, 0)), N'Uncle Bob''s Organic Dried Pears', CAST(3 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(30.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(8 AS Numeric(38, 0)), N'Northwoods Cranberry Sauce', CAST(3 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(40.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(9 AS Numeric(38, 0)), N'Mishi Kobe Niku', CAST(4 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(97.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(10 AS Numeric(38, 0)), N'Ikura', CAST(4 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(31.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(11 AS Numeric(38, 0)), N'Queso Cabrales', CAST(5 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(21.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(12 AS Numeric(38, 0)), N'Queso Manchego La Pastora', CAST(5 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(38.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(13 AS Numeric(38, 0)), N'Konbu', CAST(6 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(6.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(14 AS Numeric(38, 0)), N'Tofu', CAST(6 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(23.2500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(15 AS Numeric(38, 0)), N'Genen Shouyu', CAST(6 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(15.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(16 AS Numeric(38, 0)), N'Pavlova', CAST(7 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(17.4500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(17 AS Numeric(38, 0)), N'Alice Mutton', CAST(7 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(39.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(18 AS Numeric(38, 0)), N'Carnarvon Tigers', CAST(7 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(62.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(19 AS Numeric(38, 0)), N'Teatime Chocolate Biscuits', CAST(8 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(9.2000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(20 AS Numeric(38, 0)), N'Sir Rodney''s Marmalade', CAST(8 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(81.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(21 AS Numeric(38, 0)), N'Sir Rodney''s Scones', CAST(8 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(10.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(22 AS Numeric(38, 0)), N'Gustaf''s Knackebrod', CAST(9 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(21.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(23 AS Numeric(38, 0)), N'Tunnbrod', CAST(9 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(9.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(24 AS Numeric(38, 0)), N'Guarana Fantastica', CAST(10 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(4.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(25 AS Numeric(38, 0)), N'NuNuCa Nu?-Nougat-Creme', CAST(11 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(14.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(26 AS Numeric(38, 0)), N'Gumbar Gummibarchen', CAST(11 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(31.2300 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(27 AS Numeric(38, 0)), N'Schoggi Schokolade', CAST(11 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(43.9000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(28 AS Numeric(38, 0)), N'Rossle Sauerkraut', CAST(12 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(45.6000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(29 AS Numeric(38, 0)), N'Thuringer Rostbratwurst', CAST(12 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(123.7900 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(30 AS Numeric(38, 0)), N'Nord-Ost Matjeshering', CAST(13 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(25.8900 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(31 AS Numeric(38, 0)), N'Gorgonzola Telino', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(32 AS Numeric(38, 0)), N'Mascarpone Fabioli', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(32.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(33 AS Numeric(38, 0)), N'Geitost', CAST(15 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(2.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(34 AS Numeric(38, 0)), N'Sasquatch Ale', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(14.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(35 AS Numeric(38, 0)), N'Steeleye Stout', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(36 AS Numeric(38, 0)), N'Inlagd Sill', CAST(17 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(19.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(37 AS Numeric(38, 0)), N'Gravad lax', CAST(17 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(26.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(38 AS Numeric(38, 0)), N'Cote de Blaye', CAST(18 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(263.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(39 AS Numeric(38, 0)), N'Chartreuse verte', CAST(18 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(40 AS Numeric(38, 0)), N'Boston Crab Meat', CAST(19 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(18.4000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(41 AS Numeric(38, 0)), N'Jack''s New England Clam Chowder', CAST(19 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(9.6500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(42 AS Numeric(38, 0)), N'Singaporean Hokkien Fried Mee', CAST(20 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(14.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(43 AS Numeric(38, 0)), N'Ipoh Coffee', CAST(20 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(46.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(44 AS Numeric(38, 0)), N'Gula Malacca', CAST(20 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(19.4500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(45 AS Numeric(38, 0)), N'Rogede sild', CAST(21 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(9.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(46 AS Numeric(38, 0)), N'Spegesild', CAST(21 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(47 AS Numeric(38, 0)), N'Zaanse koeken', CAST(22 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(9.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(48 AS Numeric(38, 0)), N'Chocolade', CAST(22 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(12.7500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(49 AS Numeric(38, 0)), N'Maxilaku', CAST(23 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(20.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(50 AS Numeric(38, 0)), N'Valkoinen suklaa', CAST(23 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(16.2500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(51 AS Numeric(38, 0)), N'Manjimup Dried Apples', CAST(24 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(53.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(52 AS Numeric(38, 0)), N'Filo Mix', CAST(24 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(7.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(53 AS Numeric(38, 0)), N'Perth Pasties', CAST(24 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(32.8000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(54 AS Numeric(38, 0)), N'Tourtiere', CAST(25 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(7.4500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(55 AS Numeric(38, 0)), N'Pate chinois', CAST(25 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(24.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(56 AS Numeric(38, 0)), N'Gnocchi di nonna Alice', CAST(26 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(38.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(57 AS Numeric(38, 0)), N'Ravioli Angelo', CAST(26 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(19.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(58 AS Numeric(38, 0)), N'Escargots de Bourgogne', CAST(27 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(13.2500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(59 AS Numeric(38, 0)), N'Raclette Courdavault', CAST(28 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(55.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(60 AS Numeric(38, 0)), N'Camembert Pierrot', CAST(28 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(34.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(61 AS Numeric(38, 0)), N'Sirop d''erable', CAST(29 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(28.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(62 AS Numeric(38, 0)), N'Tarte au sucre', CAST(29 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(49.3000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(63 AS Numeric(38, 0)), N'Vegie-spread', CAST(7 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(43.9000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(64 AS Numeric(38, 0)), N'Wimmers gute Semmelknodel', CAST(12 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(33.2500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(65 AS Numeric(38, 0)), N'Louisiana Fiery Hot Pepper Sauce', CAST(2 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(21.0500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(66 AS Numeric(38, 0)), N'Louisiana Hot Spiced Okra', CAST(2 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(17.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(67 AS Numeric(38, 0)), N'Laughing Lumberjack Lager', CAST(16 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(14.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(68 AS Numeric(38, 0)), N'Scottish Longbreads', CAST(8 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(12.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(69 AS Numeric(38, 0)), N'Gudbrandsdalsost', CAST(15 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(36.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(70 AS Numeric(38, 0)), N'Outback Lager', CAST(7 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(15.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(71 AS Numeric(38, 0)), N'Flotemysost', CAST(15 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(21.5000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(72 AS Numeric(38, 0)), N'Mozzarella di Giovanni', CAST(14 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(34.8000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(73 AS Numeric(38, 0)), N'Rod Kaviar', CAST(17 AS Numeric(38, 0)), CAST(3 AS Numeric(38, 0)), CAST(15.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(74 AS Numeric(38, 0)), N'Longlife Tofu', CAST(4 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(10.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(75 AS Numeric(38, 0)), N'Rhonbrau Klosterbier', CAST(12 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(7.7500 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(76 AS Numeric(38, 0)), N'Lakkalikoori', CAST(23 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(18.0000 AS Numeric(19, 4)))
INSERT [dbo].[Products] ([Id], [Name], [VendorId], [MeasurmentUnitId], [Price]) VALUES (CAST(77 AS Numeric(38, 0)), N'Original Frankfurter grune So?e', CAST(12 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(13.0000 AS Numeric(19, 4)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(1 AS Numeric(38, 0)), CAST(N'2015-02-05 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(33 AS Numeric(38, 0)), CAST(139 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(2 AS Numeric(38, 0)), CAST(N'2015-02-02 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(30 AS Numeric(38, 0)), CAST(128 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(3 AS Numeric(38, 0)), CAST(N'2015-01-22 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(65 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(4 AS Numeric(38, 0)), CAST(N'2015-03-03 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(68 AS Numeric(38, 0)), CAST(278 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(5 AS Numeric(38, 0)), CAST(N'2015-02-22 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(55 AS Numeric(38, 0)), CAST(228 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(6 AS Numeric(38, 0)), CAST(N'2015-03-04 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(69 AS Numeric(38, 0)), CAST(282 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(7 AS Numeric(38, 0)), CAST(N'2015-03-06 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(72 AS Numeric(38, 0)), CAST(296 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(8 AS Numeric(38, 0)), CAST(N'2015-01-15 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(5 AS Numeric(38, 0)), CAST(29 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(9 AS Numeric(38, 0)), CAST(N'2015-01-22 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(65 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(10 AS Numeric(38, 0)), CAST(N'2015-03-11 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(75 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(11 AS Numeric(38, 0)), CAST(N'2015-01-24 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(25 AS Numeric(38, 0)), CAST(107 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(12 AS Numeric(38, 0)), CAST(N'2015-01-30 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(32 AS Numeric(38, 0)), CAST(136 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(13 AS Numeric(38, 0)), CAST(N'2015-02-04 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(22 AS Numeric(38, 0)), CAST(94 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(14 AS Numeric(38, 0)), CAST(N'2015-01-27 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(68 AS Numeric(38, 0)), CAST(279 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(15 AS Numeric(38, 0)), CAST(N'2015-03-03 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(43 AS Numeric(38, 0)), CAST(180 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(16 AS Numeric(38, 0)), CAST(N'2015-02-12 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(57 AS Numeric(38, 0)), CAST(234 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(17 AS Numeric(38, 0)), CAST(N'2015-02-23 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(39 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(18 AS Numeric(38, 0)), CAST(N'2015-01-17 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(42 AS Numeric(38, 0)), CAST(176 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(19 AS Numeric(38, 0)), CAST(N'2015-02-12 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(36 AS Numeric(38, 0)), CAST(153 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(20 AS Numeric(38, 0)), CAST(N'2015-02-07 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(80 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(21 AS Numeric(38, 0)), CAST(N'2015-01-24 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(54 AS Numeric(38, 0)), CAST(225 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(22 AS Numeric(38, 0)), CAST(N'2015-02-21 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(49 AS Numeric(38, 0)), CAST(202 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(23 AS Numeric(38, 0)), CAST(N'2015-02-17 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(48 AS Numeric(38, 0)), CAST(200 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(24 AS Numeric(38, 0)), CAST(N'2015-02-16 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(66 AS Numeric(38, 0)), CAST(270 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(25 AS Numeric(38, 0)), CAST(N'2015-03-02 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(58 AS Numeric(38, 0)), CAST(240 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(26 AS Numeric(38, 0)), CAST(N'2015-02-24 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(2 AS Numeric(38, 0)), CAST(16 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(27 AS Numeric(38, 0)), CAST(N'2015-01-12 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(1 AS Numeric(38, 0)), CAST(11 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(28 AS Numeric(38, 0)), CAST(N'2015-01-11 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(18 AS Numeric(38, 0)), CAST(78 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(29 AS Numeric(38, 0)), CAST(N'2015-01-24 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(60 AS Numeric(38, 0)), CAST(249 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(30 AS Numeric(38, 0)), CAST(N'2015-02-25 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(62 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(31 AS Numeric(38, 0)), CAST(N'2015-01-21 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(36 AS Numeric(38, 0)), CAST(151 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(32 AS Numeric(38, 0)), CAST(N'2015-02-07 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(14 AS Numeric(38, 0)), CAST(64 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(33 AS Numeric(38, 0)), CAST(N'2015-01-21 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(56 AS Numeric(38, 0)), CAST(233 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(34 AS Numeric(38, 0)), CAST(N'2015-02-22 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(4 AS Numeric(38, 0)), CAST(23 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(35 AS Numeric(38, 0)), CAST(N'2015-01-14 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(43 AS Numeric(38, 0)), CAST(180 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(36 AS Numeric(38, 0)), CAST(N'2015-02-12 00:00:00.0000000' AS DateTime2), CAST(3 AS Numeric(38, 0)), CAST(8 AS Numeric(38, 0)), CAST(39 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(37 AS Numeric(38, 0)), CAST(N'2015-03-11 00:00:00.0000000' AS DateTime2), CAST(4 AS Numeric(38, 0)), CAST(29 AS Numeric(38, 0)), CAST(123 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(38 AS Numeric(38, 0)), CAST(N'2015-01-17 00:00:00.0000000' AS DateTime2), CAST(1 AS Numeric(38, 0)), CAST(6 AS Numeric(38, 0)), CAST(32 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(39 AS Numeric(38, 0)), CAST(N'2015-02-02 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(17 AS Numeric(38, 0)), CAST(74 AS Numeric(38, 0)))
INSERT [dbo].[Sales] ([Id], [SoldOn], [SupermarketId], [ProductId], [Quantity]) VALUES (CAST(40 AS Numeric(38, 0)), CAST(N'2015-01-15 00:00:00.0000000' AS DateTime2), CAST(2 AS Numeric(38, 0)), CAST(12 AS Numeric(38, 0)), CAST(54 AS Numeric(38, 0)))
INSERT [dbo].[Supermarkets] ([Id], [Name]) VALUES (CAST(1 AS Numeric(38, 0)), N'Supermarket “Bay Ivan” – Zmeyovo')
INSERT [dbo].[Supermarkets] ([Id], [Name]) VALUES (CAST(2 AS Numeric(38, 0)), N'Supermarket “Plovdiv – Stolipinovo”')
INSERT [dbo].[Supermarkets] ([Id], [Name]) VALUES (CAST(3 AS Numeric(38, 0)), N'Supermarket “Kaspichan – Center”')
INSERT [dbo].[Supermarkets] ([Id], [Name]) VALUES (CAST(4 AS Numeric(38, 0)), N'Supermarket “Bourgas – Plaza”')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(1 AS Numeric(38, 0)), N'Exotic Liquids')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(2 AS Numeric(38, 0)), N'New Orleans Cajun Delights')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(3 AS Numeric(38, 0)), N'Grandma Kelly''s Homestead')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(4 AS Numeric(38, 0)), N'Tokyo Traders')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(5 AS Numeric(38, 0)), N'Cooperativa de Quesos ''Las Cabras''')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(6 AS Numeric(38, 0)), N'Mayumi''s')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(7 AS Numeric(38, 0)), N'Pavlova, Ltd.')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(8 AS Numeric(38, 0)), N'Specialty Biscuits, Ltd.')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(9 AS Numeric(38, 0)), N'PB Knackebrod AB')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(10 AS Numeric(38, 0)), N'Refrescos Americanas LTDA')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(11 AS Numeric(38, 0)), N'Heli Su?waren GmbH & Co. KG')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(12 AS Numeric(38, 0)), N'Plutzer Lebensmittelgro?markte AG')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(13 AS Numeric(38, 0)), N'Nord-Ost-Fisch Handelsgesellschaft mbH')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(14 AS Numeric(38, 0)), N'Formaggi Fortini s.r.l.')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(15 AS Numeric(38, 0)), N'Norske Meierier')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(16 AS Numeric(38, 0)), N'Bigfoot Breweries')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(17 AS Numeric(38, 0)), N'Svensk Sjofoda AB')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(18 AS Numeric(38, 0)), N'Aux joyeux ecclesiastiques')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(19 AS Numeric(38, 0)), N'New England Seafood Cannery')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(20 AS Numeric(38, 0)), N'Leka Trading')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(21 AS Numeric(38, 0)), N'Lyngbysild')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(22 AS Numeric(38, 0)), N'Zaanse Snoepfabriek')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(23 AS Numeric(38, 0)), N'Karkki Oy')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(24 AS Numeric(38, 0)), N'G''day, Mate')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(25 AS Numeric(38, 0)), N'Ma Maison')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(26 AS Numeric(38, 0)), N'Pasta Buttini s.r.l.')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(27 AS Numeric(38, 0)), N'Escargots Nouveaux')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(28 AS Numeric(38, 0)), N'Gai paturage')
INSERT [dbo].[Vendors] ([Id], [Name]) VALUES (CAST(29 AS Numeric(38, 0)), N'Forets d''erables')
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [PRODUCTS_MEASURMENT_UNIT_FK] FOREIGN KEY([MeasurmentUnitId])
REFERENCES [dbo].[MeasurmentUnits] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [PRODUCTS_MEASURMENT_UNIT_FK]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [PRODUCTS_VENDORS_FK] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [PRODUCTS_VENDORS_FK]
GO
ALTER TABLE [dbo].[Sales]  WITH NOCHECK ADD  CONSTRAINT [SALES_PRODUCTS_FK] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [SALES_PRODUCTS_FK]
GO
ALTER TABLE [dbo].[Sales]  WITH NOCHECK ADD  CONSTRAINT [SALES_SUPERMARKETS_FK] FOREIGN KEY([SupermarketId])
REFERENCES [dbo].[Supermarkets] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [SALES_SUPERMARKETS_FK]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.MEASURMENT_UNITS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeasurmentUnits', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.MEASURMENT_UNITS."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeasurmentUnits', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.MEASURMENT_UNITS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeasurmentUnits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.MEASURMENT_UNITS.MEASURMENT_UNITS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MeasurmentUnits', @level2type=N'CONSTRAINT',@level2name=N'MEASURMENT_UNITS_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS.VENDOR_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'VendorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS.MEASURMENT_UNIT_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'MeasurmentUnitId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS.PRICE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.PRODUCTS.PRODUCTS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'PRODUCTS_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.SALED_ON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SoldOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.SUPERMARKET_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'SupermarketId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.PRODUCT_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.QUANTITY' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SALES.SALES_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales', @level2type=N'CONSTRAINT',@level2name=N'SALES_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SUPERMARKETS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supermarkets', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SUPERMARKETS."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supermarkets', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SUPERMARKETS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supermarkets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.SUPERMARKETS.SUPERMARKETS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supermarkets', @level2type=N'CONSTRAINT',@level2name=N'SUPERMARKETS_PK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.VENDORS.ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendors', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.VENDORS."NAME"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendors', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.VENDORS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'NINA.VENDORS.VENDORS_PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendors', @level2type=N'CONSTRAINT',@level2name=N'VENDORS_PK'
GO
USE [master]
GO
ALTER DATABASE [SupermarketsChain] SET  READ_WRITE 
GO
