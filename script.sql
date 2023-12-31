USE [master]
GO
/****** Object:  Database [FlowerShop]    Script Date: 14/10/2023 8:37:21 AM ******/
CREATE DATABASE [FlowerShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlowerShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FlowerShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlowerShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FlowerShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlowerShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowerShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowerShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowerShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowerShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowerShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowerShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowerShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowerShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowerShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowerShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowerShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowerShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowerShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FlowerShop] SET  MULTI_USER 
GO
ALTER DATABASE [FlowerShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowerShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowerShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowerShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlowerShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlowerShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FlowerShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [FlowerShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FlowerShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[AccID] [int] NULL,
	[FbDate] [date] NULL,
	[Content] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower](
	[FlowID] [int] IDENTITY(1,1) NOT NULL,
	[FlowName] [varchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Price] [int] NULL,
	[quantity] [int] NULL,
	[FlowID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/10/2023 8:37:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [address]) VALUES (1, N'nhungoc@gmail.com', N'12345', N'Tran Nhu Ngoc', N'0911723456', 1, 0, N'Ho Chi Minh')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [address]) VALUES (2, N'minhanh@gmail.com', N'admin', N'Truong Minh Anh', N'0356724892', 1, 1, N'Thu Duc')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [address]) VALUES (3, N'khanhdang@gmail.com', N'shipper', N'Nguyen Khanh Dang', N'0919522366', 1, 2, N'Vung Tau')
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [address]) VALUES (4, N'vuhoang@gmail.com', N'12345', N'Nguyen Vu Hoang', N'0946955273', 0, 0, N'Ha Noi')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'Daffodils')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'Carnations')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'Zinnias')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N'Sweet Peas')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (5, N'Peonies')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (6, N'Snapdragon')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (7, N'Marigolds')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (8, N'Chrysanthemums')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (9, N'Geraniums')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Flower] ON 

INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'Lavender', 200000, N'images/Lavender.png', N'A genus of about 30 species of the mint family, known for their fragrant leaves and attractive flowers, widely cultivated for their essential oils.', 1, 2)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'Rose', 150000, N'images/Rose.png', N'A type of flowering plant in the family Rosaceae, native primarily to the temperate regions of the Northern Hemisphere, with flowers that come in many different colors, from the well-known red rose to yellow roses and sometimes white or purple roses.', 1, 5)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'Sun Flower', 100000, N'images/Sun Flower.png', N'A genus of plants in the family Asteraceae, with a large flower head that can be 30 cm wide, and are native to the Old World.', 0, 3)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'Tulip', 400000, N'images/Tulip.png', N'A perennial plant in the lily family, known for its cup-shaped blossom that comes in nearly every color except true blue.', 0, 2)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (5, N'Daisy', 120000, N'images/Daisy.png', N'A genus of several species of flowering plants in the aster family, distinguished by a composite flower head composed of 15 to 30 white ray flowers surrounding a center consisting of bright yellow disk flowers.', 1, 1)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (6, N'Sakura', 500000, N'images/Sakura.png', N'Also known as Japanese cherry or cherry blossom, is a flower of trees in the genus Prunus or the Prunus subgenus Cerasus, common in East Asia, especially in Japan.', 0, 3)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (7, N'Violet', 320000, N'images/Violet.png', N'A genus of about 70 species of shrubs, trees and climbers in the family Violaceae, native to southern and eastern Asia, known for their big, bushy head and charismatic flowering blooms in intense colors.', 1, 4)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (8, N'Lily', 260000, N'images/Lily.png', N'A genus of about 100 species of herbaceous flowering plants of the family Liliaceae, native to temperate regions of the Northern Hemisphere, many are prized ornamental plants and have been extensively hybridized.', 1, 6)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (9, N'Lotus', 120000, N'images/Lotus.png', N'Also known as Sacred lotus or Indian lotus, is one of two extant species of aquatic plant in the family Nelumbonaceae.', 0, 1)
INSERT [dbo].[Flower] ([FlowID], [FlowName], [price], [imgPath], [description], [status], [CateID]) VALUES (10, N'Hydrangea ', 260000, N'images/Hydrangea .png', N'A genus of about 70 species of shrubs, trees and climbers in the family Hydrangeaceae, native to southern and eastern Asia.', 1, 6)
SET IDENTITY_INSERT [dbo].[Flower] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [Price], [quantity], [FlowID]) VALUES (1, 1, 200000, 2, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [Price], [quantity], [FlowID]) VALUES (2, 1, 150000, 1, 2)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [Price], [quantity], [FlowID]) VALUES (3, 2, 100000, 5, 3)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [Price], [quantity], [FlowID]) VALUES (4, 3, 500000, 2, 6)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [Price], [quantity], [FlowID]) VALUES (5, 3, 260000, 2, 8)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2023-10-10' AS Date), CAST(N'2023-12-10' AS Date), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2022-03-08' AS Date), CAST(N'2023-03-12' AS Date), 2, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2022-05-10' AS Date), CAST(N'2023-05-13' AS Date), 2, 1)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2022-06-10' AS Date), CAST(N'2023-06-22' AS Date), 3, 4)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2022-12-22' AS Date), CAST(N'2022-12-29' AS Date), 2, 1)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (6, CAST(N'2023-10-08' AS Date), CAST(N'2023-10-10' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164E20F1DA4]    Script Date: 14/10/2023 8:37:21 AM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164E91E74F0]    Script Date: 14/10/2023 8:37:21 AM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FlowID])
REFERENCES [dbo].[Flower] ([FlowID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FlowID])
REFERENCES [dbo].[Flower] ([FlowID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Flower]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
USE [master]
GO
ALTER DATABASE [FlowerShop] SET  READ_WRITE 
GO
