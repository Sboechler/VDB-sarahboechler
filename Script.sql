USE [master]
GO
/****** Object:  Database [myPersonalProjectHotWheels]    Script Date: 10/1/2024 10:18:43 PM ******/
CREATE DATABASE [myPersonalProjectHotWheels]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myPersonalProjectHotWheels', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\myPersonalProjectHotWheels.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myPersonalProjectHotWheels_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\myPersonalProjectHotWheels_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myPersonalProjectHotWheels].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ARITHABORT OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET  DISABLE_BROKER 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET RECOVERY FULL 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET  MULTI_USER 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'myPersonalProjectHotWheels', N'ON'
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET QUERY_STORE = OFF
GO
USE [myPersonalProjectHotWheels]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 10/1/2024 10:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Car_ID] [int] NOT NULL,
	[Model_Name] [nchar](80) NOT NULL,
	[Year] [int] NOT NULL,
	[Series_ID] [int] NOT NULL,
	[Color] [nchar](50) NOT NULL,
	[Type] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Car_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 10/1/2024 10:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Series_ID] [int] NOT NULL,
	[Series_Name] [nchar](80) NOT NULL,
	[Year] [int] NOT NULL,
	[Total_Cars] [int] NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Series_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Value]    Script Date: 10/1/2024 10:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Value](
	[Value_ID] [int] NOT NULL,
	[Car_ID] [int] NOT NULL,
	[Estimated_Value] [money] NOT NULL,
	[Valuation_Date] [date] NULL,
 CONSTRAINT [PK_Value] PRIMARY KEY CLUSTERED 
(
	[Value_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 10/1/2024 10:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[Version_ID] [int] NOT NULL,
	[Car_ID] [int] NULL,
	[Version_Type] [nchar](80) NULL,
	[Release_Year] [int] NULL,
 CONSTRAINT [PK_Variant_1] PRIMARY KEY CLUSTERED 
(
	[Version_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 10/1/2024 10:18:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[Version_ID] [int] NOT NULL,
	[Car_ID] [int] NOT NULL,
	[Version_Type] [nchar](80) NOT NULL,
	[Release_Year] [int] NOT NULL,
 CONSTRAINT [PK_Variant] PRIMARY KEY CLUSTERED 
(
	[Version_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (1, N'Plymouth Barracuda                                                              ', 2012, 45, N'Purple                                            ', N'Convertible                                       ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (2, N'Limited Grip                                                                    ', 2022, 21, N'Green                                             ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (3, N'Lotus Sport Elise                                                               ', 2021, 10, N'White                                             ', N'Sports                                            ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (4, N'Rennen Rig                                                                      ', 2010, 4, N'Yellow                                            ', N'Semi                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (5, N'Ollie Rocket                                                                    ', 2015, 30, N'Gold                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (6, N'Surf Duty                                                                       ', 2022, 28, N'Yellow                                            ', N'Emergency                                         ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (7, N'Formula Flashback                                                               ', 2016, 25, N'Blue                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (8, N'Maximum Leeway                                                                  ', 2012, 27, N'Grey                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (9, N'Camero                                                                          ', 1982, 42, N'Bronze                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (10, N'2 Tuff                                                                          ', 2018, 21, N'White                                             ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (11, N'Nissan 370Z                                                                     ', 2009, 3, N'Red                                               ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (12, N'Volvo XC40 Recharge                                                             ', 2022, 37, N'White                                             ', N'SUV                                               ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (13, N'Dodge Charger Drift                                                             ', 2022, 48, N'White                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (14, N'Lolux                                                                           ', 2021, 34, N'Grey                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (15, N'Monster High Ghoul Mobile                                                       ', 2023, 29, N'Purple                                            ', N'Convertible                                       ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (16, N'Lamborghini Huracan LP                                                          ', 2014, 19, N'Purple                                            ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (17, N'McLaren F1 GTR                                                                  ', 2017, 39, N'Silver                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (18, N'1967 Ford GT40                                                                  ', 2020, 24, N'White                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (19, N'Armored Bank Service                                                            ', 1996, 38, N'Red                                               ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (20, N'Monteracer                                                                      ', 2015, 41, N'Purple                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (21, N'Lolux                                                                           ', 2021, 34, N'White                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (22, N'Tantrum                                                                         ', 2002, 1, N'Yellow                                            ', N'Convertible                                       ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (23, N'Dodge Charger SRT                                                               ', 2018, 2, N'Red                                               ', N'Police                                            ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (24, N'Motosaurus                                                                      ', 2016, 40, N'Orange                                            ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (25, N'Brick and Motor                                                                 ', 2022, 9, N'Red                                               ', N'LEGO                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (26, N'McLaren P1                                                                      ', 2014, 19, N'Red                                               ', N'Sports                                            ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (27, N'Preyeing Menace                                                                 ', 2017, 7, N'Blue                                              ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (28, N'Twin Mill                                                                       ', 1969, 35, N'Green                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (29, N'Custom Small Block                                                              ', 2020, 9, N'Orange                                            ', N'LEGO                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (30, N'Roller Toaster                                                                  ', 2016, 33, N'Green                                             ', N'Food                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (31, N'5 Alarm                                                                         ', 2008, 28, N'Red                                               ', N'Emergency                                         ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (32, N'Brickin'' Delivery                                                               ', 2022, 6, N'Orange                                            ', N'LEGO                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (33, N'Dragon Blaster                                                                  ', 2009, 8, N'Blue                                              ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (34, N'Trouble Decker                                                                  ', 2022, 22, N'Red                                               ', N'Bus                                               ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (35, N'TRex Transporter                                                                ', 2023, 29, N'Blue                                              ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (36, N'Tee''d Off 2                                                                     ', 2014, 15, N'White                                             ', N'Golf Cart                                         ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (37, N'Tee''d Off 3                                                                     ', 2015, 15, N'Red                                               ', N'Golf Cart                                         ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (38, N'Head Gasket                                                                     ', 2020, 17, N'Grey                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (39, N'T-Rextroyer                                                                     ', 2020, 8, N'Red                                               ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (40, N'T-Rextroyer                                                                     ', 2019, 8, N'Yellow                                            ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (41, N'T-Rextroyer                                                                     ', 2016, 8, N'Pink                                              ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (42, N'T-Rextroyer                                                                     ', 2024, 8, N'Blue                                              ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (43, N'Mach It Go                                                                      ', 2021, 31, N'Clear                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (44, N'''62 Ford Mustang                                                                ', 2009, 3, N'Black                                             ', N'Convertible                                       ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (45, N'''64 Continental                                                                 ', 2007, 2, N'Pink                                              ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (46, N'''87 Dodge D100                                                                  ', 2017, 21, N'Pink                                              ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (47, N'Formula Solar                                                                   ', 2015, 14, N'Green                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (48, N'Twin Mill                                                                       ', 2022, 9, N'White                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (49, N'Twin Mill                                                                       ', 2007, 9, N'Green                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (50, N'McLaren F1 GTR                                                                  ', 2017, 39, N'Silver                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (51, N'Brickin'' Delivery                                                               ', 2022, 6, N'Green                                             ', N'LEGO                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (52, N'Trouble Decker                                                                  ', 2022, 22, N'Tan                                               ', N'Bus                                               ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (53, N'Pininfarina Battista                                                            ', 2021, 23, N'Blue                                              ', N'Sports                                            ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (54, N'K.I.T.T. Concept                                                                ', 2021, 18, N'Black                                             ', N'Sports                                            ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (55, N'Road Rocket                                                                     ', 1995, 12, N'Red                                               ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (56, N'Hot Wired                                                                       ', 2021, 13, N'Blue                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (57, N'Track Dwagon                                                                    ', 2023, 32, N'Pink                                              ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (58, N'Lucid Air                                                                       ', 2021, 20, N'White                                             ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (59, N'Lindster Prototype                                                              ', 2019, 46, N'Purple                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (60, N'Surfin'' School Bus                                                              ', 2000, 22, N'Blue                                              ', N'Bus                                               ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (61, N'Formula Solar                                                                   ', 2015, 29, N'Clear                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (62, N'Street Weiner                                                                   ', 2017, 16, N'Yellow                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (63, N'F1 Racer                                                                        ', 2015, 3, N'Red                                               ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (64, N'Nissan Leaf Nismo                                                               ', 2020, 20, N'Red                                               ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (65, N'Jaguar I-Pace Trophy                                                            ', 2018, 23, N'Black                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (66, N'Brick and Motor                                                                 ', 2022, 9, N'White                                             ', N'LEGO                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (67, N'Sweet Driver                                                                    ', 2021, 11, N'Pink                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (68, N'Lucid Air                                                                       ', 2021, 20, N'Gold                                              ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (69, N'Cosmic Coupe                                                                    ', 2020, 44, N'Blue                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (70, N'Electrack                                                                       ', 2017, 46, N'Purple                                            ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (71, N'Hot Wheels High                                                                 ', 2013, 26, N'Purple                                            ', N'Bus                                               ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (72, N'Turbine Sublime                                                                 ', 2021, 46, N'Black                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (73, N'Fangster                                                                        ', 2015, 5, N'Black                                             ', N'Creature                                          ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (74, N'Sweet Driver                                                                    ', 2021, 11, N'Brown                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (75, N'Toon''d ''83 Chevy Silverado                                                      ', 2021, 43, N'Black                                             ', N'Truck                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (76, N'Electrack                                                                       ', 2017, 46, N'Green                                             ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (77, N'Solar Reflex                                                                    ', 2007, 2, N'Blue                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (78, N'Toon''d Nissan Skyline                                                           ', 2024, 43, N'Blue                                              ', N'Sedan                                             ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (79, N'Skull Crusher                                                                   ', 2003, 8, N'Blue                                              ', N'Race                                              ')
INSERT [dbo].[Car] ([Car_ID], [Model_Name], [Year], [Series_ID], [Color], [Type]) VALUES (80, N'Skull Crusher                                                                   ', 2009, 8, N'White                                             ', N'Race                                              ')
GO
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (1, N'2002 First Editions                                                             ', 2002, 42)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (2, N'2007 New Models                                                                 ', 2007, 36)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (3, N'2009 New Models                                                                 ', 2009, 42)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (4, N'2011 New Models                                                                 ', 2011, 244)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (5, N'Batman                                                                          ', 2015, 11)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (6, N'Brick Rides                                                                     ', 2022, 5)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (7, N'City                                                                            ', 2017, 200)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (8, N'Color Shifters Creatures                                                        ', 2009, 42)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (9, N'Experimotors                                                                    ', 2007, 17)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (10, N'Factory Fresh                                                                   ', 2021, 130)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (11, N'Fast Foodie                                                                     ', 2021, 150)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (12, N'1995 First Editions                                                             ', 1995, 16)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (13, N'Hot Wired                                                                       ', 2021, 85)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (14, N'HW 55 Race Team                                                                 ', 2015, 130)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (15, N'HW All Stars                                                                    ', 2014, 40)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (16, N'HW City Works                                                                   ', 2017, 5)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (17, N'HW Daredevils                                                                   ', 2020, 400)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (18, N'HW Exotics                                                                      ', 2021, 77)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (19, N'HW Garage                                                                       ', 2014, 90)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (20, N'HW Green Speed                                                                  ', 2020, 80)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (21, N'HW Hot Trucks                                                                   ', 2017, 120)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (22, N'HW Metro                                                                        ', 2020, 40)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (23, N'HW Moving Foward                                                                ', 2018, 10)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (24, N'HW Race Day                                                                     ', 2020, 9)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (25, N'HW Race Team                                                                    ', 2016, 130)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (26, N'HW Racing: Thrill Racers                                                        ', 2013, 35)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (27, N'HW Racing: Track Aces                                                           ', 2012, 100)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (28, N'HW Rescue                                                                       ', 2008, 89)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (29, N'HW Screen Time                                                                  ', 2023, 20)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (30, N'HW Space Team                                                                   ', 2015, 5)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (31, N'HW Speed Team                                                                   ', 2021, 245)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (32, N'HW Track Champs                                                                 ', 2023, 80)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (33, N'Legends of Speed                                                                ', 2016, 30)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (34, N'Lolux                                                                           ', 2021, 10)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (35, N'Mainline                                                                        ', 1969, 130)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (37, N'Mud Studs                                                                       ', 2022, 6)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (38, N'Police Force Action Pack                                                        ', 1996, 101)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (39, N'Speed Machines                                                                  ', 2010, 25)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (40, N'Street Beasts                                                                   ', 2016, 80)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (41, N'Super Chromes                                                                   ', 2015, 300)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (42, N'The Hot Ones                                                                    ', 1982, 130)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (43, N'Tooned                                                                          ', 2021, 15)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (44, N'Track Stars                                                                     ', 2020, 42)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (45, N'Vintage Series II                                                               ', 2012, 10)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (46, N'X-Raycers                                                                       ', 2017, 125)
INSERT [dbo].[Series] ([Series_ID], [Series_Name], [Year], [Total_Cars]) VALUES (47, N'HW Main Street                                                                  ', 2022, 42)
GO
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (1, 50, 9.0000, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (2, 80, 8.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (3, 74, 7.0000, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (4, 14, 6.0000, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (5, 37, 5.0000, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (6, 1, 3.0000, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (7, 2, 2.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (8, 4, 4.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (9, 17, 3.0000, CAST(N'2022-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (10, 47, 5.0000, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (11, 52, 4.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (12, 70, 5.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (13, 77, 2.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (14, 79, 2.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (15, 9, 4.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (16, 15, 1.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (17, 24, 2.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (18, 30, 1.0000, CAST(N'2023-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (19, 33, 2.0000, CAST(N'2024-10-01' AS Date))
INSERT [dbo].[Value] ([Value_ID], [Car_ID], [Estimated_Value], [Valuation_Date]) VALUES (20, 35, 2.0000, CAST(N'2024-10-01' AS Date))
GO
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (1, 51, N'Limited Color                                                                   ', 2022)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (2, 80, N'Limited Edition                                                                 ', 2009)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (3, 40, N'Limited Edition                                                                 ', 2019)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (4, 48, N'Special Edition                                                                 ', 2022)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (5, 74, N'Limited Release                                                                 ', 2021)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (6, 37, N'Limited Color                                                                   ', 2015)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (7, 68, N'Special Edition                                                                 ', 2021)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (8, 52, N'Limited Release                                                                 ', 2022)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (9, 14, N'Limited Edition                                                                 ', 2021)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (10, 50, N'Limited Color                                                                   ', 2017)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (11, 70, N'Limited Edition                                                                 ', 2017)
INSERT [dbo].[Version] ([Version_ID], [Car_ID], [Version_Type], [Release_Year]) VALUES (12, 77, N'Special Edition                                                                 ', 2017)
GO
USE [master]
GO
ALTER DATABASE [myPersonalProjectHotWheels] SET  READ_WRITE 
GO
