USE [master]
GO
/****** Object:  Database [RealEstateAgency]    Script Date: 24.09.2020 0:53:30 ******/
CREATE DATABASE [RealEstateAgency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstateAgency', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RealEstateAgency.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstateAgency_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RealEstateAgency_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RealEstateAgency] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstateAgency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstateAgency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstateAgency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstateAgency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstateAgency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstateAgency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstateAgency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstateAgency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstateAgency] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RealEstateAgency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstateAgency] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstateAgency] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstateAgency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstateAgency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstateAgency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstateAgency] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstateAgency] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RealEstateAgency] SET QUERY_STORE = OFF
GO
USE [RealEstateAgency]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nchar](16) NULL,
	[Email] [nvarchar](60) NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[MiddleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal](
	[DemandId] [int] NOT NULL,
	[SupplyId] [int] NOT NULL,
	[Commission] [money] NOT NULL,
 CONSTRAINT [PK_dbo.Deal] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC,
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demand]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demand](
	[Id] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[RealtorId] [int] NULL,
 CONSTRAINT [PK_dbo.Demand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estate]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estate](
	[SupplyId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Area] [float] NULL,
	[CoordinateLongitude] [int] NULL,
	[CoordinateLatitude] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Estate] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[DemandId] [int] NOT NULL,
	[MaxPrice] [money] NULL,
	[MinPrice] [money] NULL,
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[MinCoordinateLatitude] [int] NULL,
	[MaxCoordinateLatitude] [int] NULL,
	[MinCoordinateLongitude] [int] NULL,
	[MaxCoordinateLongitude] [int] NULL,
	[Street] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Filter] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flat]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flat](
	[SupplyId] [int] NOT NULL,
	[HouseNum] [int] NULL,
	[FlatNum] [int] NULL,
	[Floor] [int] NOT NULL,
	[RoomCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Flat] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlatFilter]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlatFilter](
	[DemandId] [int] NOT NULL,
	[HouseNum] [int] NULL,
	[FlatNum] [int] NULL,
	[MinFloor] [int] NULL,
	[MaxFloor] [int] NULL,
	[MinRoomCount] [int] NULL,
	[MaxRoomCount] [int] NULL,
 CONSTRAINT [PK_dbo.FlatFilter] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[SupplyId] [int] NOT NULL,
	[HouseNum] [int] NULL,
	[FloorCount] [int] NULL,
	[RoomCount] [int] NULL,
 CONSTRAINT [PK_dbo.House] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseFilter]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseFilter](
	[DemandId] [int] NOT NULL,
	[HouseNum] [int] NULL,
	[MinFloorCount] [int] NULL,
	[MaxFloorCount] [int] NULL,
	[MinRoomCount] [int] NULL,
	[MaxRoomCount] [int] NULL,
 CONSTRAINT [PK_dbo.HouseFilter] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandPlot]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandPlot](
	[SupplyId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LandPlot] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandPlotFilter]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandPlotFilter](
	[DemandId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LandPlotFilter] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Realtor]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Realtor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DealShare] [float] NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[MiddleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Realtor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 24.09.2020 0:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[Id] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[RealtorId] [int] NULL,
 CONSTRAINT [PK_dbo.Supply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[Deal]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[Deal]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_ClientId] ON [dbo].[Demand]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[Demand]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RealtorId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_RealtorId] ON [dbo].[Demand]
(
	[RealtorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[Flat]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[FlatFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[House]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[HouseFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[LandPlot]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[LandPlotFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_ClientId] ON [dbo].[Supply]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[Supply]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RealtorId]    Script Date: 24.09.2020 0:53:30 ******/
CREATE NONCLUSTERED INDEX [IX_RealtorId] ON [dbo].[Supply]
(
	[RealtorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Deal_dbo.Demand_DemandId] FOREIGN KEY([DemandId])
REFERENCES [dbo].[Demand] ([Id])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_dbo.Deal_dbo.Demand_DemandId]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Deal_dbo.Supply_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Supply] ([Id])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_dbo.Deal_dbo.Supply_SupplyId]
GO
ALTER TABLE [dbo].[Demand]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Demand_dbo.Client_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Demand] CHECK CONSTRAINT [FK_dbo.Demand_dbo.Client_ClientId]
GO
ALTER TABLE [dbo].[Demand]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Demand_dbo.Filter_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Filter] ([DemandId])
GO
ALTER TABLE [dbo].[Demand] CHECK CONSTRAINT [FK_dbo.Demand_dbo.Filter_Id]
GO
ALTER TABLE [dbo].[Demand]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Demand_dbo.Realtor_RealtorId] FOREIGN KEY([RealtorId])
REFERENCES [dbo].[Realtor] ([Id])
GO
ALTER TABLE [dbo].[Demand] CHECK CONSTRAINT [FK_dbo.Demand_dbo.Realtor_RealtorId]
GO
ALTER TABLE [dbo].[Flat]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Flat_dbo.Estate_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Estate] ([SupplyId])
GO
ALTER TABLE [dbo].[Flat] CHECK CONSTRAINT [FK_dbo.Flat_dbo.Estate_SupplyId]
GO
ALTER TABLE [dbo].[FlatFilter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FlatFilter_dbo.Filter_DemandId] FOREIGN KEY([DemandId])
REFERENCES [dbo].[Filter] ([DemandId])
GO
ALTER TABLE [dbo].[FlatFilter] CHECK CONSTRAINT [FK_dbo.FlatFilter_dbo.Filter_DemandId]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_dbo.House_dbo.Estate_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Estate] ([SupplyId])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_dbo.House_dbo.Estate_SupplyId]
GO
ALTER TABLE [dbo].[HouseFilter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HouseFilter_dbo.Filter_DemandId] FOREIGN KEY([DemandId])
REFERENCES [dbo].[Filter] ([DemandId])
GO
ALTER TABLE [dbo].[HouseFilter] CHECK CONSTRAINT [FK_dbo.HouseFilter_dbo.Filter_DemandId]
GO
ALTER TABLE [dbo].[LandPlot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LandPlot_dbo.Estate_SupplyId] FOREIGN KEY([SupplyId])
REFERENCES [dbo].[Estate] ([SupplyId])
GO
ALTER TABLE [dbo].[LandPlot] CHECK CONSTRAINT [FK_dbo.LandPlot_dbo.Estate_SupplyId]
GO
ALTER TABLE [dbo].[LandPlotFilter]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LandPlotFilter_dbo.Filter_DemandId] FOREIGN KEY([DemandId])
REFERENCES [dbo].[Filter] ([DemandId])
GO
ALTER TABLE [dbo].[LandPlotFilter] CHECK CONSTRAINT [FK_dbo.LandPlotFilter_dbo.Filter_DemandId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Supply_dbo.Client_RealtorId] FOREIGN KEY([RealtorId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_dbo.Supply_dbo.Client_RealtorId]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Supply_dbo.Estate_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Estate] ([SupplyId])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_dbo.Supply_dbo.Estate_Id]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Supply_dbo.Realtor_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Realtor] ([Id])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_dbo.Supply_dbo.Realtor_ClientId]
GO
USE [master]
GO
ALTER DATABASE [RealEstateAgency] SET  READ_WRITE 
GO
