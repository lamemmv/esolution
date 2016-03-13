USE [master]
GO
/****** Object:  Database [esolution]    Script Date: 03/13/2016 17:05:56 ******/
CREATE DATABASE [esolution] ON  PRIMARY 
( NAME = N'esolution', FILENAME = N'D:\data_sql\data-2008-r2\esolution.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'esolution_log', FILENAME = N'D:\data_sql\log-2008-r2\esolution_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [esolution] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [esolution].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [esolution] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [esolution] SET ANSI_NULLS OFF
GO
ALTER DATABASE [esolution] SET ANSI_PADDING OFF
GO
ALTER DATABASE [esolution] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [esolution] SET ARITHABORT OFF
GO
ALTER DATABASE [esolution] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [esolution] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [esolution] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [esolution] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [esolution] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [esolution] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [esolution] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [esolution] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [esolution] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [esolution] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [esolution] SET  DISABLE_BROKER
GO
ALTER DATABASE [esolution] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [esolution] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [esolution] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [esolution] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [esolution] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [esolution] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [esolution] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [esolution] SET  READ_WRITE
GO
ALTER DATABASE [esolution] SET RECOVERY FULL
GO
ALTER DATABASE [esolution] SET  MULTI_USER
GO
ALTER DATABASE [esolution] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [esolution] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'esolution', N'ON'
GO
USE [esolution]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/13/2016 17:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Category 1')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Category 2')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 03/13/2016 17:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[CategoryId] [bigint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (2, N'product 2', CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId]) VALUES (3, N'product 3', CAST(14.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  ForeignKey [FK_Product_Category1]    Script Date: 03/13/2016 17:05:57 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category1]
GO
