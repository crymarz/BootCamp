USE [master]
GO
/****** Object:  Database [DBBootCamp]    Script Date: 9/15/2021 6:41:57 PM ******/
CREATE DATABASE [DBBootCamp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBBootCamp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBBootCamp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBBootCamp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBBootCamp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBBootCamp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBBootCamp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBBootCamp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBBootCamp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBBootCamp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBBootCamp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBBootCamp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBBootCamp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBBootCamp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBBootCamp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBBootCamp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBBootCamp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBBootCamp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBBootCamp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBBootCamp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBBootCamp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBBootCamp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBBootCamp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBBootCamp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBBootCamp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBBootCamp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBBootCamp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBBootCamp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBBootCamp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBBootCamp] SET RECOVERY FULL 
GO
ALTER DATABASE [DBBootCamp] SET  MULTI_USER 
GO
ALTER DATABASE [DBBootCamp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBBootCamp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBBootCamp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBBootCamp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBBootCamp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBBootCamp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBBootCamp', N'ON'
GO
ALTER DATABASE [DBBootCamp] SET QUERY_STORE = OFF
GO
USE [DBBootCamp]
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[GuestID] [int] IDENTITY(1,1) NOT NULL,
	[GuestName] [varchar](50) NULL,
	[TavernID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[SupplyID] [int] NULL,
	[TavernID] [int] NULL,
	[DateUpdated] [datetime] NULL,
	[InventoryCount] [int] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rats]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rats](
	[TavernID] [int] NULL,
	[RatName] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceSales]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceSales](
	[ServiceSaleID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NULL,
	[GuestID] [int] NULL,
	[Price] [money] NULL,
	[DatePurchased] [datetime] NULL,
	[AmountPurchased] [int] NULL,
	[TavernID] [int] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[SupplyID] [int] NULL,
	[TavernID] [int] NULL,
	[ReceivedAmount] [int] NULL,
	[DateShipped] [datetime] NULL,
	[DateReceived] [datetime] NULL,
	[Cost] [money] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[SupplyID] [int] IDENTITY(1,1) NOT NULL,
	[UOM] [varchar](50) NULL,
	[SupplyName] [varchar](250) NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taverns]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taverns](
	[TavernID] [int] IDENTITY(1,1) NOT NULL,
	[TavernName] [varchar](50) NULL,
	[LocationID] [int] NULL,
	[OwnerID] [int] NULL,
	[FloorCount] [int] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TavernServices]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TavernServices](
	[ServiceID] [int] NULL,
	[TavernID] [int] NULL,
	[StatusID] [int] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/15/2021 6:41:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[RoleID] [int] NULL,
	[DateCreated] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Guests] ON 

INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (1, N'Bill', 1)
INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (2, N'Phil', 2)
INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (3, N'Chris', 3)
INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (4, N'Edward', 4)
INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (5, N'Finn', 5)
INSERT [dbo].[Guests] ([GuestID], [GuestName], [TavernID]) VALUES (6, N'Finn', 5)
SET IDENTITY_INSERT [dbo].[Guests] OFF
GO
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 1, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 1, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 1, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 1, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 1, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 1, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 1, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 2, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 2, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 2, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 2, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 2, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 2, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 2, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 3, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 3, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 3, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 3, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 3, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 3, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 3, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 4, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 4, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 4, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 4, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 4, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 4, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 4, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 5, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 5, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 5, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 5, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 5, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 5, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 5, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.083' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (1, 6, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 5, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (2, 6, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (3, 6, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (4, 6, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 15, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (5, 6, CAST(N'2021-09-14T00:00:00.000' AS DateTime), 10, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (6, 6, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 100, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
INSERT [dbo].[Inventory] ([SupplyID], [TavernID], [DateUpdated], [InventoryCount], [DateCreated]) VALUES (7, 6, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 20, CAST(N'2021-09-14T20:29:59.087' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (1, N'Bree', CAST(N'2021-09-14T19:07:02.387' AS DateTime))
INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (2, N'Worchester', CAST(N'2021-09-14T19:35:03.213' AS DateTime))
INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (3, N'Friendsville', CAST(N'2021-09-14T19:35:21.143' AS DateTime))
INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (4, N'Tabernacle', CAST(N'2021-09-14T19:35:48.937' AS DateTime))
INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (5, N'Velen', CAST(N'2021-09-14T19:35:59.890' AS DateTime))
INSERT [dbo].[Locations] ([LocationID], [LocationName], [DateCreated]) VALUES (6, N'Riften', CAST(N'2021-09-14T19:36:34.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (1, N'Craig', CAST(N'2021-09-14T19:22:32.517' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (1, N'Chris', CAST(N'2021-09-14T19:45:56.023' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (2, N'Edward', CAST(N'2021-09-14T19:46:10.467' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (3, N'Christian', CAST(N'2021-09-14T19:46:20.437' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (3, N'Crystal', CAST(N'2021-09-14T19:46:27.700' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (4, N'James', CAST(N'2021-09-14T19:46:34.583' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (4, N'Jack', CAST(N'2021-09-14T19:46:46.980' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (4, N'Robyn', CAST(N'2021-09-14T19:46:52.960' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (4, N'Nick', CAST(N'2021-09-14T19:46:55.690' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (4, N'Matt', CAST(N'2021-09-14T19:46:58.497' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (5, N'Mike', CAST(N'2021-09-14T19:47:07.603' AS DateTime))
INSERT [dbo].[Rats] ([TavernID], [RatName], [DateCreated]) VALUES (5, N'Dennis', CAST(N'2021-09-14T19:47:15.540' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [DateCreated]) VALUES (1, N'Tavern Owner', CAST(N'2021-09-14T19:20:13.880' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [DateCreated]) VALUES (2, N'Wanderer', CAST(N'2021-09-14T19:41:22.303' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [DateCreated]) VALUES (3, N'Bar Maid', CAST(N'2021-09-14T19:41:34.433' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [DateCreated]) VALUES (4, N'Knight', CAST(N'2021-09-14T19:42:07.213' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [DateCreated]) VALUES (5, N'Witcher', CAST(N'2021-09-14T19:44:15.790' AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (1, N'Pool', CAST(N'2021-09-15T18:12:04.560' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (2, N'Weapon Sharpening', CAST(N'2021-09-15T18:12:11.770' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (3, N'Knife Throwing', CAST(N'2021-09-15T18:12:19.003' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (4, N'Pie Eating', CAST(N'2021-09-15T18:12:26.997' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (5, N'Friendly Duel', CAST(N'2021-09-15T18:12:36.217' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (6, N'Dance Lesson', CAST(N'2021-09-15T18:12:46.160' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [DateCreated]) VALUES (7, N'Launder', CAST(N'2021-09-15T18:14:05.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceSales] ON 

INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (2, 1, 1, 50.0000, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (3, 6, 2, 100.0000, CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1, 2, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (4, 7, 3, 25.0000, CAST(N'2021-08-25T00:00:00.000' AS DateTime), 1, 3, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (5, 2, 4, 10.0000, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 1, 4, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (6, 1, 5, 50.0000, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2, 5, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (7, 6, 5, 100.0000, CAST(N'2021-09-10T00:00:00.000' AS DateTime), 1, 1, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (8, 2, 2, 15.0000, CAST(N'2021-04-13T00:00:00.000' AS DateTime), 1, 6, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (9, 3, 3, 75.0000, CAST(N'2020-11-15T00:00:00.000' AS DateTime), 1, 3, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (10, 1, 4, 50.0000, CAST(N'2021-02-19T00:00:00.000' AS DateTime), 1, 2, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
INSERT [dbo].[ServiceSales] ([ServiceSaleID], [ServiceID], [GuestID], [Price], [DatePurchased], [AmountPurchased], [TavernID], [DateCreated]) VALUES (11, 7, 1, 15.0000, CAST(N'2020-12-18T00:00:00.000' AS DateTime), 1, 4, CAST(N'2021-09-15T18:35:05.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[ServiceSales] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (2, 1, 1, 5, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (3, 2, 1, 10, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (4, 3, 1, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (5, 4, 1, 15, CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (6, 5, 1, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (7, 6, 1, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (8, 7, 1, 12, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (9, 1, 2, 5, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (10, 2, 2, 10, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (11, 3, 2, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (12, 4, 2, 15, CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (13, 5, 2, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (14, 6, 2, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (15, 7, 2, 12, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (16, 1, 3, 5, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (17, 2, 3, 10, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (18, 3, 3, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (19, 4, 3, 15, CAST(N'2021-06-04T00:00:00.000' AS DateTime), CAST(N'2021-07-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (20, 5, 3, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (21, 6, 3, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (22, 7, 3, 12, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (23, 1, 4, 5, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (24, 2, 4, 10, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-25T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (25, 3, 4, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (26, 4, 4, 15, CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.160' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (27, 5, 4, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (28, 6, 4, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (29, 7, 4, 12, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (30, 1, 5, 5, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-30T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (31, 2, 5, 10, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (32, 3, 5, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (33, 4, 5, 15, CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (34, 5, 5, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (35, 6, 5, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (36, 7, 5, 12, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (37, 1, 6, 5, CAST(N'2021-09-10T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 1000.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (38, 2, 6, 10, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-14T00:00:00.000' AS DateTime), 500.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (39, 3, 6, 3, CAST(N'2021-08-29T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 300.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (40, 4, 6, 15, CAST(N'2021-07-04T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 400.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (41, 5, 6, 30, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 700.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (42, 6, 6, 100, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 250.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
INSERT [dbo].[Shipments] ([ShipmentID], [SupplyID], [TavernID], [ReceivedAmount], [DateShipped], [DateReceived], [Cost], [DateCreated]) VALUES (43, 7, 6, 10, CAST(N'2021-01-07T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), 2000.0000, CAST(N'2021-09-15T18:01:14.163' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName], [DateCreated]) VALUES (1, N'Active', CAST(N'2021-09-15T18:14:59.573' AS DateTime))
INSERT [dbo].[Status] ([StatusID], [StatusName], [DateCreated]) VALUES (2, N'Inactive', CAST(N'2021-09-15T18:15:07.060' AS DateTime))
INSERT [dbo].[Status] ([StatusID], [StatusName], [DateCreated]) VALUES (3, N'Discontinued', CAST(N'2021-09-15T18:15:20.610' AS DateTime))
INSERT [dbo].[Status] ([StatusID], [StatusName], [DateCreated]) VALUES (4, N'Out of Stock', CAST(N'2021-09-15T18:15:24.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplies] ON 

INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (1, N'Gallon', N'Strong Ale', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (2, N'Gallon', N'Watered Ale', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (3, N'Pound', N'Cheese', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (4, N'Gallon', N'Water', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (5, N'Gallon', N'Wine', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (6, N'Ounce', N'Tabacco', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
INSERT [dbo].[Supplies] ([SupplyID], [UOM], [SupplyName], [DateCreated]) VALUES (7, N'Pound', N'Meat', CAST(N'2021-09-14T20:17:40.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[Supplies] OFF
GO
SET IDENTITY_INSERT [dbo].[Taverns] ON 

INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (1, N'Prancing Pony', 1, 1, 3, CAST(N'2021-09-14T19:02:16.400' AS DateTime))
INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (2, N'Drinks & More', 2, 2, 3, CAST(N'2021-09-14T19:25:29.317' AS DateTime))
INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (3, N'Travelers Respite', 3, 2, 2, CAST(N'2021-09-14T19:26:32.910' AS DateTime))
INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (4, N'Swords Edge', 4, 4, 4, CAST(N'2021-09-14T19:27:24.680' AS DateTime))
INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (5, N'Praise The Sun', 5, 5, 3, CAST(N'2021-09-14T19:28:02.120' AS DateTime))
INSERT [dbo].[Taverns] ([TavernID], [TavernName], [LocationID], [OwnerID], [FloorCount], [DateCreated]) VALUES (6, N'Winking Skeever', 6, 6, 1, CAST(N'2021-09-14T19:28:47.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Taverns] OFF
GO
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (1, 1, 2, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (2, 1, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (6, 1, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (7, 1, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (1, 2, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (6, 2, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (5, 2, 2, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (1, 3, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (3, 3, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (7, 3, 3, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (2, 4, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (7, 4, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (3, 5, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (1, 5, 1, CAST(N'2021-09-15T18:21:14.240' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (6, 5, 1, CAST(N'2021-09-15T18:21:14.243' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (1, 6, 1, CAST(N'2021-09-15T18:21:14.243' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (2, 6, 1, CAST(N'2021-09-15T18:21:14.243' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (6, 6, 2, CAST(N'2021-09-15T18:21:14.243' AS DateTime))
INSERT [dbo].[TavernServices] ([ServiceID], [TavernID], [StatusID], [DateCreated]) VALUES (4, 6, 1, CAST(N'2021-09-15T18:21:14.243' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (1, N'Chris', 1, CAST(N'2021-09-14T19:17:15.957' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (2, N'Unknown', 2, CAST(N'2021-09-14T19:30:05.230' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (3, N'Rusty', 1, CAST(N'2021-09-14T19:30:20.610' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (4, N'Geralt', 5, CAST(N'2021-09-14T19:31:02.603' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (5, N'Ashen One', 4, CAST(N'2021-09-14T19:31:26.450' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (6, N'David', 1, CAST(N'2021-09-14T19:38:50.603' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (7, N'Mark', 1, CAST(N'2021-09-14T19:38:56.280' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (8, N'Pete', 1, CAST(N'2021-09-14T19:39:04.360' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (9, N'Eleanor', 1, CAST(N'2021-09-14T19:39:27.307' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (10, N'Wendy', 3, CAST(N'2021-09-14T19:42:35.090' AS DateTime))
INSERT [dbo].[Users] ([UserID], [UserName], [RoleID], [DateCreated]) VALUES (11, N'Greg', 2, CAST(N'2021-09-14T19:44:46.497' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Locations] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Rats] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[ServiceSales] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Shipments] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Status] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Supplies] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Taverns] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[TavernServices] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
USE [master]
GO
ALTER DATABASE [DBBootCamp] SET  READ_WRITE 
GO

Drop Table Rats

Drop Table if Exists GuestInfo

Create Table GuestInfo
(
	GuestID INT, 
	GuestNote Varchar(250), 
	Birthday Date, 
	Cakeday Date, 
	StatusID INT,
	DateCreated DateTime NOT NULL Default GetDate()
)

Drop Table if exists GuestStatus

Create Table GuestStatus 
(
	StatusID INT Identity (1,1),
	StatusName varchar (50),
	DateCreated DateTime NOT NULL Default GetDate()
)

Drop Table if exists GuestClass

Create Table GuestClass
(
	ClassID INT, 
	GuestID INT, 
	GuestLevel INT,
	DateCreated DateTime NOT NULL Default GetDate()
)

Drop Table if Exists Class

Create Table Class
(
	ClassID INT Identity (1,1),
	ClassName varchar(50),
	DateCreated DateTime NOT NULL Default GetDate()
)

Drop Table if Exists SupplySales

Create Table SupplySales
(
	SupplySaleID INT Identity (1,1),
	SupplyID INT,
	TavernID INT,
	SalePrice MONEY,
	SaleDate DateTime,
	AmountSold INT,
	DateCreated DateTime NOT NULL Default GetDate()
)

Alter Table Taverns Add Primary Key (TavernID)

Alter Table Class Add Primary Key (ClassID) 

Alter Table Guests Add Primary Key (GuestID)

Alter Table Locations Add Primary Key (LocationID)

Alter Table Roles add primary key (RoleID)

Alter Table Services Add Primary Key (ServiceID)

Alter Table ServiceSales Add Primary Key (ServiceSaleID)

Alter Table Shipments add primary key (ShipmentID)

Alter Table Status add primary key (StatusID)

Alter Table Supplies Add Primary Key (SupplyID)

Alter Table SupplySales Add Primary Key (SupplySaleID)

Alter Table Users Add Primary Key (UserID)

Alter Table GuestStatus Add Primary Key (StatusID)

Alter Table GuestClass Add Foreign Key (ClassID) References Class (ClassID)

Alter Table GuestClass Add Foreign Key (GuestID) References Guests (GuestID)

Alter Table GuestInfo Add Foreign Key (GuestID) References Guests (GuestID)

Alter Table GuestInfo Add Foreign Key (StatusID) References GuestStatus (StatusID)

Alter Table Guests Add Foreign Key (TavernID) references Taverns (TavernID)

Alter Table Inventory Add Foreign Key (SupplyID) References Supplies (SupplyID)

Alter Table Inventory Add Foreign Key (TavernID) References Taverns (TavernID)

Alter Table ServiceSales Add Foreign Key (ServiceID) References Services (ServiceID)

Alter Table ServiceSales Add Foreign Key (GuestID) References Guests (GuestID)

Alter Table ServiceSales Add Foreign Key (TavernID) References Taverns (TavernID)

Alter Table Shipments Add foreign Key (SupplyID) References Supplies (SupplyID)

Alter Table Shipments Add foreign Key (TavernID) References Taverns (TavernID)

Alter Table SupplySales Add Foreign Key (SupplyID) References Supplies (SupplyID)

Alter Table SupplySales Add Foreign Key (TavernID) References Taverns (TavernID)

Alter Table Taverns Add Foreign Key (LocationID) References Locations (locationID)

Alter Table Taverns Add Foreign Key (OwnerID) References Users (UserID)

Alter Table TavernServices Add Foreign Key (ServiceID) References Services (ServiceID)

Alter Table TavernServices Add Foreign Key (TavernID) References Taverns (TavernID)

Alter Table TavernServices Add Foreign Key (StatusID) References Status (StatusID)

Alter Table Users Add Foreign Key (RoleID) References Roles (RoleID)

Insert Into Class (ClassName) Values ('Mage')
Insert Into Class (ClassName) Values ('Archer')
Insert Into Class (ClassName) Values ('Knight')
Insert Into Class (ClassName) Values ('Rogue')
Insert Into Class (ClassName) Values ('Berserker')
Insert Into Class (ClassName) Values ('Necromancer')

Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (1, 1, 5) 
Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (2, 2, 10) 
Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (3, 3, 30) 
Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (4, 4, 7) 
Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (5, 5, 1) 
Insert Into GuestClass (ClassID, GuestID, GuestLevel) Values (6, 6, 100) 

Insert Into GuestStatus (StatusName) Values ('Sick')
Insert Into GuestStatus (StatusName) Values ('Hungry')
Insert Into GuestStatus (StatusName) Values ('Angry')
Insert Into GuestStatus (StatusName) Values ('Fine')
Insert Into GuestStatus (StatusName) Values ('Sad')
Insert Into GuestStatus (StatusName) Values ('Hangry')
Insert Into GuestStatus (StatusName) Values ('Happy')
Insert Into GuestStatus (StatusName) Values ('Satisfied')

Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (1, 'Bill is always hungry', '12/18/1994', '12/18/1994', 2)
Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (2, 'Phil is often angry for no reason', '05/10/1969', '10/04/1970', 3)
Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (3, 'Chris just broke up with his girl', '12/25/2001', '12/25/2001', 5)
Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (4, 'Ed likes food a lot', '07/07/1977', '07/07/1977', 8)
Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (5, 'Finn does not look like the other Finn and is often sick', '04/25/2005', '04/28/2005', 1)
Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID)
Values (6, 'This Finn is older than the other Finn', '01/01/1950', '01/01/1950', 3)

Insert Into SupplySales (SupplyID, TavernID, SalePrice, SaleDate, AmountSold) 
Values (1, 1, 15, '08/02/2021', 3)
Insert Into SupplySales (SupplyID, TavernID, SalePrice, SaleDate, AmountSold) 
Values (3, 2, 20, '09/25/2020 12:15:04.000', 1)
Insert Into SupplySales (SupplyID, TavernID, SalePrice, SaleDate, AmountSold) 
Values (4, 3, 5, '01/14/2021 14:01:45.000', 1)
Insert Into SupplySales (SupplyID, TavernID, SalePrice, SaleDate, AmountSold) 
Values (5, 4, 75, '09/25/2020 18:30:11.000', 2)
Insert Into SupplySales (SupplyID, TavernID, SalePrice, SaleDate, AmountSold) 
Values (7, 5, 10, '04/21/2021 09:00:10.000', 10)

--This are failing insertions due to foreign key constraints

--Insert Into GuestClass (ClassID,GuestID,GuestLevel) Values (1,1,1)

--Insert Into GuestInfo (GuestID, GuestNote, Birthday, Cakeday, StatusID) Values (3, 'Usually Drunk', '12/18/1994', '12/18/1994', 3)

Drop Table if exists RoomStatus;

Create Table RoomStatus
(
	StatusID INT Primary Key IDENTITY (1,1),
	StatusName Varchar (50),
	DateCreated DateTime NOT NULL Default GETDATE()
);


Drop Table If exists Rooms;

Create Table Rooms 
(
	RoomID INT Primary Key IDENTITY (1,1), 
	StatusID INT,
	TavernID INT Foreign Key References Taverns (TavernID), 
	DateCreated DateTime NOT NULL Default Getdate()
);

Drop Table IF exists RoomSales ;

Create Table RoomSales
(
	RoomSaleID INT Primary Key IDENTITY (1,1),
	GuestID INT Foreign Key references Guests(GuestID),
	RoomID INT Foreign Key references Rooms (RoomID),
	DateStayed DateTime,
	Rate Money, 
	DateCreated DateTime NOT NULL Default Getdate()
);


INSERT INTO RoomStatus (StatusName) Values ('Available'), ('Unavailable'), ('Occupied');


Insert Into Rooms (StatusID, TavernID) Values (1,1), (1,1), (2,1), (2,1), (1,2), (1,2), (3,2), (2,2), (1,3), (1,3), (2,4), (1,5), (1,5), (1,5);


Insert Into RoomSales (GuestID, RoomID, DateStayed, Rate) Values (1, 1, '9/22/2020', 50), (2, 3, '08/10/2021', 100), (3, 2, '01/01/2011', 200), (4, 5, '5/25/2021', 250),
(5, 2, '01/01/2011', 15),(1, 2, '04/13/2020', 25), (3, 5, '07/03/2021', 25), (4, 5, '9/04/2021', 5);


select * from GuestInfo where Birthday < '2000-01-01';

Select RoomID From RoomSales Where Rate > 100;

select Distinct GuestName From Guests;

select * from Guests Order By GuestName ASC;

Select TOP (10) Rate From RoomSales order by Rate desc;


Select * From Class
UNION
Select * From GuestStatus
UNION
Select * From Roles
UNION
Select * From RoomStatus
UNION
Select * From Services
UNION 
Select * From Locations
UNION
Select * From Status;

Select ClassID, 

Case When GuestLevel <= 10 and GuestLevel >= 1 then '1-10' When GuestLevel <= 20 and GuestLevel >= 10 then '10-20' When GuestLevel <= 30 and GuestLevel >=20 Then '20-30' When GuestLevel <= 40 and GuestLevel >= 30 Then '30-40'
When GuestLevel <= 50 and GuestLevel >= 40 then '40-50' When GuestLevel <=60 and Guestlevel >=50 Then '50-60' When GuestLevel <=70 and GuestLevel >= 60 then '60-70' When GuestLevel <= 80 and guestlevel >= 70 then '70-80'
When GuestLevel	<= 90 and GuestLevel >= 80 then '80-90' When GuestLevel <= 100 and GuestLevel >= 90 Then '90-100' 

END AS LvlGroup

from GuestClass;

/* Class 4 */
Select UserName From Users u
Inner Join Roles r on u.RoleID = r.RoleID where r.RoleID = 1

Update Taverns set OwnerID = 7 where TavernID = 2
Update Taverns set OwnerID = 7 where TavernID = 3
Update Taverns set OwnerID = 8 where TavernID = 4
Update Taverns set OwnerID = 9 where TavernID = 5

Select * From Users u
Inner Join Roles r on u.RoleID = r.RoleID
Inner Join Taverns t on u.UserID = t.OwnerID
where r.RoleID = 1

Select g.GuestName, c.classname, gc.guestlevel From Guests g
Inner Join GuestClass gc on g.GuestID = gc.GuestID
Inner Join Class c on gc.ClassID = c.ClassID
Order by GuestName ASC

Select tsp.Price,s.ServiceName from 
(Select Top 10 * From ServiceSales order by Price Desc) tsp
Inner Join Services s on tsp.serviceID = s.ServiceID

Select GuestName From Guests g
Inner Join (Select GuestID from GuestClass Group By GuestID Having Count (ClassID) > 1) a on g.GuestID = a.GuestID

Select Distinct GuestName From Guests g
Inner Join (Select GuestID from GuestClass Group By GuestID Having Count (ClassID) > 1) a on g.GuestID = a.GuestID
Inner Join (Select GuestID from GuestClass where GuestLevel > 5) b on g.GuestID = b.GuestID

Select g.GuestName, mgl.GuestLevel From Guests g
Inner Join (Select GuestID, Max(GuestLevel) GuestLevel from GuestClass group by GuestID) mgl on g.GuestID = mgl.GuestID

Select Distinct g.GuestName From Guests g
Inner Join (Select GuestID FROM RoomSales where DateStayed Between '1/1/2020' and '12/31/2020') gs on g.GuestID = gs.GuestID

/* Class 5 */
--#1
Select u.UserName,r.RoleName from Users u
Inner Join Roles r on u.RoleID = r.RoleID

--#2
select c.ClassName, cg.GuestCount from Class c 
Join (select ClassID, COUNT(GuestID) as GuestCount From GuestClass group by ClassID) cg on c.ClassID = cg.ClassID

--#3
Select g.GuestName,gc.GuestLevel, c.ClassName,lg.LevelGroup From Guests g
Inner Join 
	GuestClass gc on g.GuestID = gc.GuestID
Inner Join
	Class c on gc.ClassID = c.ClassID
Inner Join 
	(Select GuestLevel,
		Case 
			When GuestLevel BETWEEN 1 and 5 THEN 'Beginner'
			When GuestLevel BETWEEN 5 and 10 THEN 'Intermediate'
			ELSE 'Expert'
		End As LevelGroup
		From GuestClass) lg on gc.GuestLevel = lg.GuestLevel
Order by g.GuestName ASC

--#4
Create Function dbo.getgrouping(@GuestLevel INT)
RETURNS Varchar (50)
As 
Begin 
Declare @ret Varchar (50)
Select @ret = (Select top 1
		Case 
		When @GuestLevel BETWEEN 1 and 5 THEN 'Beginner'
		When @GuestLevel BETWEEN 5 and 10 THEN 'Intermediate'
		ELSE 'Expert'
		End As LevelGroup
	From GuestClass)
Return @ret
END

-- #5 OPEN ROOMS
Create Function dbo.openrooms (@DateStayed DateTime)
Returns Table
AS
Return
(
Select r.RoomID,t.TavernName,rst.StatusName from Rooms r 
Inner Join Taverns t on r.tavernid = t.tavernid
Inner Join RoomSales rs on r.RoomID = rs.RoomID
Inner Join RoomStatus rst on r.StatusID = rst.StatusID
Where DateStayed <> @DateStayed
)

--#6 Modify for price range
Alter Function dbo.openrooms (@MinRate Money, @MaxRate Money)
Returns Table
AS
Return
(
Select r.RoomID,t.TavernName,rst.StatusName,mxrt.MaxRate,mnrt.MinRate from Rooms r 
Inner Join Taverns t on r.tavernid = t.tavernid
Inner Join RoomSales rs on r.RoomID = rs.RoomID
Inner Join RoomStatus rst on r.StatusID = rst.StatusID
Inner Join (Select RoomID, Max(Rate) MaxRate from RoomSales Group by RoomID) mxrt on r.RoomID = mxrt.RoomID
Inner Join (Select RoomID, Min(Rate) MinRate From RoomSales Group by RoomID) mnrt on r.RoomID = mnrt.RoomID
Where mxrt.MaxRate <= @MaxRate and mnrt.MinRate >= @MinRate
)

--#7 Create a Room Trigger
Create Trigger CreateRoom
ON dbo.RoomSales
AFTER INSERT
AS BEGIN
INSERT INTO Rooms (StatusID, TavernID) VALUES (1, 1)
INSERT INTO RoomSales (GuestID, RoomID, DateStayed, Rate) 
VALUES (1, (Select Top 1 RoomID from Rooms), '10/19/2021',
(Select (MinRate - 0.01) Rate from dbo.openrooms (0.00,500.00)))
END
GO
