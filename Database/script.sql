USE [master]
GO
/****** Object:  Database [RealEstateAgency]    Script Date: 26.09.2020 15:12:09 ******/
CREATE DATABASE [RealEstateAgency]
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
/****** Object:  Table [dbo].[Client]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[Deal]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[Demand]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demand](
	[Id] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[RealtorId] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_dbo.Demand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estate]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estate](
	[SupplyId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Area] [float] NULL,
	[HouseNum] [int] NULL,
	[FlatNum] [int] NULL,
	[CoordinateLatitude] [real] NULL,
	[CoordinateLongitude] [real] NULL,
	[City] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Estate] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filter]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[DemandId] [int] NOT NULL,
	[MinArea] [float] NULL,
	[MaxArea] [float] NULL,
	[MinCoordinateLatitude] [int] NULL,
	[MaxCoordinateLatitude] [int] NULL,
	[MinCoordinateLongitude] [int] NULL,
	[MaxCoordinateLongitude] [int] NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[MinPrice] [money] NULL,
	[MaxPrice] [money] NULL,
 CONSTRAINT [PK_dbo.Filter] PRIMARY KEY CLUSTERED 
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flat]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flat](
	[SupplyId] [int] NOT NULL,
	[Floor] [int] NOT NULL,
	[RoomCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Flat] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlatFilter]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[House]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[SupplyId] [int] NOT NULL,
	[FloorCount] [int] NOT NULL,
	[RoomCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.House] PRIMARY KEY CLUSTERED 
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseFilter]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[LandPlot]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[LandPlotFilter]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[Realtor]    Script Date: 26.09.2020 15:12:09 ******/
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
/****** Object:  Table [dbo].[Supply]    Script Date: 26.09.2020 15:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[Id] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[RealtorId] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_dbo.Supply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (1, N'32-25-55        ', NULL, N'Семенов', N'Николаевич', N'Евгений ')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (2, NULL, N'dummy@email.ru', N'Денисова', N'Леонидовна', N'Олеся')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (3, NULL, N'client@esoft.tech', N'Сафронов', N'Вячеславович', N'Алексей')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (4, N'551988          ', NULL, N'Кудряшов', N'Витальевич', N'Александр')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (5, NULL, N'fedorov@mail.ru', N'Фёдоров', N'Николаевич', N'Алексей')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (6, N'83452112233     ', NULL, N'Пелымская', N'Александровна', N'Светлана')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (7, NULL, N'dummy@email.ru', N'Коновальчик', N'Геннадьевна', N'Татьяна')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (8, N'898489848       ', NULL, N'Молоковская', N'Михайловна', N'Светлана')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (9, N'895159848       ', NULL, N'Моторина', N'Сергеевна', N'Анастасия')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (10, NULL, N'angel@mail.ru', N'Поспелова', N'Александровна', N'Ольга')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (11, N'445588          ', N'445588@email.ru', N'Жиляков', N'Владимирович', N'Владимир')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (12, NULL, N'parampampam@mail.ru', N'Ефремов', N'Николаевич', N'Владислав')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (13, N'7998888444      ', NULL, N'Баль', N'Сергеевна', N'Валентина')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (14, NULL, N'test@test.test', N'Стрелков', N'Николаевич', N'Артем')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (15, NULL, N'foo@bar.ru', N'Луканин', N'Валерьевич', N'Павел')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (16, N'12345678910     ', NULL, N'Шарипова', N'Закирчановна', N'Эльвира')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (17, NULL, N'fomina@email.ru', N'Фомина', N'Николаевна', N'Маргарита')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (18, N'777             ', N'kremlevvu@gmail.ru', N'Кремлев', N'Юрьевич', N'Владислав')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (19, NULL, N'ponomareva@gmail.ru', N'Пономарева', N'Сергеевна', N'Елена')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (20, N'112             ', NULL, N'Шелест', N'Васильевна', N'Тамара')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (21, NULL, N'sharipov@yandex.ru', N'Шарипов', N'Владимирович', N'Рустам')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (22, N'2               ', NULL, N'Романов', N'Федорович', N'Сергей')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (23, NULL, N'kruch@list.ru', N'Кручинин', N'Андреевич', N'Иван')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (24, N'688899444       ', NULL, N'Алферов', N'Николаевич', N'Алексей')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (25, N'489848565       ', N'popovan@bik.ru', N'Попов ', N'Николаевич', N'Алексей')
INSERT [dbo].[Client] ([Id], [Phone], [Email], [FirstName], [LastName], [MiddleName]) VALUES (26, NULL, N'neez@mail.ru', N'Неезжала', N'Леонидовна', N'Наталья')
SET IDENTITY_INSERT [dbo].[Client] OFF
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (1, 0.0000, 41.700000762939453, 25, 12, 0, 0, N'Тюмень', N'Энергостроителей')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (2, 0.0000, 105, 8, 44, 0, 0, N'Тюмень', N'Елизарова')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (3, 0.0000, 62, 139, 6, 0, 0, N'Тюмень', N'Московский тракт')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (4, 0.0000, 50, 189, 5, 0, 0, N'Тюмень', N'Широтная')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (5, 0.0000, 51.700000762939453, 110, 99, 0, 0, N'Тюмень', N'Пролетарская')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (6, 0.0000, 44, 189, 1, 0, 0, N'Тюмень', N'Тараскульская')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (7, 0.0000, 43.099998474121094, 22, 1, 0, 0, N'Тюмень', N'Парфенова')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (8, 0.0000, 92, 144, 16, 0, 0, N'Тюмень', N'Республики')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (9, 0.0000, 84.4000015258789, 25, NULL, 0, 0, N'Тюмень', N'1-й Заречный')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (10, 0.0000, 130, NULL, NULL, 0, 0, N'Тюмень', N'Ялyтopoвcкий тpaкт')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (11, 0.0000, 120, NULL, NULL, 0, 0, N'Тюмень', N'Березняковский п')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (12, 0.0000, 4.1999998092651367, NULL, NULL, 0, 0, N'Тюмень', N'Луговое')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (13, 0.0000, 12.449999809265137, NULL, NULL, 0, 0, N'Тюмень', N'Алексеевский хутор')
INSERT [dbo].[Estate] ([SupplyId], [Price], [Area], [HouseNum], [FlatNum], [CoordinateLatitude], [CoordinateLongitude], [City], [Street]) VALUES (14, 0.0000, 12, NULL, NULL, 0, 0, N'Тюмень', N'Суходольский мкр')
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (1, 3, 1)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (2, 5, 3)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (3, 2, 3)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (4, 7, 2)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (5, 2, 2)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (6, 1, 2)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (7, 5, 1)
INSERT [dbo].[Flat] ([SupplyId], [Floor], [RoomCount]) VALUES (8, 1, 3)
INSERT [dbo].[House] ([SupplyId], [FloorCount], [RoomCount]) VALUES (9, 2, 0)
INSERT [dbo].[House] ([SupplyId], [FloorCount], [RoomCount]) VALUES (10, 3, 0)
INSERT [dbo].[House] ([SupplyId], [FloorCount], [RoomCount]) VALUES (11, 1, 0)
INSERT [dbo].[LandPlot] ([SupplyId]) VALUES (12)
INSERT [dbo].[LandPlot] ([SupplyId]) VALUES (13)
INSERT [dbo].[LandPlot] ([SupplyId]) VALUES (14)
SET IDENTITY_INSERT [dbo].[Realtor] ON 

INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (1, 20, N'Фахрутдинов', N'Рубинович', N'Роман')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (2, 40, N'Устинов', N'Алексеевич', N'Максим')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (3, 45, N'Сысоева', N'Валентиновна', N'Людмила')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (4, 45, N'Додонов', N'Геннадьевич', N'Илья')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (5, 45, N'Мухтаруллин', N'Расыхович', N'Руслан')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (6, 45, N'Мосеева', N'Александровна', N'Любовь')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (7, 45, N'Киселев', N'Геннадьевич', N'Алексей')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (8, 50, N'Клюйков', N'Николаевич', N'Евгений')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (9, 45, N'Жданова', N'Николаевна', N'Галина')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (10, 45, N'Басырова', N'Азатовна', N'Елена')
INSERT [dbo].[Realtor] ([Id], [DealShare], [FirstName], [LastName], [MiddleName]) VALUES (11, 45, N'Швецов', N'Олегович', N'Виталий')
SET IDENTITY_INSERT [dbo].[Realtor] OFF
/****** Object:  Index [IX_DemandId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[Deal]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[Deal]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_ClientId] ON [dbo].[Demand]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[Demand]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RealtorId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_RealtorId] ON [dbo].[Demand]
(
	[RealtorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[Flat]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[FlatFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[House]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[HouseFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SupplyId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_SupplyId] ON [dbo].[LandPlot]
(
	[SupplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DemandId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_DemandId] ON [dbo].[LandPlotFilter]
(
	[DemandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClientId]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_ClientId] ON [dbo].[Supply]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Id]    Script Date: 26.09.2020 15:12:10 ******/
CREATE NONCLUSTERED INDEX [IX_Id] ON [dbo].[Supply]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RealtorId]    Script Date: 26.09.2020 15:12:10 ******/
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
