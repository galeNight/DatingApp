USE [master]
GO
/****** Object:  Database [DatingApp]    Script Date: 23-11-2023 13:00:39 ******/
CREATE DATABASE [DatingApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatingApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DatingApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatingApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DatingApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DatingApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatingApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatingApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatingApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatingApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatingApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatingApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatingApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatingApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatingApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatingApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatingApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatingApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatingApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatingApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatingApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatingApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DatingApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatingApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatingApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatingApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatingApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatingApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatingApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatingApp] SET RECOVERY FULL 
GO
ALTER DATABASE [DatingApp] SET  MULTI_USER 
GO
ALTER DATABASE [DatingApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatingApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatingApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatingApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatingApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatingApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DatingApp', N'ON'
GO
ALTER DATABASE [DatingApp] SET QUERY_STORE = OFF
GO
USE [DatingApp]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password1] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Userrole] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[Cityid] [int] NOT NULL,
	[city] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Genderid] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Genderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[likes]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likes](
	[LikeId] [int] IDENTITY(1,1) NOT NULL,
	[Liker] [int] NOT NULL,
	[Likee] [int] NOT NULL,
	[Statuss] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Brithdate] [datetime] NOT NULL,
	[Height] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Aboutme] [nvarchar](255) NULL,
	[Cityid] [int] NULL,
	[Genderid] [int] NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([UserId], [Username], [Password1], [Email], [Userrole]) VALUES (6, N'Male', N'123', N'tec@tec.dk', N'member')
INSERT [dbo].[Account] ([UserId], [Username], [Password1], [Email], [Userrole]) VALUES (7, N'Female', N'123', N'tec@tec.dk', N'member')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2000, N'Frederiksberg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2100, N'København Ø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2200, N'København N')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2300, N'København S')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2400, N'København NV')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2450, N'København SV')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2500, N'Valby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2600, N'Glostrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2605, N'Brøndby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2610, N'Rødovre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2625, N'Vallensbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2630, N'Taastrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2635, N'Ishøj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2640, N'Hedehusene')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2650, N'Hvidovre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2660, N'Brøndby Strand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2665, N'Vallensbæk Strand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2670, N'Greve')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2680, N'Solrød Strand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2690, N'Karlslunde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2700, N'Brønshøj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2720, N'Vanløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2730, N'Herlev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2740, N'Skovlunde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2750, N'Ballerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2760, N'Måløv')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2765, N'Smørum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2770, N'Kastrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2791, N'Dragør')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2800, N'Kongens Lyngby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2820, N'Gentofte')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2830, N'Virum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2840, N'Holte')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2850, N'Nærum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2860, N'Søborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2880, N'Bagsværd')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2900, N'Hellerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2920, N'Charlottenlund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2930, N'Klampenborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2942, N'Skodsborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2950, N'Vedbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2960, N'Rungsted Kyst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2970, N'Hørsholm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2980, N'Kokkedal')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (2990, N'Nivå')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3000, N'Helsingør')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3050, N'Humlebæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3060, N'Espergærde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3070, N'Snekkersten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3080, N'Tikøb')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3100, N'Hornbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3120, N'Dronningmølle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3140, N'Ålsgårde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3150, N'Hellebæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3200, N'Helsinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3210, N'Vejby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3220, N'Tisvildeleje')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3230, N'Græsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3250, N'Gilleleje')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3300, N'Frederiksværk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3310, N'Ølsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3320, N'Skævinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3330, N'Gørløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3360, N'Liseleje')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3370, N'Melby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3390, N'Hundested')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3400, N'Hillerød')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3460, N'Birkerød')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3480, N'Fredensborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3490, N'Kvistgård')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3500, N'Værløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3520, N'Farum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3540, N'Lynge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3550, N'Slangerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3600, N'Frederikssund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3630, N'Jægerspris')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3650, N'Ølstykke')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3660, N'Stenløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3670, N'Veksø Sjælland')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3700, N'Rønne')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3720, N'Aakirkeby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3730, N'Nexø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3740, N'Svaneke')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3751, N'Østermarie')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3760, N'Gudhjem')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3770, N'Allinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3782, N'Klemensker')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (3790, N'Hasle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4000, N'Roskilde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4040, N'Jyllinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4050, N'Skibby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4060, N'Kirke Såby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4070, N'Kirke Hyllinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4100, N'Ringsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4130, N'Viby Sjælland')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4140, N'Borup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4160, N'Herlufmagle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4171, N'Glumsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4173, N'Fjenneslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4174, N'Jystrup')
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4180, N'Sorø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4190, N'Munke Bjergby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4200, N'Slagelse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4220, N'Korsør')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4230, N'Skælskør')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4241, N'Vemmelev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4242, N'Boeslunde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4243, N'Rude')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4250, N'Fuglebjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4261, N'Dalmose')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4262, N'Sandved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4270, N'Høng')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4281, N'Gørlev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4291, N'Ruds Vedby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4293, N'Dianalund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4295, N'Stenlille')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4296, N'Nyrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4300, N'Holbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4320, N'Lejre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4330, N'Hvalsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4340, N'Tølløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4350, N'Ugerløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4360, N'Kirke Eskilstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4370, N'Store Merløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4390, N'Vipperød')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4400, N'Kalundborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4420, N'Regstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4440, N'Mørkøv')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4450, N'Jyderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4460, N'Snertinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4470, N'Svebølle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4480, N'Store Fuglede')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4490, N'Jerslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4500, N'Nykøbing Sj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4520, N'Svinninge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4532, N'Gislinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4534, N'Hørve')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4540, N'Fårevejle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4550, N'Asnæs')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4560, N'Vig')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4571, N'Grevinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4572, N'Nørre Asmindrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4573, N'Højby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4581, N'Rørvig')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4583, N'Sjællands Odde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4591, N'Føllenslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4592, N'Sejerø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4593, N'Eskebjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4600, N'Køge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4621, N'Gadstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4622, N'Havdrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4623, N'Lille Skensved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4632, N'Bjæverskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4640, N'Fakse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4652, N'Hårlev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4653, N'Karise')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4654, N'Fakse Ladeplads')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4660, N'Store Heddinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4671, N'Strøby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4672, N'Klippinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4673, N'Rødvig Stevns')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4681, N'Herfølge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4682, N'Tureby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4683, N'Rønnede')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4684, N'Holme-Olstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4690, N'Haslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4700, N'Næstved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4720, N'Præstø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4733, N'Tappernøje')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4735, N'Mern')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4736, N'Karrebæksminde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4750, N'Lundby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4760, N'Vordingborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4771, N'Kalvehave')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4772, N'Langebæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4773, N'Stensved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4780, N'Stege')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4791, N'Borre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4792, N'Askeby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4793, N'Bogø By')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4800, N'Nykøbing F')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4840, N'Nørre Alslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4850, N'Stubbekøbing')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4862, N'Guldborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4863, N'Eskilstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4871, N'Horbelev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4872, N'Cityidestrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4873, N'Væggerløse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4874, N'Gedser')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4880, N'Nysted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4891, N'Toreby L')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4892, N'Kettinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4894, N'Øster Ulslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4895, N'Errindlev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4900, N'Nakskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4912, N'Harpelunde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4913, N'Horslunde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4920, N'Søllested')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4930, N'Maribo')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4941, N'Bandholm')
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4943, N'Torrig L')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4944, N'Fejø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4951, N'Nørreballe')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4952, N'Stokkemarke')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4953, N'Vesterborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4960, N'Holeby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4970, N'Rødby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4983, N'Dannemare')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (4990, N'Sakskøbing')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5000, N'Odense C')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5200, N'Odense V')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5210, N'Odense NV')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5220, N'Odense SØ')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5230, N'Odense M')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5240, N'Odense NØ')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5250, N'Odense SV')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5260, N'Odense S')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5270, N'Odense N')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5290, N'Marslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5300, N'Kerteminde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5330, N'Munkebo')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5350, N'Rynkeby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5370, N'Mesinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5380, N'Dalby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5390, N'Martofte')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5400, N'Bogense')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5450, N'Otterup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5462, N'Morud')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5463, N'Harndrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5464, N'Brenderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5466, N'Asperup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5471, N'Søndersø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5474, N'Veflinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5485, N'Skamby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5491, N'Blommenslyst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5492, N'Vissenbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5500, N'MCityiddelfart')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5540, N'Ullerslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5550, N'Langeskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5560, N'Aarup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5580, N'Nørre Aaby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5591, N'Gelsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5592, N'Ejby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5600, N'Faaborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5610, N'Assens')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5620, N'Glamsbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5631, N'Ebberup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5642, N'Millinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5672, N'Broby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5683, N'Haarby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5690, N'Tommerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5700, N'Svendborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5750, N'Ringe')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5762, N'Vester Skerninge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5771, N'Stenstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5772, N'Kværndrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5792, N'Årslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5800, N'Nyborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5853, N'Ørbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5854, N'Gislev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5856, N'Ryslinge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5863, N'Ferritslev Fyn')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5871, N'Frørup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5874, N'Hesselager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5881, N'Skårup Fyn')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5882, N'Vejstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5883, N'Oure')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5884, N'Gudme')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5892, N'Gudbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5900, N'Rudkøbing')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5932, N'Humble')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5935, N'Bagenkop')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5953, N'Tranekær')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5960, N'Marstal')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5970, N'Ærøskøbing')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (5985, N'Søby Ærø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6000, N'Kolding')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6040, N'Egtved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6051, N'Almind')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6052, N'Viuf')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6064, N'Jordrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6070, N'Christiansfeld')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6091, N'Bjert')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6092, N'Sønder Stenderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6093, N'Sjølund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6094, N'Hejls')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6100, N'Haderslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6200, N'Aabenraa')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6230, N'Rødekro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6240, N'Løgumkloster')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6261, N'Bredebro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6270, N'Tønder')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6280, N'Højer')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6300, N'Gråsten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6310, N'Broager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6320, N'Egernsund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6330, N'Padborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6340, N'Kruså')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6360, N'Tinglev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6372, N'Bylderup-Bov')
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6392, N'Bolderslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6400, N'Sønderborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6430, N'Nordborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6440, N'Augustenborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6470, N'Sydals')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6500, N'Vojens')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6510, N'Gram')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6520, N'Toftlund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6535, N'Branderup J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6541, N'Bevtoft')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6560, N'Sommersted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6580, N'Vamdrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6600, N'Vejen')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6621, N'Gesten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6622, N'Bække')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6623, N'Vorbasse')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6630, N'Rødding')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6640, N'Lunderskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6650, N'Brørup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6660, N'Lintrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6670, N'Holsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6682, N'Hovborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6683, N'Føvling')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6690, N'Gørding')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6700, N'Esbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6701, N'Esbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6705, N'Esbjerg Ø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6710, N'Esbjerg V')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6715, N'Esbjerg N')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6720, N'Fanø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6731, N'Tjæreborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6740, N'Bramming')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6752, N'Glejbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6760, N'Ribe')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6771, N'Gredstedbro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6780, N'Skærbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6792, N'Rømø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6800, N'Varde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6818, N'Årre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6823, N'Ansager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6830, N'Nørre Nebel')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6840, N'Oksbøl')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6851, N'Janderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6852, N'Billum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6853, N'Vejers Strand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6854, N'Henne')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6855, N'Outrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6857, N'Blåvand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6862, N'Tistrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6870, N'Ølgod')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6880, N'Tarm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6893, N'Hemmet')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6900, N'Skjern')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6920, N'VCityidebæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6933, N'Kibæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6940, N'Lem St')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6950, N'Ringkøbing')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6960, N'HvCityide Sande')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6971, N'Spjald')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6973, N'Ørnhøj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6980, N'Tim')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (6990, N'Ulfborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7000, N'Fredericia')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7080, N'Børkop')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7100, N'Vejle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7120, N'Vejle Øst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7130, N'Juelsminde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7140, N'Stouby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7150, N'Barrit')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7160, N'Tørring')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7171, N'Uldum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7173, N'Vonge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7182, N'Bredsten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7183, N'Randbøl')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7184, N'Vandel')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7190, N'Billund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7200, N'Grindsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7250, N'Hejnsvig')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7260, N'Sønder Omme')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7270, N'Stakroge')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7280, N'Sønder Felding')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7300, N'Jelling')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7321, N'Gadbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7323, N'Give')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7330, N'Brande')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7361, N'Ejstrupholm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7362, N'Hampen')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7400, N'Herning')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7430, N'Ikast')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7441, N'Bording')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7442, N'Engesvang')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7451, N'Sunds')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7470, N'Karup J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7480, N'Vildbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7490, N'Aulum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7500, N'Holstebro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7540, N'Haderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7550, N'Sørvad')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7560, N'Hjerm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7570, N'Vemb')
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7600, N'Struer')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7620, N'Lemvig')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7650, N'Bøvlingbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7660, N'Bækmarksbro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7673, N'Harboøre')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7680, N'Thyborøn')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7700, N'Thisted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7730, N'Hanstholm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7741, N'Frøstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7742, N'Vesløs')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7752, N'Snedsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7755, N'Bedsted Thy')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7760, N'Hurup Thy')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7770, N'Vestervig')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7790, N'Thyholm')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7800, N'Skive')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7830, N'Vinderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7840, N'Højslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7850, N'Stoholm, Jylland')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7860, N'Spøttrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7870, N'Roslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7884, N'Fur')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7900, N'Nykøbing M')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7950, N'Erslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7960, N'Karby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7970, N'Redsted M')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7980, N'Vils')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (7990, N'Øster Assels')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8000, N'Århus C')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8200, N'Århus N')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8210, N'Århus V')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8220, N'Brabrand')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8230, N'Åbyhøj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8240, N'Risskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8250, N'Egå')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8260, N'Viby J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8270, N'Højbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8300, N'Odder')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8305, N'Samsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8310, N'Tranbjerg J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8320, N'Mårslet')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8330, N'Beder')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8340, N'Malling')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8350, N'Hundslund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8355, N'Solbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8361, N'Hasselager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8362, N'Hørning')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8370, N'Hadsten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8380, N'Trige')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8381, N'Tilst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8382, N'Hinnerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8400, N'Ebeltoft')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8410, N'Rønde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8420, N'Knebel')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8444, N'Balle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8450, N'Hammel')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8462, N'Harlev J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8464, N'Galten')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8471, N'Sabro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8472, N'Sporup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8500, N'Grenaa')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8520, N'Lystrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8530, N'Hjortshøj')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8541, N'Skødstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8543, N'Hornslet')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8544, N'Mørke')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8550, N'Ryomgård')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8560, N'Kolind')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8570, N'Trustrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8581, N'Nimtofte')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8585, N'Glesborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8586, N'Ørum Djurs')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8592, N'Anholt')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8600, N'Silkeborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8620, N'Kjellerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8632, N'Lemming')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8641, N'Sorring')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8643, N'Ans by')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8653, N'Them')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8654, N'Bryrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8660, N'Skanderborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8670, N'Låsby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8680, N'Ry')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8700, N'Horsens')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8721, N'Daugård')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8722, N'Hedensted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8723, N'Løsning')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8732, N'Hovedgård')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8740, N'Brædstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8751, N'Gedved')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8752, N'Østbirk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8762, N'Flemming')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8763, N'Rask Mølle')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8765, N' Klovborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8766, N'Nørre Snede')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8781, N'Stenderup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8783, N'Hornsyld')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8800, N'Viborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8830, N'Tjele')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8831, N'Løgstrup')
GO
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8832, N'Skals')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8840, N'Rødkærsbro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8850, N'Bjerringbro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8860, N'Ulstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8870, N'Langå')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8881, N'Thorsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8882, N'Fårvang')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8883, N'Gjern')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8900, N'Randers')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8950, N'Ørsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8961, N'Allingåbro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8963, N'Auning')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8970, N'Havndal')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8981, N'Spenstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8983, N'Gjerlev J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (8990, N'Fårup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9000, N'Aalborg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9200, N'Aalborg SV')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9210, N'Aalborg SØ')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9220, N'Aalborg Øst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9230, N'Svenstrup J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9240, N'Nibe')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9260, N'Gistrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9270, N'Klarup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9280, N'Storvorde')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9293, N'Kongerslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9300, N'Sæby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9310, N'Vodskov')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9320, N'Hjallerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9330, N'Dronninglund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9340, N'Asaa')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9352, N'Dybvad')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9362, N'Gandrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9370, N'Hals')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9380, N'Vestbjerg')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9381, N'Sulsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9382, N'Tylstrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9400, N'Nørresundby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9430, N'Vadum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9440, N'Aabybro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9460, N'Brovst')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9480, N'Løkken')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9490, N'Pandrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9492, N'Blokhus')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9493, N'Saltum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9500, N'Hobro')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9510, N'Arden')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9520, N'Skørping')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9530, N'Støvring')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9541, N'Suldrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9550, N'Mariager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9560, N'Hadsund')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9574, N'Bælum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9575, N'Terndrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9600, N'Aars')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9610, N'Nørager')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9620, N'Aalestrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9631, N'Gedsted')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9632, N'Møldrup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9640, N'Farsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9670, N'Løgstør')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9681, N'Ranum')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9690, N'Fjerritslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9700, N'Brønderslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9740, N'Jerslev J')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9750, N'Øster Vrå')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9760, N'Vrå')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9800, N'Hjørring')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9830, N'Tårs')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9850, N'Hirtshals')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9870, N'Sindal')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9881, N'Bindslev')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9900, N'Frederikshavn')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9940, N'Læsø')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9970, N'Strandby')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9981, N'Jerup')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9982, N'Ålbæk')
INSERT [dbo].[city] ([Cityid], [city]) VALUES (9990, N'Skagen')
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Genderid], [gender]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([Genderid], [gender]) VALUES (2, N'Female')
INSERT [dbo].[Gender] ([Genderid], [gender]) VALUES (3, N'TransMale')
INSERT [dbo].[Gender] ([Genderid], [gender]) VALUES (4, N'TransFemale')
INSERT [dbo].[Gender] ([Genderid], [gender]) VALUES (5, N'Unknown')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([Id], [Username], [Brithdate], [Height], [Firstname], [Middlename], [Lastname], [Aboutme], [Cityid], [Genderid], [UserId]) VALUES (19, N'prinsess', CAST(N'2023-11-23T00:00:00.000' AS DateTime), N'60 cm', N'alexandra', N'powerbufgirl', N'powerbufgirl', N'jeg kæmper mød kriminele i børne tejnefilm', 2450, 2, 7)
INSERT [dbo].[UserProfile] ([Id], [Username], [Brithdate], [Height], [Firstname], [Middlename], [Lastname], [Aboutme], [Cityid], [Genderid], [UserId]) VALUES (20, N'prince', CAST(N'2023-11-22T00:00:00.000' AS DateTime), N'170 cm', N'peter ', N'parker', N'parker', N'jeg er spiderman og har været med i flere film', 2500, 1, 6)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([Likee])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[likes]  WITH CHECK ADD FOREIGN KEY([Liker])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([Cityid])
REFERENCES [dbo].[city] ([Cityid])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([Genderid])
REFERENCES [dbo].[Gender] ([Genderid])
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Account] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[Addacount]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Addacount]
@Username NVARCHAR(50),
@Password1 NVARCHAR(50),
@Email NVARCHAR(50),
@Userrole NVARCHAR(50)
as
begin
insert into Account (Username,Password1,Email,UserRole)
values (@Username,@Password1, @Email,@Userrole)
end

GO
/****** Object:  StoredProcedure [dbo].[AddLike]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddLike]
@Liker int,
@Likee int,
@Statuss int
as
begin
	if not exists (select 1 from likes where Liker = @Liker and Likee = @Likee and Statuss = @Statuss)
	begin
		insert into likes (Liker,Likee,statuss)
		values(@Liker,@Likee,1)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Authenticateuser]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Authenticateuser]
@Username nvarchar(50),
@Password1 nvarchar(50)
as
begin
select UserId,Username,Userrole
from Account
where Username = @Username and Password1 = @Password1
end

GO
/****** Object:  StoredProcedure [dbo].[CheckLikeStatus]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckLikeStatus]
@Liker int,
@Likee int,
@IsLiked bit output
as
begin
set nocount on;
select @IsLiked = case when count(*)>0 then 1 else 0 end
from likes
where Liker = @Liker and Likee = @Likee and Statuss = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteProfileAndAccount]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteProfileAndAccount]
@UserId int
as
begin
--Use the previously created procedures to delete the profile and account--
exec DeleteUserProfile @UserId;
exec DeleteUserAccount @UserId;
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserAccount]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteUserAccount]
@UserId int
as
begin
delete from Account where UserId = @UserId
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteUserProfile]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteUserProfile]
@UserId int
as
begin
delete from UserProfile where UserId = @UserId
end
--delete account from account table
GO
/****** Object:  StoredProcedure [dbo].[GetAllUserProfiles]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllUserProfiles]
as
begin
select UserId,Username,Brithdate,Height,Firstname,Middlename,Lastname,Aboutme,Cityid,Genderid
from UserProfile
end
GO
/****** Object:  StoredProcedure [dbo].[GetLikedProfiles]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetLikedProfiles]
@Liker int
as
begin
set nocount on;
select UserProfile.UserId
from likes
join UserProfile on likes.Likee = UserProfile.UserId
where likes.liker = @Liker and likes.Statuss = 1;
end
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUser]
@UserId int,
@Username nvarchar(50),
@Password1 nvarchar(50),
@Email nvarchar(50),
@Userrole nvarchar(50)
as
begin
select UserId,Username,Password1,Email,Userrole
from Account
where UserId = @UserId and Username = @Username and Password1 = @Password1 and Email = @Email and Userrole = @Userrole
end

GO
/****** Object:  StoredProcedure [dbo].[RemoveLike]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RemoveLike]
@Liker int,
@Likee int
as
begin
	delete from likes where Liker = @Liker and Likee = @Likee
end
GO
/****** Object:  StoredProcedure [dbo].[SaveUserProfile]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveUserProfile]
@Username NVARCHAR(50),
@Brithdate DATETIME,
@Height NVARCHAR(50),
@Firstname NVARCHAR(50),
@Middlename NVARCHAR(50)=null,
@Lastname NVARCHAR(50),
@Aboutme NVARCHAR(255),
@Cityid INT,
@Genderid INT,
@UserId INT
AS
BEGIN
    INSERT INTO UserProfile (Username, Brithdate, Height, Firstname, Middlename, Lastname, Aboutme, Cityid, Genderid, UserId)
    VALUES (@Username, @Brithdate, @Height, @Firstname, @Middlename, @Lastname, @Aboutme, @Cityid, @Genderid, @UserId);
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUSerProfile]    Script Date: 23-11-2023 13:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc	[dbo].[UpdateUSerProfile]
@Id INT,
@Username NVARCHAR(50),
@Brithdate DATETIME,
@Height NVARCHAR(50),
@Firstname NVARCHAR(50),
@Middlename NVARCHAR(50) = NULL,
@Lastname NVARCHAR(50),
@Aboutme NVARCHAR(255),
@Cityid INT,
@Genderid INT,
@UserId INT
as
begin
update UserProfile
set
Username = @Username,
Brithdate = @Brithdate,
Height = @Height,
Firstname = @Firstname,
Middlename = @Middlename,
Lastname = @Lastname,
Aboutme = @Aboutme,
Cityid = @Cityid,
Genderid = @Genderid,
UserId = @UserId
where Id = @Id
end
GO
USE [master]
GO
ALTER DATABASE [DatingApp] SET  READ_WRITE 
GO
