USE [master]
GO
/****** Object:  Database [PERFORMA]    Script Date: 10/15/2014 5:40:25 PM ******/
CREATE DATABASE [PERFORMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PERFORMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PERFORMA.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PERFORMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PERFORMA_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PERFORMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PERFORMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PERFORMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PERFORMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PERFORMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PERFORMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PERFORMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PERFORMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PERFORMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PERFORMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PERFORMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PERFORMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PERFORMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PERFORMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PERFORMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PERFORMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PERFORMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PERFORMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PERFORMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PERFORMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PERFORMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PERFORMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PERFORMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PERFORMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PERFORMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PERFORMA] SET  MULTI_USER 
GO
ALTER DATABASE [PERFORMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PERFORMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PERFORMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PERFORMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PERFORMA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PERFORMA]
GO
/****** Object:  Table [dbo].[INGRC_ATTCH]    Script Date: 10/15/2014 5:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_ATTCH](
	[ATCHID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NOT NULL,
	[TYPE] [nvarchar](5) NULL,
	[SIZE] [int] NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[REFID] [nvarchar](10) NOT NULL,
	[DOCOBJ] [nvarchar](10) NOT NULL,
	[URL] [nvarchar](255) NOT NULL,
	[DELFLAG] [nvarchar](1) NULL,
 CONSTRAINT [PK_INGRC_ATTCH] PRIMARY KEY CLUSTERED 
(
	[ATCHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_COWN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_COWN](
	[CTRLID] [nvarchar](8) NOT NULL,
	[OWNER] [nvarchar](12) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_COWN] PRIMARY KEY CLUSTERED 
(
	[CTRLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_CRISK]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_CRISK](
	[CTRLID] [nvarchar](8) NOT NULL,
	[RISKID] [nvarchar](8) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_CRISK] PRIMARY KEY CLUSTERED 
(
	[CTRLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_CTRL]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_CTRL](
	[CTRLID] [nvarchar](8) NOT NULL,
	[CNAME] [nvarchar](255) NOT NULL,
	[TEXT] [nvarchar](500) NULL,
	[CTYPE] [nvarchar](4) NOT NULL,
	[CREF] [nvarchar](255) NULL,
	[CFREQ] [smallint] NULL,
	[BPRC] [nvarchar](8) NULL,
	[SBPR] [nvarchar](8) NULL,
	[ORGC] [nvarchar](8) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_CTRL] PRIMARY KEY CLUSTERED 
(
	[CTRLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_LOGIN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_LOGIN](
	[USERNAME] [nvarchar](12) NOT NULL,
	[PASSWORD] [nvarchar](255) NOT NULL,
	[LOCK] [nvarchar](1) NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
	[TRDAT] [nvarchar](8) NULL,
	[LTIME] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_MENU_MASTER]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INGRC_MENU_MASTER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DISPLAYNAME] [varchar](255) NULL,
	[URL] [varchar](255) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[PARENT_ID] [int] NULL,
 CONSTRAINT [PK_INGRC_MENU_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INGRC_MENU_MASTER_LEFT]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INGRC_MENU_MASTER_LEFT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DISPLAYNAME] [varchar](255) NOT NULL,
	[URL] [varchar](255) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[PARENT_ID] [int] NULL,
	[MENU_MASTER_ID] [int] NOT NULL,
 CONSTRAINT [PK_INGRC_MENU_MASTER_LEFT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INGRC_RASSR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_RASSR](
	[RISKID] [nvarchar](8) NOT NULL,
	[ASSR] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_RISK]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_RISK](
	[RISKID] [nvarchar](8) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
	[LEVEL] [nvarchar](2) NOT NULL,
	[RTYPE] [nvarchar](4) NOT NULL,
	[STAT] [nvarchar](1) NOT NULL,
	[BPRC] [nvarchar](8) NOT NULL,
	[SBPR] [nvarchar](8) NOT NULL,
	[COBJ] [nvarchar](255) NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_RISK] PRIMARY KEY CLUSTERED 
(
	[RISKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_ROWN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_ROWN](
	[RISKID] [nvarchar](8) NOT NULL,
	[OWNER] [nvarchar](12) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_ROWN] PRIMARY KEY CLUSTERED 
(
	[RISKID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TASSR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TASSR](
	[ASSR] [nvarchar](4) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TASSR] PRIMARY KEY CLUSTERED 
(
	[ASSR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TBPR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TBPR](
	[BPRC] [nvarchar](8) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TBPR] PRIMARY KEY CLUSTERED 
(
	[BPRC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TCTY]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TCTY](
	[CTYPE] [nvarchar](4) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TCTY] PRIMARY KEY CLUSTERED 
(
	[CTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TDOC]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TDOC](
	[DOCOBJ] [nvarchar](10) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TDOC] PRIMARY KEY CLUSTERED 
(
	[DOCOBJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TORG]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TORG](
	[ORGC] [nvarchar](8) NOT NULL,
	[NAME] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TORG] PRIMARY KEY CLUSTERED 
(
	[ORGC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TOWN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TOWN](
	[OWNER] [nvarchar](12) NOT NULL,
	[USERNAME] [nvarchar](12) NULL,
	[RONER] [nvarchar](1) NULL,
	[CONER] [nvarchar](1) NULL,
	[SONER] [nvarchar](1) NULL,
	[SCNER] [nvarchar](1) NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
 CONSTRAINT [PK_INGRC_TOWN] PRIMARY KEY CLUSTERED 
(
	[OWNER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TOWNT]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TOWNT](
	[OWNTY] [nvarchar](4) NOT NULL,
	[OWNN] [nvarchar](255) NOT NULL,
	[LANG] [nvarchar](2) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TOWNT_1] PRIMARY KEY CLUSTERED 
(
	[OWNTY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TRCAT]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TRCAT](
	[LEVEL] [nvarchar](2) NOT NULL,
	[TEXT] [nvarchar](10) NULL,
	[COLOR] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_INGRC_TRCAT] PRIMARY KEY CLUSTERED 
(
	[LEVEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TRTY]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TRTY](
	[RTYPE] [nvarchar](4) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TRTY] PRIMARY KEY CLUSTERED 
(
	[RTYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_TSPR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_TSPR](
	[BPRC] [nvarchar](8) NOT NULL,
	[SBPR] [nvarchar](8) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_INGRC_TSPR] PRIMARY KEY CLUSTERED 
(
	[BPRC] ASC,
	[SBPR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_UGRP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_UGRP](
	[CLASS] [nvarchar](12) NOT NULL,
	[TEXT] [nvarchar](255) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INGRC_USER]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGRC_USER](
	[USERNAME] [nvarchar](12) NOT NULL,
	[FIRSTNAME] [nvarchar](255) NOT NULL,
	[LASTNAME] [nvarchar](255) NOT NULL,
	[CLASS] [nvarchar](12) NOT NULL,
	[CDBY] [nvarchar](12) NULL,
	[CDON] [nvarchar](8) NULL,
	[UPBY] [nvarchar](12) NULL,
	[UPON] [nvarchar](8) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[PHONE] [nvarchar](25) NULL,
	[EXT] [nvarchar](25) NULL,
	[MOBILE] [nvarchar](25) NULL,
	[FUNCTION] [nvarchar](255) NULL,
	[DEPARTMENT] [nvarchar](255) NULL,
	[ROOM] [nvarchar](255) NULL,
	[FLOOR] [nvarchar](25) NULL,
	[BUILDING] [nvarchar](255) NULL,
	[ORGC] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/FMP/C_MP_PRGRP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/FMP/C_MP_PRGRP](
	[MANDT] [nvarchar](3) NOT NULL,
	[/FMP/PRFRGR] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/ISDFPS/ADVCODE1]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/ISDFPS/ADVCODE1](
	[MANDT] [nvarchar](3) NOT NULL,
	[ADVCODE] [nvarchar](2) NOT NULL,
	[MAPO] [nvarchar](1) NULL,
	[ERLKZ] [nvarchar](1) NULL,
	[NORD] [nvarchar](1) NULL,
	[STACODE] [nvarchar](2) NULL,
	[NO_SUBST] [nvarchar](1) NULL,
	[NO_DELAY] [nvarchar](1) NULL,
	[FULL_QUANT_ONLY] [nvarchar](1) NULL,
	[COMPL_PACK_ONLY] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/ISDFPS/ADVCODE2]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/ISDFPS/ADVCODE2](
	[MANDT] [nvarchar](3) NOT NULL,
	[BSART] [nvarchar](4) NOT NULL,
	[ADVCODE] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/ISDFPS/CSTACODE]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/ISDFPS/CSTACODE](
	[MANDT] [nvarchar](3) NOT NULL,
	[STACODE] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/ISDFPS/REL]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/ISDFPS/REL](
	[MANDT] [nvarchar](3) NOT NULL,
	[RELOC_ID] [nvarchar](10) NOT NULL,
	[TYPE] [nvarchar](4) NULL,
	[STATUS] [nvarchar](40) NULL,
	[PLANNED_FROM] [nvarchar](8) NULL,
	[PLANNED_TO] [nvarchar](8) NULL,
	[WERKS_EXT] [nvarchar](4) NULL,
	[LNUMBER] [nvarchar](4) NULL,
	[LOCATION_S] [nvarchar](32) NULL,
	[LOCATION_D] [nvarchar](32) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/ISDFPS/RELSEQ]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/ISDFPS/RELSEQ](
	[MANDT] [nvarchar](3) NOT NULL,
	[RELOC_SEQ_ID] [nvarchar](4) NOT NULL,
	[SERVICE_ID] [nvarchar](1) NULL,
	[OWNER_NATION] [nvarchar](3) NULL,
	[RELSEQ_TYPE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_/VSO/M_PKG]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_/VSO/M_PKG](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PKGRP] [nvarchar](18) NOT NULL,
	[LOAD_SIDE_PREF] [nvarchar](1) NULL,
	[BAY_CAT_PREF] [nvarchar](3) NULL,
	[MAT_BAY_PREF] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ADRC]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ADRC](
	[CLIENT] [nvarchar](3) NOT NULL,
	[ADDRNUMBER] [nvarchar](10) NOT NULL,
	[DATE_FROM] [nvarchar](8) NOT NULL,
	[NATION] [nvarchar](1) NOT NULL,
	[DATE_TO] [nvarchar](8) NOT NULL,
	[TITLE] [nvarchar](4) NOT NULL,
	[NAME1] [nvarchar](40) NOT NULL,
	[NAME2] [nvarchar](40) NOT NULL,
	[NAME3] [nvarchar](40) NOT NULL,
	[NAME4] [nvarchar](40) NOT NULL,
	[NAME_TEXT] [nvarchar](50) NULL,
	[NAME_CO] [nvarchar](40) NOT NULL,
	[CITY1] [nvarchar](40) NOT NULL,
	[CITY2] [nvarchar](40) NOT NULL,
	[CITY_CODE] [nvarchar](12) NOT NULL,
	[CITYP_CODE] [nvarchar](8) NULL,
	[HOME_CITY] [nvarchar](40) NULL,
	[CITYH_CODE] [nvarchar](12) NULL,
	[CHCKSTATUS] [nvarchar](1) NULL,
	[REGIOGROUP] [nvarchar](8) NULL,
	[POST_CODE1] [nvarchar](10) NOT NULL,
	[POST_CODE2] [nvarchar](10) NOT NULL,
	[POST_CODE3] [nvarchar](10) NOT NULL,
	[PCODE1_EXT] [nvarchar](10) NULL,
	[PCODE2_EXT] [nvarchar](10) NULL,
	[PCODE3_EXT] [nvarchar](10) NULL,
	[PO_BOX] [nvarchar](10) NOT NULL,
	[DONT_USE_P] [nvarchar](4) NULL,
	[PO_BOX_NUM] [nvarchar](1) NULL,
	[PO_BOX_LOC] [nvarchar](40) NOT NULL,
	[CITY_CODE2] [nvarchar](12) NULL,
	[PO_BOX_REG] [nvarchar](3) NULL,
	[PO_BOX_CTY] [nvarchar](3) NULL,
	[POSTALAREA] [nvarchar](15) NOT NULL,
	[TRANSPZONE] [nvarchar](10) NOT NULL,
	[STREET] [nvarchar](60) NOT NULL,
	[DONT_USE_S] [nvarchar](4) NULL,
	[STREETCODE] [nvarchar](12) NOT NULL,
	[STREETABBR] [nvarchar](2) NOT NULL,
	[HOUSE_NUM1] [nvarchar](10) NOT NULL,
	[HOUSE_NUM2] [nvarchar](10) NOT NULL,
	[HOUSE_NUM3] [nvarchar](10) NOT NULL,
	[STR_SUPPL1] [nvarchar](40) NOT NULL,
	[STR_SUPPL2] [nvarchar](40) NOT NULL,
	[STR_SUPPL3] [nvarchar](40) NULL,
	[LOCATION] [nvarchar](40) NOT NULL,
	[BUILDING] [nvarchar](20) NOT NULL,
	[FLOOR] [nvarchar](10) NOT NULL,
	[ROOMNUMBER] [nvarchar](10) NOT NULL,
	[COUNTRY] [nvarchar](3) NOT NULL,
	[LANGU] [nvarchar](1) NOT NULL,
	[REGION] [nvarchar](3) NOT NULL,
	[ADDR_GROUP] [nvarchar](4) NOT NULL,
	[FLAGGROUPS] [nvarchar](1) NULL,
	[PERS_ADDR] [nvarchar](1) NOT NULL,
	[SORT1] [nvarchar](20) NOT NULL,
	[SORT2] [nvarchar](20) NOT NULL,
	[SORT_PHN] [nvarchar](20) NOT NULL,
	[DEFLT_COMM] [nvarchar](3) NOT NULL,
	[TEL_NUMBER] [nvarchar](30) NOT NULL,
	[TEL_EXTENS] [nvarchar](10) NOT NULL,
	[FAX_NUMBER] [nvarchar](30) NOT NULL,
	[FAX_EXTENS] [nvarchar](10) NOT NULL,
	[FLAGCOMM2] [nvarchar](1) NOT NULL,
	[FLAGCOMM3] [nvarchar](1) NOT NULL,
	[FLAGCOMM4] [nvarchar](1) NOT NULL,
	[FLAGCOMM5] [nvarchar](1) NOT NULL,
	[FLAGCOMM6] [nvarchar](1) NOT NULL,
	[FLAGCOMM7] [nvarchar](1) NOT NULL,
	[FLAGCOMM8] [nvarchar](1) NOT NULL,
	[FLAGCOMM9] [nvarchar](1) NOT NULL,
	[FLAGCOMM10] [nvarchar](1) NULL,
	[FLAGCOMM11] [nvarchar](1) NULL,
	[FLAGCOMM12] [nvarchar](1) NULL,
	[FLAGCOMM13] [nvarchar](1) NULL,
	[ADDRORIGIN] [nvarchar](4) NOT NULL,
	[MC_NAME1] [nvarchar](25) NOT NULL,
	[MC_CITY1] [nvarchar](25) NOT NULL,
	[MC_STREET] [nvarchar](25) NOT NULL,
	[EXTENSION1] [nvarchar](40) NOT NULL,
	[EXTENSION2] [nvarchar](40) NOT NULL,
	[TIME_ZONE] [nvarchar](6) NOT NULL,
	[TAXJURCODE] [nvarchar](15) NOT NULL,
	[ADDRESS_ID] [nvarchar](10) NULL,
	[LANGU_CREA] [nvarchar](1) NULL,
	[PO_BOX_LOBBY] [nvarchar](40) NULL,
	[DELI_SERV_TYPE] [nvarchar](4) NULL,
	[DELI_SERV_NUMBER] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ADRP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ADRP](
	[CLIENT] [nvarchar](3) NOT NULL,
	[PERSNUMBER] [nvarchar](10) NOT NULL,
	[DATE_FROM] [nvarchar](8) NOT NULL,
	[NATION] [nvarchar](1) NOT NULL,
	[DATE_TO] [nvarchar](8) NOT NULL,
	[TITLE] [nvarchar](4) NOT NULL,
	[NAME_FIRST] [nvarchar](40) NOT NULL,
	[NAME_LAST] [nvarchar](40) NOT NULL,
	[NAME2] [nvarchar](40) NOT NULL,
	[NAMEMIDDLE] [nvarchar](40) NULL,
	[NAME_LAST2] [nvarchar](40) NULL,
	[NAME_TEXT] [nvarchar](80) NULL,
	[CONVERTED] [nvarchar](1) NULL,
	[TITLE_ACA1] [nvarchar](4) NOT NULL,
	[TITLE_ACA2] [nvarchar](4) NULL,
	[PREFIX1] [nvarchar](4) NOT NULL,
	[PREFIX2] [nvarchar](4) NULL,
	[TITLE_SPPL] [nvarchar](4) NOT NULL,
	[NICKNAME] [nvarchar](40) NOT NULL,
	[INITIALS] [nvarchar](10) NULL,
	[NAMEFORMAT] [nvarchar](2) NULL,
	[NAMCOUNTRY] [nvarchar](3) NULL,
	[PROFESSION] [nvarchar](40) NOT NULL,
	[SEX] [nvarchar](1) NOT NULL,
	[LANGU] [nvarchar](1) NOT NULL,
	[PERS_GROUP] [nvarchar](4) NOT NULL,
	[FLAGGROUPS] [nvarchar](1) NULL,
	[SORT1] [nvarchar](20) NOT NULL,
	[SORT2] [nvarchar](20) NOT NULL,
	[SORT_PHN] [nvarchar](20) NOT NULL,
	[ADDR_COMP] [nvarchar](10) NOT NULL,
	[ADDR_PERS] [nvarchar](10) NOT NULL,
	[FLPERSTEL] [nvarchar](1) NOT NULL,
	[FLPERSCOMM] [nvarchar](1) NOT NULL,
	[PERSORIGIN] [nvarchar](4) NOT NULL,
	[MC_NAMEFIR] [nvarchar](25) NOT NULL,
	[MC_NAMELAS] [nvarchar](25) NOT NULL,
	[MC_NAME2] [nvarchar](25) NULL,
	[LANGU_CREA] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AENR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AENR](
	[MANDT] [nvarchar](3) NOT NULL,
	[AENNR] [nvarchar](12) NOT NULL,
	[AENST] [nvarchar](2) NULL,
	[AENBE] [nvarchar](4) NULL,
	[DATUV] [nvarchar](8) NULL,
	[TECHV] [nvarchar](12) NULL,
	[ANDAT] [nvarchar](8) NULL,
	[ANNAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AETXT] [nvarchar](40) NULL,
	[LTXSP] [nvarchar](1) NULL,
	[AEGRU] [nvarchar](40) NULL,
	[CCART] [nvarchar](3) NULL,
	[CCSTM] [nvarchar](8) NULL,
	[DYDAT] [nvarchar](1) NULL,
	[CONT1] [nvarchar](1) NULL,
	[AEFUN] [nvarchar](1) NULL,
	[UESTR] [nvarchar](1) NULL,
	[RLKEY] [nvarchar](2) NULL,
	[LVORM] [nvarchar](1) NULL,
	[CLINT] [nvarchar](10) NULL,
	[AERNG] [nvarchar](2) NULL,
	[RLDAT] [nvarchar](8) NULL,
	[RLTIM] [nvarchar](6) NULL,
	[TEREL] [nvarchar](1) NULL,
	[NACHT] [nvarchar](1) NULL,
	[INDAT] [nvarchar](8) NULL,
	[AUDAT] [nvarchar](8) NULL,
	[FLUSE] [nvarchar](1) NULL,
	[AEDIF] [nvarchar](10) NULL,
	[ERLED] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_1016B]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_1016B](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[COUNTER] [smallint] NOT NULL,
	[PROFILE] [nvarchar](12) NOT NULL,
	[VARIANT] [nvarchar](4) NULL,
	[GENERATED] [nvarchar](1) NOT NULL,
	[PSTATE] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_AGRS]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_AGRS](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[CHILD_AGR] [nvarchar](30) NOT NULL,
	[ATTRIBUTES] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_DEFINE]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_DEFINE](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[PARENT_AGR] [nvarchar](30) NULL,
	[CREATE_USR] [nvarchar](12) NULL,
	[CREATE_DAT] [nvarchar](8) NULL,
	[CREATE_TIM] [nvarchar](6) NULL,
	[CREATE_TMP] [nvarchar](15) NULL,
	[CHANGE_USR] [nvarchar](12) NULL,
	[CHANGE_DAT] [nvarchar](8) NULL,
	[CHANGE_TIM] [nvarchar](6) NULL,
	[CHANGE_TMP] [nvarchar](15) NULL,
	[ATTRIBUTES] [nvarchar](10) NULL,
 CONSTRAINT [PK_SAP_AGR_DEFINE] PRIMARY KEY CLUSTERED 
(
	[AGR_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_PROF]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_PROF](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[LANGU] [nvarchar](1) NOT NULL,
	[PROFILE] [nvarchar](12) NULL,
	[PTEXT] [nvarchar](60) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_TEXTS]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_TEXTS](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[SPRAS] [nvarchar](1) NOT NULL,
	[LINE] [nvarchar](5) NULL,
	[TEXT] [nvarchar](80) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AGR_USERS]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AGR_USERS](
	[MANDT] [nvarchar](3) NOT NULL,
	[AGR_NAME] [nvarchar](30) NOT NULL,
	[UNAME] [nvarchar](12) NOT NULL,
	[FROM_DAT] [nvarchar](8) NULL,
	[TO_DAT] [nvarchar](8) NULL,
	[EXCLUDE] [nvarchar](1) NULL,
	[CHANGE_DAT] [nvarchar](8) NULL,
	[CHANGE_TIM] [nvarchar](6) NULL,
	[CHANGE_TST] [int] NULL,
	[ORG_FLAG] [nvarchar](1) NULL,
	[COL_FLAG] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AKKP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AKKP](
	[MANDT] [nvarchar](3) NOT NULL,
	[LCNUM] [nvarchar](10) NOT NULL,
	[REFLCNUM] [nvarchar](40) NULL,
	[AKKEI] [nvarchar](1) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[AKART] [nvarchar](2) NULL,
	[AKKTP] [nvarchar](1) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[ELIFN] [nvarchar](10) NULL,
	[CADNR] [nvarchar](10) NULL,
	[INTER] [nvarchar](1) NULL,
	[WAEMP] [nvarchar](10) NULL,
	[CADNR_WE] [nvarchar](10) NULL,
	[AKKST] [nvarchar](1) NULL,
	[TSSTA] [nvarchar](14) NULL,
	[TZSTA] [nvarchar](6) NULL,
	[KOMMA] [nvarchar](40) NULL,
	[TSSTB] [nvarchar](14) NULL,
	[TZSTB] [nvarchar](6) NULL,
	[KOMMB] [nvarchar](40) NULL,
	[TSSTC] [nvarchar](14) NULL,
	[TZSTC] [nvarchar](6) NULL,
	[KOMMC] [nvarchar](40) NULL,
	[TSSTD] [nvarchar](14) NULL,
	[TZSTD] [nvarchar](6) NULL,
	[KOMMD] [nvarchar](40) NULL,
	[TSSTE] [nvarchar](14) NULL,
	[TZSTE] [nvarchar](6) NULL,
	[KOMME] [nvarchar](40) NULL,
	[AENDGRUND] [nvarchar](1) NULL,
	[TSSTF] [nvarchar](14) NULL,
	[TZSTF] [nvarchar](6) NULL,
	[KOMMF] [nvarchar](40) NULL,
	[TSSTZ] [nvarchar](14) NULL,
	[TZSTZ] [nvarchar](6) NULL,
	[KOMMZ] [nvarchar](40) NULL,
	[AADAT] [nvarchar](14) NULL,
	[AATZO] [nvarchar](6) NULL,
	[AIDAT] [nvarchar](14) NULL,
	[AITZO] [nvarchar](6) NULL,
	[AJDAT] [nvarchar](14) NULL,
	[AJTZO] [nvarchar](6) NULL,
	[AXDAT] [nvarchar](14) NULL,
	[AXTZO] [nvarchar](6) NULL,
	[AXLND] [nvarchar](3) NULL,
	[AXORT] [nvarchar](4) NULL,
	[AXREG] [nvarchar](3) NULL,
	[AYDAT] [nvarchar](14) NULL,
	[AYTZO] [nvarchar](6) NULL,
	[AODAT] [nvarchar](14) NULL,
	[AOTZO] [nvarchar](6) NULL,
	[AHDAT] [nvarchar](14) NULL,
	[AHTZO] [nvarchar](6) NULL,
	[ANYTG] [nvarchar](3) NULL,
	[WRTAK] [decimal](15, 2) NULL,
	[WAERS] [nvarchar](5) NULL,
	[IAPRZ] [decimal](5, 2) NULL,
	[EUPRZ] [decimal](5, 2) NULL,
	[ZTERM] [nvarchar](4) NULL,
	[INCO1] [nvarchar](3) NULL,
	[INCO2] [nvarchar](28) NULL,
	[AUTLF] [nvarchar](1) NULL,
	[ATRSI] [nvarchar](1) NULL,
	[AMINQ] [decimal](13, 3) NULL,
	[AMAXQ] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT_TS] [nvarchar](14) NULL,
	[ERDAT_TZ] [nvarchar](6) NULL,
	[VOLL] [nvarchar](1) NULL,
	[AKKCONFIRM] [nvarchar](12) NULL,
	[UNPRZ] [decimal](5, 2) NULL,
	[KUNFS] [nvarchar](1) NULL,
	[KUNCK] [nvarchar](1) NULL,
	[AADFS] [nvarchar](1) NULL,
	[AADCK] [nvarchar](1) NULL,
	[AIDFS] [nvarchar](1) NULL,
	[AIDCK] [nvarchar](1) NULL,
	[AEDFS] [nvarchar](1) NULL,
	[AEDCK] [nvarchar](1) NULL,
	[AXDFS] [nvarchar](1) NULL,
	[AXDCK] [nvarchar](1) NULL,
	[AVDFS] [nvarchar](1) NULL,
	[AVDCK] [nvarchar](1) NULL,
	[ALDFS] [nvarchar](1) NULL,
	[ALDCK] [nvarchar](1) NULL,
	[ADDFS] [nvarchar](1) NULL,
	[ADDCK] [nvarchar](1) NULL,
	[AWEFS] [nvarchar](1) NULL,
	[AWECK] [nvarchar](1) NULL,
	[IAPFS] [nvarchar](1) NULL,
	[EUPFS] [nvarchar](1) NULL,
	[EUPCK] [nvarchar](1) NULL,
	[TEZFS] [nvarchar](1) NULL,
	[TEZCK] [nvarchar](1) NULL,
	[INCFS] [nvarchar](1) NULL,
	[INCCK] [nvarchar](1) NULL,
	[AUTFS] [nvarchar](1) NULL,
	[AUTCK] [nvarchar](1) NULL,
	[ATRFS] [nvarchar](1) NULL,
	[ATRCK] [nvarchar](1) NULL,
	[AMIFS] [nvarchar](1) NULL,
	[AMICK] [nvarchar](1) NULL,
	[TXTGR] [nvarchar](2) NULL,
	[FDLANGU] [nvarchar](1) NULL,
	[REFFS] [nvarchar](1) NULL,
	[INDGRUND] [nvarchar](1) NULL,
	[DOKFREI] [nvarchar](1) NULL,
	[FTCCD] [nvarchar](1) NULL,
	[DDZCK] [nvarchar](1) NULL,
	[DDICK] [nvarchar](1) NULL,
	[UNPFS] [nvarchar](1) NULL,
	[UNPCK] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ANLA]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ANLA](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[ANLN1] [nvarchar](12) NOT NULL,
	[ANLN2] [nvarchar](4) NOT NULL,
	[ANLKL] [nvarchar](8) NULL,
	[GEGST] [nvarchar](8) NULL,
	[ANLAR] [nvarchar](5) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[XLOEV] [nvarchar](1) NULL,
	[XSPEB] [nvarchar](1) NULL,
	[FELEI] [nvarchar](4) NULL,
	[KTOGR] [nvarchar](8) NULL,
	[XOPVW] [nvarchar](1) NULL,
	[ANLTP] [nvarchar](1) NULL,
	[ZUJHR] [nvarchar](4) NULL,
	[ZUPER] [nvarchar](3) NULL,
	[ZUGDT] [nvarchar](8) NULL,
	[AKTIV] [nvarchar](8) NULL,
	[ABGDT] [nvarchar](8) NULL,
	[DEAKT] [nvarchar](8) NULL,
	[GPLAB] [nvarchar](8) NULL,
	[BSTDT] [nvarchar](8) NULL,
	[ORD41] [nvarchar](4) NULL,
	[ORD42] [nvarchar](4) NULL,
	[ORD43] [nvarchar](4) NULL,
	[ORD44] [nvarchar](4) NULL,
	[ANLUE] [nvarchar](12) NULL,
	[ZUAWA] [nvarchar](3) NULL,
	[ANEQK] [nvarchar](1) NULL,
	[ANEQS] [nvarchar](1) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[LAND1] [nvarchar](3) NULL,
	[LIEFE] [nvarchar](30) NULL,
	[HERST] [nvarchar](30) NULL,
	[EIGKZ] [nvarchar](1) NULL,
	[AIBN1] [nvarchar](12) NULL,
	[AIBN2] [nvarchar](4) NULL,
	[AIBDT] [nvarchar](8) NULL,
	[URJHR] [nvarchar](4) NULL,
	[URWRT] [decimal](13, 2) NULL,
	[ANTEI] [decimal](5, 2) NULL,
	[PROJN] [nvarchar](16) NULL,
	[EAUFN] [nvarchar](12) NULL,
	[MEINS] [nvarchar](3) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[TYPBZ] [nvarchar](15) NULL,
	[IZWEK] [nvarchar](2) NULL,
	[INKEN] [nvarchar](1) NULL,
	[IVDAT] [nvarchar](8) NULL,
	[INVZU] [nvarchar](15) NULL,
	[VMGLI] [nvarchar](4) NULL,
	[XVRMW] [nvarchar](1) NULL,
	[WRTMA] [decimal](13, 2) NULL,
	[EHWRT] [decimal](13, 2) NULL,
	[AUFLA] [nvarchar](8) NULL,
	[EHWZU] [nvarchar](8) NULL,
	[EHWNR] [nvarchar](16) NULL,
	[GRUVO] [nvarchar](8) NULL,
	[GREIN] [nvarchar](8) NULL,
	[GRBND] [nvarchar](5) NULL,
	[GRBLT] [nvarchar](5) NULL,
	[GRLFD] [nvarchar](4) NULL,
	[FLURK] [nvarchar](4) NULL,
	[FLURN] [nvarchar](10) NULL,
	[FIAMT] [nvarchar](25) NULL,
	[STADT] [nvarchar](25) NULL,
	[GRUND] [nvarchar](3) NULL,
	[FEINS] [nvarchar](3) NULL,
	[GRUFL] [decimal](13, 3) NULL,
	[INVNR] [nvarchar](25) NULL,
	[VBUND] [nvarchar](6) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TXT50] [nvarchar](50) NULL,
	[TXA50] [nvarchar](50) NULL,
	[XLTXID] [nvarchar](1) NULL,
	[XVERID] [nvarchar](1) NULL,
	[XTCHID] [nvarchar](1) NULL,
	[XKALID] [nvarchar](1) NULL,
	[XHERID] [nvarchar](1) NULL,
	[XLEAID] [nvarchar](1) NULL,
	[LEAFI] [nvarchar](10) NULL,
	[LVDAT] [nvarchar](8) NULL,
	[LKDAT] [nvarchar](8) NULL,
	[LEABG] [nvarchar](8) NULL,
	[LEJAR] [nvarchar](3) NULL,
	[LEPER] [nvarchar](3) NULL,
	[LRYTH] [nvarchar](3) NULL,
	[LEGEB] [decimal](13, 2) NULL,
	[LBASW] [decimal](13, 2) NULL,
	[LKAUF] [decimal](13, 2) NULL,
	[LMZIN] [decimal](7, 4) NULL,
	[LZINS] [decimal](7, 4) NULL,
	[LTZBW] [nvarchar](8) NULL,
	[LKUZA] [decimal](13, 2) NULL,
	[LKUZI] [decimal](13, 2) NULL,
	[LLAVB] [decimal](13, 2) NULL,
	[LEANZ] [decimal](5, 0) NULL,
	[LVTNR] [nvarchar](15) NULL,
	[LETXT] [nvarchar](50) NULL,
	[XAKTIV] [nvarchar](1) NULL,
	[ANUPD] [nvarchar](1) NULL,
	[LBLNR] [nvarchar](10) NULL,
	[XV0DT] [nvarchar](8) NULL,
	[XV0NM] [nvarchar](12) NULL,
	[XV1DT] [nvarchar](8) NULL,
	[XV1NM] [nvarchar](12) NULL,
	[XV2DT] [nvarchar](8) NULL,
	[XV2NM] [nvarchar](12) NULL,
	[XV3DT] [nvarchar](8) NULL,
	[XV3NM] [nvarchar](12) NULL,
	[XV4DT] [nvarchar](8) NULL,
	[XV4NM] [nvarchar](12) NULL,
	[XV5DT] [nvarchar](8) NULL,
	[XV5NM] [nvarchar](12) NULL,
	[XV6DT] [nvarchar](8) NULL,
	[XV6NM] [nvarchar](12) NULL,
	[AIMMO] [nvarchar](1) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[LEART] [nvarchar](2) NULL,
	[LVORS] [nvarchar](1) NULL,
	[GDLGRP] [nvarchar](8) NULL,
	[POSNR] [nvarchar](8) NULL,
	[XERWRT] [nvarchar](1) NULL,
	[XAFABCH] [nvarchar](1) NULL,
	[XANLGR] [nvarchar](1) NOT NULL,
	[MCOA1] [nvarchar](30) NULL,
	[XINVM] [nvarchar](1) NULL,
	[SERNR] [nvarchar](18) NULL,
	[UMWKZ] [nvarchar](5) NULL,
	[LRVDAT] [nvarchar](8) NULL,
	[ACT_CHANGE_PM] [nvarchar](1) NULL,
	[HAS_TDDP] [nvarchar](1) NULL,
	[LAST_REORG_DATE] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ANLH]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ANLH](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[ANLN1] [nvarchar](12) NOT NULL,
	[LUNTN] [nvarchar](4) NULL,
	[LANEP] [nvarchar](5) NULL,
	[ANUPD] [nvarchar](1) NULL,
	[FUNTN] [nvarchar](4) NULL,
	[ANLHTXT] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ASMD]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ASMD](
	[MANDT] [nvarchar](3) NOT NULL,
	[ASNUM] [nvarchar](18) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[LVORM] [nvarchar](1) NOT NULL,
	[MATKL] [nvarchar](9) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[ASTYP] [nvarchar](4) NOT NULL,
	[PAKNR] [nvarchar](10) NOT NULL,
	[EAN11] [nvarchar](18) NOT NULL,
	[NUMTP] [nvarchar](2) NOT NULL,
	[SPART] [nvarchar](2) NOT NULL,
	[BEGRU] [nvarchar](4) NOT NULL,
	[MSTAE] [nvarchar](2) NOT NULL,
	[MSTDE] [nvarchar](8) NOT NULL,
	[BKLAS] [nvarchar](4) NOT NULL,
	[LSTHI] [nvarchar](18) NOT NULL,
	[MLANG] [nvarchar](1) NOT NULL,
	[LGART] [nvarchar](4) NOT NULL,
	[LBNUM] [nvarchar](3) NOT NULL,
	[AUSGB] [nvarchar](4) NOT NULL,
	[STLVPOS] [nvarchar](18) NOT NULL,
	[TAXIM] [nvarchar](1) NULL,
	[IWUMZ] [decimal](5, 0) NULL,
	[IWUMN] [decimal](5, 0) NULL,
	[IWEIN] [nvarchar](3) NULL,
	[FORMELNR] [nvarchar](10) NULL,
	[CHGTEXT] [nvarchar](1) NULL,
	[IMAGE_URL] [nvarchar](132) NULL,
	[TAXTARIFFCODE] [nvarchar](16) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUFG]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUFG](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[ABELG] [nvarchar](5) NOT NULL,
	[FIGRI] [nvarchar](10) NOT NULL,
	[FIGRP] [nvarchar](18) NOT NULL,
	[GRMAN] [nvarchar](1) NOT NULL,
	[ANZFI] [nvarchar](5) NOT NULL,
	[PMNGU] [decimal](13, 3) NOT NULL,
	[IMNGU] [decimal](13, 3) NOT NULL,
	[MMNGU] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[SPERR] [nvarchar](1) NULL,
	[VQUOT] [nvarchar](13) NULL,
	[HMNGU] [decimal](13, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUFI]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUFI](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[ABELG] [nvarchar](5) NOT NULL,
	[ABELF] [nvarchar](5) NOT NULL,
	[FILNR] [nvarchar](10) NOT NULL,
	[FIWRK] [nvarchar](4) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[EKGRP] [nvarchar](3) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[LFNRU] [nvarchar](10) NOT NULL,
	[PMNGU] [decimal](13, 3) NOT NULL,
	[IMNGU] [decimal](13, 3) NOT NULL,
	[MMNGU] [decimal](13, 3) NOT NULL,
	[WMNGE] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NOT NULL,
	[LIEFW] [nvarchar](1) NOT NULL,
	[EBLNU] [nvarchar](10) NOT NULL,
	[EBLPU] [nvarchar](5) NOT NULL,
	[UBSTN] [nvarchar](10) NOT NULL,
	[UBSTP] [nvarchar](5) NOT NULL,
	[VBLNU] [nvarchar](10) NOT NULL,
	[VBLPU] [nvarchar](6) NOT NULL,
	[BEDAT] [nvarchar](8) NOT NULL,
	[BEDTP] [nvarchar](1) NOT NULL,
	[VKDAT] [nvarchar](8) NOT NULL,
	[VKTYP] [nvarchar](1) NOT NULL,
	[LEWED] [nvarchar](8) NOT NULL,
	[VZENT] [nvarchar](10) NOT NULL,
	[VZWRK] [nvarchar](4) NOT NULL,
	[VZLFR] [nvarchar](10) NULL,
	[AAVIT] [nvarchar](4) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[ABFDT] [nvarchar](8) NULL,
	[ABFTP] [nvarchar](1) NULL,
	[PSTAB] [nvarchar](1) NULL,
	[VKORG] [nvarchar](4) NULL,
	[VTWEG] [nvarchar](2) NULL,
	[SPART] [nvarchar](2) NULL,
	[BSTMG] [decimal](13, 3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[UMLMG] [decimal](13, 3) NULL,
	[UMLME] [nvarchar](3) NULL,
	[LFMNG] [decimal](13, 3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[SPERR] [nvarchar](1) NULL,
	[VQUOT] [nvarchar](13) NULL,
	[WMERF] [nvarchar](1) NULL,
	[BMERF] [nvarchar](1) NULL,
	[BEWZA] [nvarchar](13) NULL,
	[LABST] [decimal](13, 3) NULL,
	[HMNGU] [decimal](13, 3) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[LAND1] [nvarchar](3) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[LGORT] [nvarchar](4) NULL,
	[ABFST] [nvarchar](1) NULL,
	[ABAST] [nvarchar](1) NULL,
	[BLGTP] [nvarchar](1) NULL,
	[EXPECTED_SALES] [nvarchar](13) NULL,
	[OPEN_ORDERS] [decimal](13, 3) NULL,
	[TREND_FACTOR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUFK]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUFK](
	[MANDT] [nvarchar](3) NOT NULL,
	[AUFNR] [nvarchar](12) NOT NULL,
	[AUART] [nvarchar](4) NULL,
	[AUTYP] [nvarchar](2) NULL,
	[REFNR] [nvarchar](12) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[KTEXT] [nvarchar](40) NULL,
	[LTEXT] [nvarchar](1) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[WERKS] [nvarchar](4) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[CCKEY] [nvarchar](23) NULL,
	[KOSTV] [nvarchar](10) NULL,
	[STORT] [nvarchar](10) NULL,
	[SOWRK] [nvarchar](4) NULL,
	[ASTKZ] [nvarchar](1) NULL,
	[WAERS] [nvarchar](5) NULL,
	[ASTNR] [nvarchar](2) NULL,
	[STDAT] [nvarchar](8) NULL,
	[ESTNR] [nvarchar](2) NULL,
	[PHAS0] [nvarchar](1) NULL,
	[PHAS1] [nvarchar](1) NULL,
	[PHAS2] [nvarchar](1) NULL,
	[PHAS3] [nvarchar](1) NULL,
	[PDAT1] [nvarchar](8) NULL,
	[PDAT2] [nvarchar](8) NULL,
	[PDAT3] [nvarchar](8) NULL,
	[IDAT1] [nvarchar](8) NULL,
	[IDAT2] [nvarchar](8) NULL,
	[IDAT3] [nvarchar](8) NULL,
	[OBJID] [nvarchar](1) NULL,
	[VOGRP] [nvarchar](4) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[PLGKZ] [nvarchar](1) NULL,
	[KVEWE] [nvarchar](1) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[ZSCHL] [nvarchar](6) NULL,
	[ABKRS] [nvarchar](2) NULL,
	[KSTAR] [nvarchar](10) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[SAKNR] [nvarchar](10) NULL,
	[SETNM] [nvarchar](12) NULL,
	[CYCLE] [nvarchar](10) NULL,
	[SDATE] [nvarchar](8) NULL,
	[SEQNR] [nvarchar](4) NULL,
	[USER0] [nvarchar](20) NULL,
	[USER1] [nvarchar](20) NULL,
	[USER2] [nvarchar](20) NULL,
	[USER3] [nvarchar](20) NULL,
	[USER4] [decimal](11, 2) NULL,
	[USER5] [nvarchar](8) NULL,
	[USER6] [nvarchar](15) NULL,
	[USER7] [nvarchar](8) NULL,
	[USER8] [nvarchar](8) NULL,
	[USER9] [nvarchar](1) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PSPEL] [nvarchar](8) NULL,
	[AWSLS] [nvarchar](6) NULL,
	[ABGSL] [nvarchar](6) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[FUNC_AREA] [nvarchar](16) NULL,
	[SCOPE] [nvarchar](2) NULL,
	[PLINT] [nvarchar](1) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[AUFEX] [nvarchar](20) NULL,
	[IVPRO] [nvarchar](6) NULL,
	[LOGSYSTEM] [nvarchar](10) NULL,
	[FLG_MLTPS] [nvarchar](1) NULL,
	[ABUKR] [nvarchar](4) NULL,
	[AKSTL] [nvarchar](10) NULL,
	[SIZECL] [nvarchar](2) NULL,
	[IZWEK] [nvarchar](2) NULL,
	[UMWKZ] [nvarchar](5) NULL,
	[KSTEMPF] [nvarchar](1) NULL,
	[ZSCHM] [nvarchar](7) NULL,
	[PKOSA] [nvarchar](12) NOT NULL,
	[ANFAUFNR] [nvarchar](12) NULL,
	[PROCNR] [nvarchar](12) NOT NULL,
	[PROTY] [nvarchar](4) NOT NULL,
	[RSORD] [nvarchar](1) NULL,
	[BEMOT] [nvarchar](2) NULL,
	[ADRNRA] [nvarchar](10) NULL,
	[ERFZEIT] [nvarchar](6) NULL,
	[AEZEIT] [nvarchar](6) NULL,
	[CSTG_VRNT] [nvarchar](4) NULL,
	[COSTESTNR] [nvarchar](12) NULL,
	[VERAA_USER] [nvarchar](12) NULL,
	[VNAME] [nvarchar](6) NULL,
	[RECID] [nvarchar](2) NULL,
	[ETYPE] [nvarchar](3) NULL,
	[OTYPE] [nvarchar](4) NULL,
	[JV_JIBCL] [nvarchar](3) NULL,
	[JV_JIBSA] [nvarchar](5) NULL,
	[JV_OCO] [nvarchar](1) NULL,
	[/CUM/INDCU] [nvarchar](1) NULL,
	[/CUM/CMNUM] [nvarchar](12) NULL,
	[/CUM/AUEST] [nvarchar](1) NULL,
	[/CUM/DESNUM] [nvarchar](12) NULL,
	[VAPLZ] [nvarchar](8) NULL,
	[WAWRK] [nvarchar](4) NULL,
	[FERC_IND] [nvarchar](4) NULL,
	[CLAIM_CONTROL] [nvarchar](1) NULL,
	[UPDATE_NEEDED] [nvarchar](1) NULL,
	[UPDATE_CONTROL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUKO]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUKO](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[AUFAR] [nvarchar](4) NOT NULL,
	[BEZCH] [nvarchar](40) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[EKGRP] [nvarchar](3) NOT NULL,
	[ASTAK] [nvarchar](1) NOT NULL,
	[PSTAK] [nvarchar](1) NOT NULL,
	[SPERR] [nvarchar](1) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[LEPOS] [nvarchar](5) NOT NULL,
	[PINCR] [nvarchar](5) NOT NULL,
	[AFDAT] [nvarchar](8) NOT NULL,
	[AFDTP] [nvarchar](1) NOT NULL,
	[FBDAT] [nvarchar](8) NOT NULL,
	[FBDTP] [nvarchar](1) NOT NULL,
	[FLDAT] [nvarchar](8) NOT NULL,
	[FLDTP] [nvarchar](1) NOT NULL,
	[FUDAT] [nvarchar](8) NOT NULL,
	[FUDTP] [nvarchar](1) NOT NULL,
	[VKSDT] [nvarchar](8) NOT NULL,
	[VKSTP] [nvarchar](1) NOT NULL,
	[RFCDEST] [nvarchar](32) NULL,
	[ERVON] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AULW]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AULW](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[ABELG] [nvarchar](5) NOT NULL,
	[ABELF] [nvarchar](5) NOT NULL,
	[LWNUM] [nvarchar](3) NOT NULL,
	[WEDAT] [nvarchar](8) NOT NULL,
	[WETYP] [nvarchar](1) NOT NULL,
	[WEUZT] [nvarchar](6) NOT NULL,
	[WEPRZ] [nvarchar](3) NOT NULL,
	[MENGE] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NULL,
	[WEMNG] [decimal](13, 3) NOT NULL,
	[MBLNR] [nvarchar](10) NULL,
	[MBLPO] [nvarchar](4) NULL,
	[LFMNG] [decimal](13, 3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[LEDAT] [nvarchar](8) NULL,
	[VBLNU] [nvarchar](10) NULL,
	[VBLPU] [nvarchar](6) NULL,
	[BEDAT] [nvarchar](8) NULL,
	[BSTMG] [decimal](13, 3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[EBLNU] [nvarchar](10) NULL,
	[EBLPU] [nvarchar](5) NULL,
	[UMDAT] [nvarchar](8) NULL,
	[UMLMG] [decimal](13, 3) NULL,
	[UMLME] [nvarchar](3) NULL,
	[UBSTN] [nvarchar](10) NULL,
	[UBSTP] [nvarchar](5) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[IMNGL] [decimal](13, 3) NULL,
	[WMNGE] [decimal](13, 3) NULL,
	[VBELN_GKA] [nvarchar](10) NULL,
	[VBELP_GKA] [nvarchar](6) NULL,
	[WRF_AT_DL_ID] [nvarchar](22) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUPO]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUPO](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[APSTP] [nvarchar](4) NOT NULL,
	[ASTAP] [nvarchar](1) NOT NULL,
	[PSTAP] [nvarchar](1) NOT NULL,
	[SPERR] [nvarchar](1) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[RFKTN] [nvarchar](10) NOT NULL,
	[RFKTP] [nvarchar](5) NOT NULL,
	[RSNUM] [nvarchar](10) NOT NULL,
	[RSPOS] [nvarchar](4) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[AKTNR] [nvarchar](10) NOT NULL,
	[AKTPO] [nvarchar](2) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[MAKTX] [nvarchar](40) NOT NULL,
	[BWART] [nvarchar](10) NOT NULL,
	[VZWRK] [nvarchar](4) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[SBELN] [nvarchar](10) NOT NULL,
	[FIKLI] [nvarchar](10) NOT NULL,
	[FILKL] [nvarchar](18) NOT NULL,
	[PMNGE] [decimal](13, 3) NOT NULL,
	[IMNGE] [decimal](13, 3) NOT NULL,
	[MMNGE] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[UZAEH] [decimal](5, 0) NOT NULL,
	[UNENN] [decimal](5, 0) NOT NULL,
	[LISTG] [nvarchar](1) NOT NULL,
	[MANUE] [nvarchar](1) NOT NULL,
	[RUNDG] [nvarchar](1) NOT NULL,
	[RESTV] [nvarchar](1) NOT NULL,
	[ASTRA] [nvarchar](4) NOT NULL,
	[LIEFW] [nvarchar](1) NOT NULL,
	[VKSDT] [nvarchar](8) NOT NULL,
	[VKSTP] [nvarchar](1) NOT NULL,
	[AAVIT] [nvarchar](4) NULL,
	[MATKL] [nvarchar](9) NULL,
	[VZENT] [nvarchar](10) NULL,
	[VZLFR] [nvarchar](10) NULL,
	[BSART] [nvarchar](4) NULL,
	[UMART] [nvarchar](4) NULL,
	[BSART_GL_BUKRS] [nvarchar](4) NULL,
	[LFART] [nvarchar](4) NULL,
	[ABFDT] [nvarchar](8) NULL,
	[ABFTP] [nvarchar](1) NULL,
	[SVFIX] [nvarchar](1) NULL,
	[SIMAM] [nvarchar](1) NULL,
	[LGORT] [nvarchar](4) NULL,
	[HMNGE] [decimal](13, 3) NULL,
	[KETYP] [nvarchar](1) NULL,
	[VBELN] [nvarchar](10) NULL,
	[VBELP] [nvarchar](6) NULL,
	[SAPOS] [nvarchar](5) NULL,
	[ATTYP] [nvarchar](2) NULL,
	[RETPO] [nvarchar](1) NULL,
	[BERMIMA] [nvarchar](1) NULL,
	[KAART] [nvarchar](4) NULL,
	[NREMFIN] [nvarchar](4) NULL,
	[EXT_REF_ID] [nvarchar](25) NULL,
	[ASTRA_VAR] [nvarchar](14) NULL,
	[ERVON] [nvarchar](1) NULL,
	[WRF_HIER_CNT] [nvarchar](2) NULL,
	[WRF_CDT_LEVEL] [nvarchar](2) NULL,
	[WRF_STRUC_NODE] [nvarchar](18) NULL,
	[PLID] [nvarchar](10) NULL,
	[CONS_MODE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUVW]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUVW](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[VZWRK] [nvarchar](4) NOT NULL,
	[LFNUM] [nvarchar](3) NOT NULL,
	[WEVDT] [nvarchar](8) NOT NULL,
	[WEVTP] [nvarchar](1) NOT NULL,
	[WEUZT] [nvarchar](6) NOT NULL,
	[WEPRZ] [nvarchar](3) NOT NULL,
	[MENGE] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NOT NULL,
	[WEMNG] [decimal](13, 3) NULL,
	[MBLNR] [nvarchar](10) NULL,
	[MBLPO] [nvarchar](4) NULL,
	[LFMNG] [decimal](13, 3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[BEDAT] [nvarchar](8) NULL,
	[BSTMG] [decimal](13, 3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[EBLNU] [nvarchar](10) NULL,
	[EBLPU] [nvarchar](5) NULL,
	[UMLMG] [decimal](13, 3) NULL,
	[UMLME] [nvarchar](3) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[IMNGL] [decimal](13, 3) NULL,
	[WRF_AT_DL_ID] [nvarchar](22) NULL,
	[SUBMI] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_AUVZ]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_AUVZ](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABELN] [nvarchar](10) NOT NULL,
	[ABELP] [nvarchar](5) NOT NULL,
	[VZWRK] [nvarchar](4) NOT NULL,
	[VZENT] [nvarchar](10) NOT NULL,
	[VZLFR] [nvarchar](10) NULL,
	[PMNGV] [decimal](13, 3) NOT NULL,
	[IMNGV] [decimal](13, 3) NOT NULL,
	[MENGE_OPT] [decimal](13, 3) NOT NULL,
	[AUFME] [nvarchar](3) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[VKORG] [nvarchar](4) NULL,
	[VTWEG] [nvarchar](2) NULL,
	[SPART] [nvarchar](2) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[BSTMG] [decimal](13, 3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[UMLMG] [decimal](13, 3) NULL,
	[UMLME] [nvarchar](3) NULL,
	[LFMNG] [decimal](13, 3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[EBLNU] [nvarchar](10) NULL,
	[EBLPU] [nvarchar](5) NULL,
	[ABFST] [nvarchar](1) NULL,
	[ABAST] [nvarchar](1) NULL,
	[BSTST] [nvarchar](1) NULL,
	[UMLST] [nvarchar](1) NULL,
	[LIEST] [nvarchar](1) NULL,
	[ABVST] [nvarchar](1) NULL,
	[WEEST] [nvarchar](1) NULL,
	[KAGST] [nvarchar](1) NULL,
	[SPERR] [nvarchar](1) NULL,
	[BMERF] [nvarchar](1) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[LAND1] [nvarchar](3) NULL,
	[WAFLU_VZ] [nvarchar](1) NULL,
	[LGORT] [nvarchar](4) NULL,
	[SLS_REL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CBPR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CBPR](
	[MANDT] [nvarchar](3) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[PRZNR] [nvarchar](12) NOT NULL,
	[DATBI] [nvarchar](8) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[ERFDT] [nvarchar](8) NULL,
	[ERFNM] [nvarchar](12) NULL,
	[AENDT] [nvarchar](8) NULL,
	[AENNM] [nvarchar](12) NULL,
	[PRART] [nvarchar](4) NULL,
	[PRTYP] [nvarchar](2) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[OWAER] [nvarchar](5) NULL,
	[VERAP] [nvarchar](20) NULL,
	[VERAP_USER] [nvarchar](12) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[GSBER] [nvarchar](4) NULL,
	[WERKS] [nvarchar](4) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[VKORG] [nvarchar](4) NULL,
	[VTWEG] [nvarchar](2) NULL,
	[SPART] [nvarchar](2) NULL,
	[PHINR] [nvarchar](12) NULL,
	[ATTRI] [nvarchar](4) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[KHINR] [nvarchar](15) NULL,
	[ATTR1] [nvarchar](24) NULL,
	[ATTR2] [nvarchar](24) NULL,
	[BP_STAT] [nvarchar](1) NULL,
	[TEMPLCLASS] [nvarchar](3) NULL,
	[TEMPLATE] [nvarchar](10) NULL,
	[TEMPL_BPP] [nvarchar](10) NULL,
	[KALSM] [nvarchar](6) NULL,
	[PD_TASK_TP] [nvarchar](2) NULL,
	[PD_TASK_ID] [nvarchar](8) NULL,
	[CBRKE] [nvarchar](2) NULL,
	[CBRKI] [nvarchar](2) NULL,
	[CBART] [nvarchar](2) NULL,
	[DRVTP] [nvarchar](3) NULL,
	[CBAT] [nvarchar](10) NULL,
	[WFD_ID] [nvarchar](10) NULL,
	[VERSION] [nvarchar](4) NULL,
	[EXETYP] [nvarchar](1) NULL,
	[LOGSYSTEM] [nvarchar](10) NULL,
	[LEINH] [nvarchar](3) NULL,
	[AUSEH] [nvarchar](3) NULL,
	[AUSFK] [decimal](5, 2) NULL,
	[VKSTA] [nvarchar](10) NULL,
	[TARKZ] [nvarchar](3) NULL,
	[TARKZ_I] [nvarchar](3) NULL,
	[YRATE] [nvarchar](1) NULL,
	[LATYP] [nvarchar](1) NULL,
	[LATYPI] [nvarchar](1) NULL,
	[MANIST] [nvarchar](1) NULL,
	[MANPLAN] [nvarchar](1) NULL,
	[FIXVO] [nvarchar](1) NULL,
	[FERC_IND] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CEPC]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CEPC](
	[MANDT] [nvarchar](3) NOT NULL,
	[PRCTR] [nvarchar](10) NOT NULL,
	[DATBI] [nvarchar](8) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[ERSDA] [nvarchar](8) NULL,
	[USNAM] [nvarchar](12) NULL,
	[MERKMAL] [nvarchar](30) NULL,
	[ABTEI] [nvarchar](12) NULL,
	[VERAK] [nvarchar](20) NULL,
	[VERAK_USER] [nvarchar](12) NULL,
	[WAERS] [nvarchar](5) NULL,
	[NPRCTR] [nvarchar](10) NULL,
	[LAND1] [nvarchar](3) NULL,
	[ANRED] [nvarchar](15) NULL,
	[NAME1] [nvarchar](35) NULL,
	[NAME2] [nvarchar](35) NULL,
	[NAME3] [nvarchar](35) NULL,
	[NAME4] [nvarchar](35) NULL,
	[ORT01] [nvarchar](35) NULL,
	[ORT02] [nvarchar](35) NULL,
	[STRAS] [nvarchar](35) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[PSTL2] [nvarchar](10) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TELBX] [nvarchar](15) NULL,
	[TELF1] [nvarchar](16) NULL,
	[TELF2] [nvarchar](16) NULL,
	[TELFX] [nvarchar](31) NULL,
	[TELTX] [nvarchar](30) NULL,
	[TELX1] [nvarchar](30) NULL,
	[DATLT] [nvarchar](14) NULL,
	[DRNAM] [nvarchar](4) NULL,
	[KHINR] [nvarchar](12) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[VNAME] [nvarchar](6) NULL,
	[RECID] [nvarchar](2) NULL,
	[ETYPE] [nvarchar](3) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[REGIO] [nvarchar](3) NULL,
	[KVEWE] [nvarchar](1) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[LOGSYSTEM] [nvarchar](10) NOT NULL,
	[LOCK_IND] [nvarchar](1) NOT NULL,
	[PCA_TEMPLATE] [nvarchar](10) NULL,
	[SEGMENT] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CKPH]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CKPH](
	[MANDT] [nvarchar](3) NOT NULL,
	[KSTRG] [nvarchar](12) NOT NULL,
	[DATBI] [nvarchar](8) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[WERKS] [nvarchar](4) NULL,
	[GSBER] [nvarchar](4) NULL,
	[FUNC_AREA] [nvarchar](16) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[UEKTR] [nvarchar](12) NULL,
	[KTRTY] [nvarchar](2) NULL,
	[VAKTR] [nvarchar](20) NULL,
	[LTEXT] [nvarchar](1) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[KSTAT] [nvarchar](2) NULL,
	[STDAT] [nvarchar](8) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[OBJWR] [nvarchar](5) NULL,
	[KVEWE] [nvarchar](1) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[ZSCHL] [nvarchar](6) NULL,
	[AWOBA] [nvarchar](2) NULL,
	[AWSLS] [nvarchar](6) NULL,
	[FCPMG] [nvarchar](4) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[SAPRL] [nvarchar](4) NULL,
	[KTRAT] [nvarchar](4) NULL,
	[KALNR] [nvarchar](12) NULL,
	[KLVAR] [nvarchar](4) NULL,
	[LOEKENNZ] [nvarchar](1) NULL,
	[KTRZB] [nvarchar](1) NULL,
	[FERC_IND] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CPABPRF]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CPABPRF](
	[MANDT] [nvarchar](3) NOT NULL,
	[PABPRF] [nvarchar](4) NOT NULL,
	[PABART] [nvarchar](2) NULL,
	[PABPAR] [nvarchar](2) NULL,
	[PABZUS] [nvarchar](1) NULL,
	[PABZTD] [nvarchar](10) NULL,
	[PABMSD] [nvarchar](1) NULL,
	[INJIT] [nvarchar](1) NULL,
	[PABCONF] [nvarchar](1) NULL,
	[CNTRL] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CSKS]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CSKS](
	[MANDT] [nvarchar](3) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[KOSTL] [nvarchar](10) NOT NULL,
	[DATBI] [nvarchar](8) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[BKZKP] [nvarchar](1) NULL,
	[PKZKP] [nvarchar](1) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KOSAR] [nvarchar](1) NULL,
	[VERAK] [nvarchar](20) NULL,
	[VERAK_USER] [nvarchar](12) NULL,
	[WAERS] [nvarchar](5) NULL,
	[KALSM] [nvarchar](6) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LOGSYSTEM] [nvarchar](10) NULL,
	[ERSDA] [nvarchar](8) NULL,
	[USNAM] [nvarchar](12) NULL,
	[BKZKS] [nvarchar](1) NULL,
	[BKZER] [nvarchar](1) NULL,
	[BKZOB] [nvarchar](1) NULL,
	[PKZKS] [nvarchar](1) NULL,
	[PKZER] [nvarchar](1) NULL,
	[VMETH] [nvarchar](2) NULL,
	[MGEFL] [nvarchar](1) NULL,
	[ABTEI] [nvarchar](12) NULL,
	[NKOST] [nvarchar](10) NULL,
	[KVEWE] [nvarchar](1) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KOSZSCHL] [nvarchar](6) NULL,
	[LAND1] [nvarchar](3) NULL,
	[ANRED] [nvarchar](15) NULL,
	[NAME1] [nvarchar](35) NULL,
	[NAME2] [nvarchar](35) NULL,
	[NAME3] [nvarchar](35) NULL,
	[NAME4] [nvarchar](35) NULL,
	[ORT01] [nvarchar](35) NULL,
	[ORT02] [nvarchar](35) NULL,
	[STRAS] [nvarchar](35) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[PSTL2] [nvarchar](10) NULL,
	[REGIO] [nvarchar](3) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TELBX] [nvarchar](15) NULL,
	[TELF1] [nvarchar](16) NULL,
	[TELF2] [nvarchar](16) NULL,
	[TELFX] [nvarchar](31) NULL,
	[TELTX] [nvarchar](30) NULL,
	[TELX1] [nvarchar](30) NULL,
	[DATLT] [nvarchar](14) NULL,
	[DRNAM] [nvarchar](4) NULL,
	[KHINR] [nvarchar](12) NULL,
	[CCKEY] [nvarchar](23) NULL,
	[KOMPL] [nvarchar](1) NULL,
	[STAKZ] [nvarchar](1) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[FUNKT] [nvarchar](3) NULL,
	[AFUNK] [nvarchar](3) NULL,
	[CPI_TEMPL] [nvarchar](10) NULL,
	[CPD_TEMPL] [nvarchar](10) NULL,
	[FUNC_AREA] [nvarchar](16) NULL,
	[SCI_TEMPL] [nvarchar](10) NULL,
	[SCD_TEMPL] [nvarchar](10) NULL,
	[VNAME] [nvarchar](6) NULL,
	[RECID] [nvarchar](2) NULL,
	[ETYPE] [nvarchar](3) NULL,
	[JV_OTYPE] [nvarchar](4) NULL,
	[JV_JIBCL] [nvarchar](3) NULL,
	[JV_JIBSA] [nvarchar](5) NULL,
	[FERC_IND] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_CSLA]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_CSLA](
	[MANDT] [nvarchar](3) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[LSTAR] [nvarchar](6) NOT NULL,
	[DATBI] [nvarchar](8) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[LEINH] [nvarchar](3) NULL,
	[LATYP] [nvarchar](1) NULL,
	[LATYPI] [nvarchar](1) NULL,
	[ERSDA] [nvarchar](8) NULL,
	[USNAM] [nvarchar](12) NULL,
	[KSTTY] [nvarchar](8) NULL,
	[AUSEH] [nvarchar](3) NULL,
	[AUSFK] [decimal](5, 2) NULL,
	[VKSTA] [nvarchar](10) NULL,
	[LARK1] [nvarchar](1) NULL,
	[LARK2] [nvarchar](1) NULL,
	[SPRKZ] [nvarchar](1) NULL,
	[HRKFT] [nvarchar](4) NULL,
	[FIXVO] [nvarchar](1) NULL,
	[TARKZ] [nvarchar](3) NULL,
	[YRATE] [nvarchar](1) NULL,
	[TARKZ_I] [nvarchar](3) NULL,
	[MANIST] [nvarchar](1) NULL,
	[MANPLAN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_DBTABLOG]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_DBTABLOG](
	[LOGDATE] [nvarchar](8) NOT NULL,
	[LOGTIME] [nvarchar](6) NOT NULL,
	[LOGID] [nvarchar](18) NOT NULL,
	[TABNAME] [nvarchar](30) NOT NULL,
	[LOGKEY] [nvarchar](250) NOT NULL,
	[HOSTNAME] [nvarchar](20) NOT NULL,
	[USERNAME] [nvarchar](12) NULL,
	[TCODE] [nvarchar](20) NULL,
	[PROGNAME] [nvarchar](40) NULL,
	[OPTYPE] [nvarchar](1) NULL,
	[VERSNO] [nvarchar](2) NULL,
	[LANGUAGE] [nvarchar](1) NULL,
	[DATALN] [smallint] NULL,
	[LOGDATA] [varbinary](8000) NULL,
 CONSTRAINT [PK_SAP_DBTABLOG] PRIMARY KEY CLUSTERED 
(
	[LOGDATE] ASC,
	[LOGTIME] ASC,
	[LOGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_DBTABPRT]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_DBTABPRT](
	[TABNAME] [nvarchar](10) NOT NULL,
	[AS4DATE] [nvarchar](8) NOT NULL,
	[AS4TIME] [nvarchar](6) NOT NULL,
	[VKEY] [nvarchar](86) NOT NULL,
	[COUNTER] [int] NOT NULL,
	[HOSTNAME] [nvarchar](20) NULL,
	[AS4USER] [nvarchar](12) NULL,
	[TCODE] [nvarchar](4) NULL,
	[ABAPNAME] [nvarchar](8) NULL,
	[OPTYPE] [nvarchar](1) NULL,
	[DATALN] [smallint] NULL,
	[VDATA] [varbinary](500) NULL,
 CONSTRAINT [PK_SAP_DBTABPRT] PRIMARY KEY CLUSTERED 
(
	[TABNAME] ASC,
	[AS4DATE] ASC,
	[AS4TIME] ASC,
	[VKEY] ASC,
	[COUNTER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_DD03VT]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_DD03VT](
	[TABNAME] [nvarchar](30) NULL,
	[FIELDNAME] [nvarchar](30) NULL,
	[AS4LOCAL] [nvarchar](1) NULL,
	[TABCLASS] [nvarchar](8) NULL,
	[SQLTAB] [nvarchar](30) NULL,
	[POSITION] [nvarchar](4) NULL,
	[KEYFLAG] [nvarchar](1) NULL,
	[MANDATORY] [nvarchar](1) NULL,
	[ROLLNAME] [nvarchar](30) NULL,
	[DOMNAME] [nvarchar](30) NULL,
	[CHECKTABLE] [nvarchar](30) NULL,
	[ADMINFIELD] [nvarchar](1) NULL,
	[INTTYPE] [nvarchar](1) NULL,
	[INTLEN] [nvarchar](6) NULL,
	[REFTABLE] [nvarchar](30) NULL,
	[PRECFIELD] [nvarchar](30) NULL,
	[REFFIELD] [nvarchar](30) NULL,
	[CONROUT] [nvarchar](10) NULL,
	[NOTNULL] [nvarchar](1) NULL,
	[LENG] [nvarchar](6) NULL,
	[DATATYPE] [nvarchar](4) NULL,
	[COMPTYPE] [nvarchar](1) NULL,
	[TABLETYPE] [nvarchar](1) NULL,
	[DEPTH] [nvarchar](2) NULL,
	[AS4USER] [nvarchar](12) NULL,
	[AS4DATE] [nvarchar](8) NULL,
	[MASTERLANG] [nvarchar](1) NULL,
	[DDLANGUAGE] [nvarchar](1) NULL,
	[DDTEXT] [nvarchar](60) NULL,
	[REPTEXT] [nvarchar](55) NULL,
	[SCRTEXT_S] [nvarchar](10) NULL,
	[SCRTEXT_M] [nvarchar](20) NULL,
	[SCRTEXT_L] [nvarchar](40) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EBAN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EBAN](
	[MANDT] [nvarchar](3) NOT NULL,
	[BANFN] [nvarchar](10) NOT NULL,
	[BNFPO] [nvarchar](5) NOT NULL,
	[BSART] [nvarchar](4) NULL,
	[BSTYP] [nvarchar](1) NULL,
	[BSAKZ] [nvarchar](1) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[STATU] [nvarchar](1) NULL,
	[ESTKZ] [nvarchar](1) NULL,
	[FRGKZ] [nvarchar](1) NULL,
	[FRGZU] [nvarchar](8) NULL,
	[FRGST] [nvarchar](2) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[AFNAM] [nvarchar](12) NULL,
	[TXZ01] [nvarchar](40) NULL,
	[MATNR] [nvarchar](18) NULL,
	[EMATN] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[BEDNR] [nvarchar](10) NULL,
	[MATKL] [nvarchar](9) NULL,
	[RESWK] [nvarchar](4) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[BUMNG] [decimal](13, 3) NULL,
	[BADAT] [nvarchar](8) NULL,
	[LPEIN] [nvarchar](1) NULL,
	[LFDAT] [nvarchar](8) NULL,
	[FRGDT] [nvarchar](8) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[PREIS] [decimal](11, 2) NULL,
	[PEINH] [decimal](5, 0) NULL,
	[PSTYP] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[KFLAG] [nvarchar](1) NULL,
	[VRTKZ] [nvarchar](1) NULL,
	[TWRKZ] [nvarchar](1) NULL,
	[WEPOS] [nvarchar](1) NULL,
	[WEUNB] [nvarchar](1) NULL,
	[REPOS] [nvarchar](1) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[FLIEF] [nvarchar](10) NULL,
	[EKORG] [nvarchar](4) NULL,
	[VRTYP] [nvarchar](1) NULL,
	[KONNR] [nvarchar](10) NULL,
	[KTPNR] [nvarchar](5) NULL,
	[INFNR] [nvarchar](10) NULL,
	[ZUGBA] [nvarchar](1) NULL,
	[QUNUM] [nvarchar](10) NULL,
	[QUPOS] [nvarchar](3) NULL,
	[DISPO] [nvarchar](3) NULL,
	[SERNR] [nvarchar](8) NULL,
	[BVDAT] [nvarchar](8) NULL,
	[BATOL] [decimal](3, 0) NULL,
	[BVDRK] [decimal](7, 0) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[BEDAT] [nvarchar](8) NULL,
	[BSMNG] [decimal](13, 3) NULL,
	[LBLNI] [nvarchar](10) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[XOBLR] [nvarchar](1) NULL,
	[EBAKZ] [nvarchar](1) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[ARSNR] [nvarchar](10) NULL,
	[ARSPS] [nvarchar](4) NULL,
	[FIXKZ] [nvarchar](1) NULL,
	[BMEIN] [nvarchar](3) NULL,
	[REVLV] [nvarchar](2) NULL,
	[VORAB] [nvarchar](1) NULL,
	[PACKNO] [nvarchar](10) NULL,
	[KANBA] [nvarchar](1) NULL,
	[BPUEB] [nvarchar](1) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[FRGGR] [nvarchar](2) NULL,
	[FRGRL] [nvarchar](1) NULL,
	[AKTNR] [nvarchar](10) NULL,
	[CHARG] [nvarchar](10) NULL,
	[UMSOK] [nvarchar](1) NULL,
	[VERID] [nvarchar](4) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[FISTL] [nvarchar](16) NULL,
	[GEBER] [nvarchar](10) NULL,
	[KZKFG] [nvarchar](1) NULL,
	[SATNR] [nvarchar](18) NULL,
	[MNG02] [decimal](13, 3) NULL,
	[DAT01] [nvarchar](8) NULL,
	[ATTYP] [nvarchar](2) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[ADRN2] [nvarchar](10) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[EMLIF] [nvarchar](10) NULL,
	[LBLKZ] [nvarchar](1) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[WAERS] [nvarchar](5) NULL,
	[IDNLF] [nvarchar](35) NULL,
	[GSFRG] [nvarchar](1) NULL,
	[MPROF] [nvarchar](4) NULL,
	[KZFME] [nvarchar](1) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TECHS] [nvarchar](12) NULL,
	[MFRPN] [nvarchar](40) NULL,
	[MFRNR] [nvarchar](10) NULL,
	[EMNFR] [nvarchar](10) NULL,
	[FORDN] [nvarchar](10) NULL,
	[FORDP] [nvarchar](5) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[BERID] [nvarchar](10) NULL,
	[UZEIT] [nvarchar](6) NULL,
	[FKBER] [nvarchar](16) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[MEMORY] [nvarchar](1) NULL,
	[BANPR] [nvarchar](2) NULL,
	[RLWRT] [decimal](15, 2) NULL,
	[BLCKD] [nvarchar](1) NULL,
	[REVNO] [nvarchar](8) NULL,
	[BLCKT] [nvarchar](60) NULL,
	[BESWK] [nvarchar](4) NULL,
	[EPROFILE] [nvarchar](2) NULL,
	[EPREFDOC] [nvarchar](10) NULL,
	[EPREFITM] [nvarchar](5) NULL,
	[GMMNG] [decimal](13, 3) NULL,
	[WRTKZ] [nvarchar](1) NULL,
	[RESLO] [nvarchar](4) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[PRIO_URG] [nvarchar](2) NULL,
	[PRIO_REQ] [nvarchar](3) NULL,
	[MEMORYTYPE] [nvarchar](1) NULL,
	[ANZSN] [int] NULL,
	[MHDRZ] [decimal](4, 0) NULL,
	[IPRKZ] [nvarchar](1) NULL,
	[NODISP] [nvarchar](1) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[ADVCODE] [nvarchar](2) NULL,
	[STACODE] [nvarchar](2) NULL,
	[BANFN_CS] [nvarchar](10) NULL,
	[BNFPO_CS] [nvarchar](5) NULL,
	[ITEM_CS] [nvarchar](1) NULL,
	[BSMNG_SND] [decimal](13, 3) NULL,
	[NO_MARD_DATA] [nvarchar](1) NULL,
	[SERRU] [nvarchar](1) NULL,
	[DISUB_SOBKZ] [nvarchar](1) NULL,
	[DISUB_PSPNR] [nvarchar](8) NULL,
	[DISUB_KUNNR] [nvarchar](10) NULL,
	[DISUB_VBELN] [nvarchar](10) NULL,
	[DISUB_POSNR] [nvarchar](6) NULL,
	[DISUB_OWNER] [nvarchar](10) NULL,
	[IUID_RELEVANT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EBKN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EBKN](
	[MANDT] [nvarchar](3) NOT NULL,
	[BANFN] [nvarchar](10) NOT NULL,
	[BNFPO] [nvarchar](5) NOT NULL,
	[ZEBKN] [nvarchar](2) NOT NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[VPROZ] [decimal](3, 1) NULL,
	[SAKTO] [nvarchar](10) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[PROJN] [nvarchar](16) NULL,
	[VBELN] [nvarchar](10) NULL,
	[VBELP] [nvarchar](6) NULL,
	[VETEN] [nvarchar](4) NULL,
	[ANLN1] [nvarchar](12) NULL,
	[ANLN2] [nvarchar](4) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[WEMPF] [nvarchar](12) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[XBKST] [nvarchar](1) NULL,
	[XBAUF] [nvarchar](1) NULL,
	[XBPRO] [nvarchar](1) NULL,
	[KSTRG] [nvarchar](12) NULL,
	[PAOBJNR] [nvarchar](10) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[NPLNR] [nvarchar](12) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[IMKEY] [nvarchar](8) NULL,
	[APLZL] [nvarchar](8) NULL,
	[VPTNR] [nvarchar](10) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[RECID] [nvarchar](2) NULL,
	[ZZSPREG] [nvarchar](5) NULL,
	[ZZBUSPARTN] [nvarchar](10) NULL,
	[ZZPRODUCT] [nvarchar](10) NULL,
	[ZZLOCA] [nvarchar](4) NULL,
	[ZZCHAN] [nvarchar](4) NULL,
	[ZZLOB] [nvarchar](7) NULL,
	[ZZNFAL] [nvarchar](10) NULL,
	[ZZUSERFLD1] [nvarchar](9) NULL,
	[ZZUSERFLD2] [nvarchar](12) NULL,
	[ZZUSERFLD3] [nvarchar](22) NULL,
	[ZZREGION] [nvarchar](3) NULL,
	[ZZSTATE] [nvarchar](3) NULL,
	[FISTL] [nvarchar](16) NULL,
	[GEBER] [nvarchar](10) NULL,
	[FKBER] [nvarchar](16) NULL,
	[DABRZ] [nvarchar](8) NULL,
	[NETWR] [decimal](13, 2) NULL,
	[AUFPL_ORD] [nvarchar](10) NULL,
	[APLZL_ORD] [nvarchar](8) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[LSTAR] [nvarchar](6) NULL,
	[PRZNR] [nvarchar](12) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[FM_SPLIT_BATCH] [nvarchar](3) NULL,
	[FM_SPLIT_BEGRU] [nvarchar](4) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[EGRUP] [nvarchar](3) NULL,
	[VNAME] [nvarchar](6) NULL,
	[TCOBJNR] [nvarchar](22) NULL,
	[DATEOFSERVICE] [nvarchar](8) NULL,
	[NOTAXCORR] [nvarchar](1) NULL,
	[DIFFOPTRATE] [decimal](9, 6) NULL,
	[HASDIFFOPTRATE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EIKP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EIKP](
	[MANDT] [nvarchar](3) NOT NULL,
	[EXNUM] [nvarchar](10) NOT NULL,
	[ALAND] [nvarchar](3) NULL,
	[EXPVZ] [nvarchar](1) NULL,
	[ZOLLA] [nvarchar](6) NULL,
	[ZOLLB] [nvarchar](6) NULL,
	[ZOLL1] [nvarchar](6) NULL,
	[ZOLL2] [nvarchar](6) NULL,
	[ZOLL3] [nvarchar](6) NULL,
	[ZOLL4] [nvarchar](6) NULL,
	[ZOLL5] [nvarchar](6) NULL,
	[ZOLL6] [nvarchar](6) NULL,
	[KZGBE] [nvarchar](30) NULL,
	[KZABE] [nvarchar](30) NULL,
	[STGBE] [nvarchar](3) NULL,
	[STABE] [nvarchar](3) NULL,
	[CONTA] [nvarchar](1) NULL,
	[GRWCU] [nvarchar](5) NULL,
	[IEVER] [nvarchar](1) NULL,
	[SEGAL] [nvarchar](2) NULL,
	[WZOCU] [nvarchar](5) NULL,
	[PRONU] [nvarchar](25) NULL,
	[PRODA] [nvarchar](8) NULL,
	[VORPA] [nvarchar](10) NULL,
	[VORDA] [nvarchar](8) NULL,
	[VORNU] [nvarchar](25) NULL,
	[BEHOE] [nvarchar](10) NULL,
	[KENNU] [nvarchar](6) NULL,
	[VOISO] [nvarchar](2) NULL,
	[PREFPACOD] [nvarchar](3) NULL,
	[PREFA] [nvarchar](10) NULL,
	[PREFN] [nvarchar](25) NULL,
	[PREDU] [nvarchar](8) NULL,
	[PRISO] [nvarchar](2) NULL,
	[PRHOE] [nvarchar](10) NULL,
	[PRUEL] [nvarchar](8) NULL,
	[NACAR] [nvarchar](10) NULL,
	[NACNU] [nvarchar](25) NULL,
	[NACDA] [nvarchar](8) NULL,
	[NAISO] [nvarchar](2) NULL,
	[NAHOE] [nvarchar](10) NULL,
	[NAUEL] [nvarchar](8) NULL,
	[TEXT1] [nvarchar](40) NULL,
	[TEXT2] [nvarchar](40) NULL,
	[TEXT3] [nvarchar](40) NULL,
	[EXDAR] [nvarchar](10) NULL,
	[EXDAA] [nvarchar](25) NULL,
	[EXDAB] [nvarchar](25) NULL,
	[EXDTA] [nvarchar](10) NULL,
	[EXDT2] [nvarchar](25) NULL,
	[EXDTB] [nvarchar](25) NULL,
	[EXDPA] [nvarchar](10) NULL,
	[EXPRE] [nvarchar](25) NULL,
	[EXDT5] [nvarchar](25) NULL,
	[LADEL] [nvarchar](40) NULL,
	[AUSFU] [nvarchar](10) NULL,
	[EIOKW] [nvarchar](1) NULL,
	[AUSOK] [nvarchar](1) NULL,
	[LAZL1] [nvarchar](3) NULL,
	[LAZL2] [nvarchar](3) NULL,
	[LAZL3] [nvarchar](3) NULL,
	[LAZL4] [nvarchar](3) NULL,
	[LAZL5] [nvarchar](3) NULL,
	[LAZL6] [nvarchar](3) NULL,
	[AZOLL] [nvarchar](6) NULL,
	[AHBAS] [nvarchar](3) NULL,
	[REFNR] [nvarchar](10) NULL,
	[MABSD] [nvarchar](8) NULL,
	[BFMAR] [nvarchar](6) NULL,
	[CUDCL] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EINA]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EINA](
	[MANDT] [nvarchar](3) NOT NULL,
	[INFNR] [nvarchar](10) NOT NULL,
	[MATNR] [nvarchar](18) NULL,
	[MATKL] [nvarchar](9) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[TXZ01] [nvarchar](40) NULL,
	[SORTL] [nvarchar](10) NULL,
	[MEINS] [nvarchar](3) NULL,
	[UMREZ] [decimal](5, 0) NULL,
	[UMREN] [decimal](5, 0) NULL,
	[IDNLF] [nvarchar](35) NULL,
	[VERKF] [nvarchar](30) NULL,
	[TELF1] [nvarchar](16) NULL,
	[MAHN1] [decimal](3, 0) NULL,
	[MAHN2] [decimal](3, 0) NULL,
	[MAHN3] [decimal](3, 0) NULL,
	[URZNR] [nvarchar](10) NULL,
	[URZDT] [nvarchar](8) NULL,
	[URZLA] [nvarchar](3) NULL,
	[URZTP] [nvarchar](1) NULL,
	[URZZT] [nvarchar](16) NULL,
	[LMEIN] [nvarchar](3) NULL,
	[REGIO] [nvarchar](3) NULL,
	[VABME] [nvarchar](1) NULL,
	[LTSNR] [nvarchar](6) NULL,
	[LTSSF] [nvarchar](5) NULL,
	[WGLIF] [nvarchar](18) NULL,
	[RUECK] [nvarchar](2) NULL,
	[LIFAB] [nvarchar](8) NULL,
	[LIFBI] [nvarchar](8) NULL,
	[KOLIF] [nvarchar](10) NULL,
	[ANZPU] [decimal](13, 3) NULL,
	[PUNEI] [nvarchar](3) NULL,
	[RELIF] [nvarchar](1) NULL,
	[MFRNR] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKBE]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKBE](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ZEKKN] [nvarchar](2) NOT NULL,
	[VGABE] [nvarchar](1) NOT NULL,
	[GJAHR] [nvarchar](4) NOT NULL,
	[BELNR] [nvarchar](10) NOT NULL,
	[BUZEI] [nvarchar](4) NOT NULL,
	[BEWTP] [nvarchar](1) NULL,
	[BWART] [nvarchar](3) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[BPMNG] [decimal](13, 3) NULL,
	[DMBTR] [decimal](13, 2) NULL,
	[WRBTR] [decimal](13, 2) NULL,
	[WAERS] [nvarchar](5) NULL,
	[AREWR] [decimal](13, 2) NULL,
	[WESBS] [decimal](13, 3) NULL,
	[BPWES] [decimal](13, 3) NULL,
	[SHKZG] [nvarchar](1) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[XBLNR] [nvarchar](16) NULL,
	[LFGJA] [nvarchar](4) NULL,
	[LFBNR] [nvarchar](10) NULL,
	[LFPOS] [nvarchar](4) NULL,
	[GRUND] [nvarchar](4) NULL,
	[CPUDT] [nvarchar](8) NULL,
	[CPUTM] [nvarchar](6) NULL,
	[REEWR] [decimal](13, 2) NULL,
	[EVERE] [nvarchar](2) NULL,
	[REFWR] [decimal](13, 2) NULL,
	[MATNR] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[XWSBR] [nvarchar](1) NULL,
	[ETENS] [nvarchar](4) NULL,
	[KNUMV] [nvarchar](10) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[LSMNG] [decimal](13, 3) NULL,
	[LSMEH] [nvarchar](3) NULL,
	[EMATN] [nvarchar](18) NULL,
	[AREWW] [decimal](13, 2) NULL,
	[HSWAE] [nvarchar](5) NULL,
	[BAMNG] [decimal](13, 3) NULL,
	[CHARG] [nvarchar](10) NULL,
	[BLDAT] [nvarchar](8) NULL,
	[XWOFF] [nvarchar](1) NULL,
	[XUNPL] [nvarchar](1) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[SRVPOS] [nvarchar](18) NULL,
	[PACKNO] [nvarchar](10) NULL,
	[INTROW] [nvarchar](10) NULL,
	[BEKKN] [nvarchar](2) NULL,
	[LEMIN] [nvarchar](1) NULL,
	[AREWB] [decimal](13, 2) NULL,
	[REWRB] [decimal](13, 2) NULL,
	[SAPRL] [nvarchar](4) NULL,
	[MENGE_POP] [decimal](13, 3) NULL,
	[BPMNG_POP] [decimal](13, 3) NULL,
	[DMBTR_POP] [decimal](13, 2) NULL,
	[WRBTR_POP] [decimal](13, 2) NULL,
	[WESBB] [decimal](13, 3) NULL,
	[BPWEB] [decimal](13, 3) NULL,
	[WEORA] [nvarchar](1) NULL,
	[AREWR_POP] [decimal](13, 2) NULL,
	[KUDIF] [decimal](13, 2) NULL,
	[RETAMT_FC] [decimal](13, 2) NULL,
	[RETAMT_LC] [decimal](13, 2) NULL,
	[RETAMTP_FC] [decimal](13, 2) NULL,
	[RETAMTP_LC] [decimal](13, 2) NULL,
	[XMACC] [nvarchar](1) NULL,
	[WKURS] [decimal](9, 5) NULL,
	[VBELN_ST] [nvarchar](10) NULL,
	[VBELP_ST] [nvarchar](6) NULL,
	[ET_UPD] [nvarchar](1) NULL,
	[J_SC_DIE_COMP_F] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKEK]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKEK](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ABART] [nvarchar](1) NOT NULL,
	[ABRUF] [nvarchar](10) NOT NULL,
	[ABEFZ] [decimal](13, 3) NULL,
	[ABRDT] [nvarchar](8) NULL,
	[LFDKD] [nvarchar](8) NULL,
	[LFNKD] [nvarchar](16) NULL,
	[LWEDT] [nvarchar](8) NULL,
	[LWEMG] [decimal](13, 3) NULL,
	[ABLLI] [nvarchar](20) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ABSFZ] [decimal](13, 3) NULL,
	[ABFDE] [nvarchar](8) NULL,
	[ABMDE] [nvarchar](8) NULL,
	[ERUHR] [nvarchar](6) NULL,
	[ABRZT] [nvarchar](6) NULL,
	[ABHZT] [nvarchar](8) NULL,
	[RUSKZ] [nvarchar](1) NULL,
	[STAAB] [nvarchar](1) NULL,
	[WEBRL] [nvarchar](1) NULL,
	[VENCF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKES]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKES](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ETENS] [nvarchar](4) NOT NULL,
	[EBTYP] [nvarchar](2) NULL,
	[EINDT] [nvarchar](8) NULL,
	[LPEIN] [nvarchar](1) NULL,
	[UZEIT] [nvarchar](6) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[EZEIT] [nvarchar](6) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[DABMG] [decimal](13, 3) NULL,
	[ESTKZ] [nvarchar](1) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[KZDIS] [nvarchar](1) NULL,
	[XBLNR] [nvarchar](35) NULL,
	[VBELN] [nvarchar](10) NULL,
	[VBELP] [nvarchar](6) NULL,
	[MPROF] [nvarchar](4) NULL,
	[EMATN] [nvarchar](18) NULL,
	[MAHNZ] [decimal](3, 0) NULL,
	[CHARG] [nvarchar](10) NULL,
	[UECHA] [nvarchar](6) NULL,
	[REF_ETENS] [nvarchar](4) NULL,
	[IMWRK] [nvarchar](1) NULL,
	[VBELN_ST] [nvarchar](10) NULL,
	[VBELP_ST] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKET]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKET](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ETENR] [nvarchar](4) NOT NULL,
	[EINDT] [nvarchar](8) NULL,
	[SLFDT] [nvarchar](8) NULL,
	[LPEIN] [nvarchar](1) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[AMENG] [decimal](13, 3) NULL,
	[WEMNG] [decimal](13, 3) NULL,
	[WAMNG] [decimal](13, 3) NULL,
	[UZEIT] [nvarchar](6) NULL,
	[BANFN] [nvarchar](10) NULL,
	[BNFPO] [nvarchar](5) NULL,
	[ESTKZ] [nvarchar](1) NULL,
	[QUNUM] [nvarchar](10) NULL,
	[QUPOS] [nvarchar](3) NULL,
	[MAHNZ] [decimal](3, 0) NULL,
	[BEDAT] [nvarchar](8) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[SERNR] [nvarchar](8) NULL,
	[FIXKZ] [nvarchar](1) NULL,
	[GLMNG] [decimal](13, 3) NULL,
	[DABMG] [decimal](13, 3) NULL,
	[CHARG] [nvarchar](10) NULL,
	[LICHA] [nvarchar](15) NULL,
	[CHKOM] [nvarchar](1) NULL,
	[VERID] [nvarchar](4) NULL,
	[ABART] [nvarchar](1) NULL,
	[MNG02] [decimal](13, 3) NULL,
	[DAT01] [nvarchar](8) NULL,
	[ALTDT] [nvarchar](8) NULL,
	[AULWE] [nvarchar](10) NULL,
	[MBDAT] [nvarchar](8) NULL,
	[MBUHR] [nvarchar](6) NULL,
	[LDDAT] [nvarchar](8) NULL,
	[LDUHR] [nvarchar](6) NULL,
	[TDDAT] [nvarchar](8) NULL,
	[TDUHR] [nvarchar](6) NULL,
	[WADAT] [nvarchar](8) NULL,
	[WAUHR] [nvarchar](6) NULL,
	[ELDAT] [nvarchar](8) NULL,
	[ELUHR] [nvarchar](6) NULL,
	[ANZSN] [int] NULL,
	[NODISP] [nvarchar](1) NULL,
	[GEO_ROUTE] [nvarchar](10) NULL,
	[ROUTE_GTS] [nvarchar](10) NULL,
	[GTS_IND] [nvarchar](2) NULL,
	[TSP] [nvarchar](10) NULL,
	[CD_LOCNO] [nvarchar](20) NULL,
	[CD_LOCTYPE] [nvarchar](4) NULL,
	[KEY_ID] [nvarchar](16) NULL,
	[OTB_VALUE] [decimal](17, 2) NULL,
	[OTB_CURR] [nvarchar](5) NULL,
	[OTB_RES_VALUE] [decimal](17, 2) NULL,
	[OTB_SPEC_VALUE] [decimal](17, 2) NULL,
	[SPR_RSN_PROFILE] [nvarchar](4) NULL,
	[BUDG_TYPE] [nvarchar](2) NULL,
	[OTB_STATUS] [nvarchar](1) NULL,
	[OTB_REASON] [nvarchar](3) NULL,
	[CHECK_TYPE] [nvarchar](1) NULL,
	[DL_ID] [nvarchar](22) NULL,
	[HANDOVER_DATE] [nvarchar](8) NULL,
	[NO_SCEM] [nvarchar](1) NULL,
	[DNG_DATE] [nvarchar](8) NULL,
	[DNG_TIME] [nvarchar](6) NULL,
	[CNCL_ANCMNT_DONE] [nvarchar](1) NULL,
	[DATESHIFT_NUMBER] [decimal](3, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKKN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKKN](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ZEKKN] [nvarchar](2) NOT NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[KFLAG] [nvarchar](1) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[VPROZ] [decimal](3, 1) NULL,
	[NETWR] [decimal](13, 2) NULL,
	[SAKTO] [nvarchar](10) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[PROJN] [nvarchar](16) NULL,
	[VBELN] [nvarchar](10) NULL,
	[VBELP] [nvarchar](6) NULL,
	[VETEN] [nvarchar](4) NULL,
	[KZBRB] [nvarchar](1) NULL,
	[ANLN1] [nvarchar](12) NULL,
	[ANLN2] [nvarchar](4) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[WEMPF] [nvarchar](12) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[XBKST] [nvarchar](1) NULL,
	[XBAUF] [nvarchar](1) NULL,
	[XBPRO] [nvarchar](1) NULL,
	[EREKZ] [nvarchar](1) NULL,
	[KSTRG] [nvarchar](12) NULL,
	[PAOBJNR] [nvarchar](10) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[NPLNR] [nvarchar](12) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[IMKEY] [nvarchar](8) NULL,
	[APLZL] [nvarchar](8) NULL,
	[VPTNR] [nvarchar](10) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[RECID] [nvarchar](2) NULL,
	[ZZSPREG] [nvarchar](5) NULL,
	[ZZBUSPARTN] [nvarchar](10) NULL,
	[ZZPRODUCT] [nvarchar](10) NULL,
	[ZZLOCA] [nvarchar](4) NULL,
	[ZZCHAN] [nvarchar](4) NULL,
	[ZZLOB] [nvarchar](7) NULL,
	[ZZNFAL] [nvarchar](10) NULL,
	[ZZUSERFLD1] [nvarchar](9) NULL,
	[ZZUSERFLD2] [nvarchar](12) NULL,
	[ZZUSERFLD3] [nvarchar](22) NULL,
	[ZZREGION] [nvarchar](3) NULL,
	[ZZSTATE] [nvarchar](3) NULL,
	[FISTL] [nvarchar](16) NULL,
	[GEBER] [nvarchar](10) NULL,
	[FKBER] [nvarchar](16) NULL,
	[DABRZ] [nvarchar](8) NULL,
	[AUFPL_ORD] [nvarchar](10) NULL,
	[APLZL_ORD] [nvarchar](8) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[NAVNW] [decimal](13, 2) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[LSTAR] [nvarchar](6) NULL,
	[PRZNR] [nvarchar](12) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[FM_SPLIT_BATCH] [nvarchar](3) NULL,
	[FM_SPLIT_BEGRU] [nvarchar](4) NULL,
	[AA_FINAL_IND] [nvarchar](1) NULL,
	[AA_FINAL_REASON] [nvarchar](2) NULL,
	[AA_FINAL_QTY] [decimal](13, 3) NULL,
	[AA_FINAL_QTY_F] [float] NULL,
	[MENGE_F] [float] NULL,
	[EGRUP] [nvarchar](3) NULL,
	[VNAME] [nvarchar](6) NULL,
	[TCOBJNR] [nvarchar](22) NULL,
	[DATEOFSERVICE] [nvarchar](8) NULL,
	[NOTAXCORR] [nvarchar](1) NULL,
	[DIFFOPTRATE] [decimal](9, 6) NULL,
	[HASDIFFOPTRATE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKKO]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKKO](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[BUKRS] [nvarchar](4) NULL,
	[BSTYP] [nvarchar](1) NULL,
	[BSART] [nvarchar](4) NULL,
	[BSAKZ] [nvarchar](1) NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[STATU] [nvarchar](1) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[PINCR] [nvarchar](5) NULL,
	[LPONR] [nvarchar](5) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[ZTERM] [nvarchar](4) NULL,
	[ZBD1T] [decimal](3, 0) NULL,
	[ZBD2T] [decimal](3, 0) NULL,
	[ZBD3T] [decimal](3, 0) NULL,
	[ZBD1P] [decimal](5, 3) NULL,
	[ZBD2P] [decimal](5, 3) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[WAERS] [nvarchar](5) NULL,
	[WKURS] [decimal](9, 5) NULL,
	[KUFIX] [nvarchar](1) NULL,
	[BEDAT] [nvarchar](8) NULL,
	[KDATB] [nvarchar](8) NULL,
	[KDATE] [nvarchar](8) NULL,
	[BWBDT] [nvarchar](8) NULL,
	[ANGDT] [nvarchar](8) NULL,
	[BNDDT] [nvarchar](8) NULL,
	[GWLDT] [nvarchar](8) NULL,
	[AUSNR] [nvarchar](10) NULL,
	[ANGNR] [nvarchar](10) NULL,
	[IHRAN] [nvarchar](8) NULL,
	[IHREZ] [nvarchar](12) NULL,
	[VERKF] [nvarchar](30) NULL,
	[TELF1] [nvarchar](16) NULL,
	[LLIEF] [nvarchar](10) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[KONNR] [nvarchar](10) NULL,
	[ABGRU] [nvarchar](2) NULL,
	[AUTLF] [nvarchar](1) NULL,
	[WEAKT] [nvarchar](1) NULL,
	[RESWK] [nvarchar](4) NULL,
	[LBLIF] [nvarchar](10) NULL,
	[INCO1] [nvarchar](3) NULL,
	[INCO2] [nvarchar](28) NULL,
	[KTWRT] [decimal](15, 2) NULL,
	[SUBMI] [nvarchar](10) NULL,
	[KNUMV] [nvarchar](10) NULL,
	[KALSM] [nvarchar](6) NULL,
	[STAFO] [nvarchar](6) NULL,
	[LIFRE] [nvarchar](10) NULL,
	[EXNUM] [nvarchar](10) NULL,
	[UNSEZ] [nvarchar](12) NULL,
	[LOGSY] [nvarchar](10) NULL,
	[UPINC] [nvarchar](5) NULL,
	[STAKO] [nvarchar](1) NULL,
	[FRGGR] [nvarchar](2) NULL,
	[FRGSX] [nvarchar](2) NULL,
	[FRGKE] [nvarchar](1) NULL,
	[FRGZU] [nvarchar](8) NULL,
	[FRGRL] [nvarchar](1) NULL,
	[LANDS] [nvarchar](3) NULL,
	[LPHIS] [nvarchar](1) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[STCEG_L] [nvarchar](3) NULL,
	[STCEG] [nvarchar](20) NULL,
	[ABSGR] [nvarchar](2) NULL,
	[ADDNR] [nvarchar](10) NULL,
	[KORNR] [nvarchar](1) NULL,
	[MEMORY] [nvarchar](1) NULL,
	[PROCSTAT] [nvarchar](2) NULL,
	[RLWRT] [decimal](15, 2) NULL,
	[REVNO] [nvarchar](8) NULL,
	[SCMPROC] [nvarchar](1) NULL,
	[REASON_CODE] [nvarchar](4) NULL,
	[MEMORYTYPE] [nvarchar](1) NULL,
	[RETTP] [nvarchar](1) NULL,
	[RETPC] [decimal](5, 2) NULL,
	[DPTYP] [nvarchar](4) NULL,
	[DPPCT] [decimal](5, 2) NULL,
	[DPAMT] [decimal](11, 2) NULL,
	[DPDAT] [nvarchar](8) NULL,
	[MSR_ID] [nvarchar](10) NULL,
	[HIERARCHY_EXISTS] [nvarchar](1) NULL,
	[THRESHOLD_EXISTS] [nvarchar](1) NULL,
	[LEGAL_CONTRACT] [nvarchar](40) NULL,
	[DESCRIPTION] [nvarchar](40) NULL,
	[RELEASE_DATE] [nvarchar](8) NULL,
	[FORCE_ID] [nvarchar](32) NULL,
	[FORCE_CNT] [nvarchar](6) NULL,
	[RELOC_ID] [nvarchar](10) NULL,
	[RELOC_SEQ_ID] [nvarchar](4) NULL,
	[SOURCE_LOGSYS] [nvarchar](10) NULL,
	[VZSKZ] [nvarchar](2) NULL,
	[POHF_TYPE] [nvarchar](1) NULL,
	[EQ_EINDT] [nvarchar](8) NULL,
	[EQ_WERKS] [nvarchar](4) NULL,
	[FIXPO] [nvarchar](1) NULL,
	[EKGRP_ALLOW] [nvarchar](1) NULL,
	[WERKS_ALLOW] [nvarchar](1) NULL,
	[CONTRACT_ALLOW] [nvarchar](1) NULL,
	[PSTYP_ALLOW] [nvarchar](1) NULL,
	[FIXPO_ALLOW] [nvarchar](1) NULL,
	[KEY_ID_ALLOW] [nvarchar](1) NULL,
	[AUREL_ALLOW] [nvarchar](1) NULL,
	[DELPER_ALLOW] [nvarchar](1) NULL,
	[EINDT_ALLOW] [nvarchar](1) NULL,
	[LTSNR_ALLOW] [nvarchar](1) NULL,
	[OTB_LEVEL] [nvarchar](1) NULL,
	[OTB_COND_TYPE] [nvarchar](4) NULL,
	[KEY_ID] [nvarchar](16) NULL,
	[OTB_VALUE] [decimal](17, 2) NULL,
	[OTB_CURR] [nvarchar](5) NULL,
	[OTB_RES_VALUE] [decimal](17, 2) NULL,
	[OTB_SPEC_VALUE] [decimal](17, 2) NULL,
	[SPR_RSN_PROFILE] [nvarchar](4) NULL,
	[BUDG_TYPE] [nvarchar](2) NULL,
	[OTB_STATUS] [nvarchar](1) NULL,
	[OTB_REASON] [nvarchar](3) NULL,
	[CHECK_TYPE] [nvarchar](1) NULL,
	[CON_OTB_REQ] [nvarchar](1) NULL,
	[CON_PREBOOK_LEV] [nvarchar](1) NULL,
	[CON_DISTR_LEV] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKPA]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKPA](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[LTSNR] [nvarchar](6) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PARVW] [nvarchar](2) NOT NULL,
	[PARZA] [nvarchar](3) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[LIFN2] [nvarchar](10) NOT NULL,
	[DEFPA] [nvarchar](1) NOT NULL,
	[HITYP] [nvarchar](1) NULL,
	[PARNR] [nvarchar](10) NULL,
	[PERNR] [nvarchar](8) NULL,
	[PRFRE] [nvarchar](1) NULL,
	[BOLRE] [nvarchar](1) NULL,
	[HISTUNR] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EKPO]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EKPO](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[STATU] [nvarchar](1) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[TXZ01] [nvarchar](40) NULL,
	[MATNR] [nvarchar](18) NULL,
	[EMATN] [nvarchar](18) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[BEDNR] [nvarchar](10) NULL,
	[MATKL] [nvarchar](9) NULL,
	[INFNR] [nvarchar](10) NULL,
	[IDNLF] [nvarchar](35) NULL,
	[KTMNG] [decimal](13, 3) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[BPRME] [nvarchar](3) NULL,
	[BPUMZ] [decimal](5, 0) NULL,
	[BPUMN] [decimal](5, 0) NULL,
	[UMREZ] [decimal](5, 0) NULL,
	[UMREN] [decimal](5, 0) NULL,
	[NETPR] [decimal](11, 2) NULL,
	[PEINH] [decimal](5, 0) NULL,
	[NETWR] [decimal](13, 2) NULL,
	[BRTWR] [decimal](13, 2) NULL,
	[AGDAT] [nvarchar](8) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[BONUS] [nvarchar](2) NULL,
	[INSMK] [nvarchar](1) NULL,
	[SPINF] [nvarchar](1) NULL,
	[PRSDR] [nvarchar](1) NULL,
	[SCHPR] [nvarchar](1) NULL,
	[MAHNZ] [decimal](3, 0) NULL,
	[MAHN1] [decimal](3, 0) NULL,
	[MAHN2] [decimal](3, 0) NULL,
	[MAHN3] [decimal](3, 0) NULL,
	[UEBTO] [decimal](3, 1) NULL,
	[UEBTK] [nvarchar](1) NULL,
	[UNTTO] [decimal](3, 1) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[BWTTY] [nvarchar](1) NULL,
	[ABSKZ] [nvarchar](1) NULL,
	[AGMEM] [nvarchar](3) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[EREKZ] [nvarchar](1) NULL,
	[PSTYP] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[VRTKZ] [nvarchar](1) NULL,
	[TWRKZ] [nvarchar](1) NULL,
	[WEPOS] [nvarchar](1) NULL,
	[WEUNB] [nvarchar](1) NULL,
	[REPOS] [nvarchar](1) NULL,
	[WEBRE] [nvarchar](1) NULL,
	[KZABS] [nvarchar](1) NULL,
	[LABNR] [nvarchar](20) NULL,
	[KONNR] [nvarchar](10) NULL,
	[KTPNR] [nvarchar](5) NULL,
	[ABDAT] [nvarchar](8) NULL,
	[ABFTZ] [decimal](13, 3) NULL,
	[ETFZ1] [decimal](3, 0) NULL,
	[ETFZ2] [decimal](3, 0) NULL,
	[KZSTU] [nvarchar](1) NULL,
	[NOTKZ] [nvarchar](1) NULL,
	[LMEIN] [nvarchar](3) NULL,
	[EVERS] [nvarchar](2) NULL,
	[ZWERT] [decimal](13, 2) NULL,
	[NAVNW] [decimal](13, 2) NULL,
	[ABMNG] [decimal](13, 3) NULL,
	[PRDAT] [nvarchar](8) NULL,
	[BSTYP] [nvarchar](1) NULL,
	[EFFWR] [decimal](13, 2) NULL,
	[XOBLR] [nvarchar](1) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[EKKOL] [nvarchar](4) NULL,
	[SKTOF] [nvarchar](1) NULL,
	[STAFO] [nvarchar](6) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[NTGEW] [decimal](13, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[ETDRK] [nvarchar](1) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[ARSNR] [nvarchar](10) NULL,
	[ARSPS] [nvarchar](4) NULL,
	[INSNC] [nvarchar](1) NULL,
	[SSQSS] [nvarchar](8) NULL,
	[ZGTYP] [nvarchar](4) NULL,
	[EAN11] [nvarchar](18) NULL,
	[BSTAE] [nvarchar](4) NULL,
	[REVLV] [nvarchar](2) NULL,
	[GEBER] [nvarchar](10) NULL,
	[FISTL] [nvarchar](16) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[KO_GSBER] [nvarchar](4) NULL,
	[KO_PARGB] [nvarchar](4) NULL,
	[KO_PRCTR] [nvarchar](10) NULL,
	[KO_PPRCTR] [nvarchar](10) NULL,
	[MEPRF] [nvarchar](1) NULL,
	[BRGEW] [decimal](13, 3) NULL,
	[VOLUM] [decimal](13, 3) NULL,
	[VOLEH] [nvarchar](3) NULL,
	[INCO1] [nvarchar](3) NULL,
	[INCO2] [nvarchar](28) NULL,
	[VORAB] [nvarchar](1) NULL,
	[KOLIF] [nvarchar](10) NULL,
	[LTSNR] [nvarchar](6) NULL,
	[PACKNO] [nvarchar](10) NULL,
	[FPLNR] [nvarchar](10) NULL,
	[GNETWR] [decimal](13, 2) NULL,
	[STAPO] [nvarchar](1) NULL,
	[UEBPO] [nvarchar](5) NULL,
	[LEWED] [nvarchar](8) NULL,
	[EMLIF] [nvarchar](10) NULL,
	[LBLKZ] [nvarchar](1) NULL,
	[SATNR] [nvarchar](18) NULL,
	[ATTYP] [nvarchar](2) NULL,
	[KANBA] [nvarchar](1) NULL,
	[ADRN2] [nvarchar](10) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[XERSY] [nvarchar](1) NULL,
	[EILDT] [nvarchar](8) NULL,
	[DRDAT] [nvarchar](8) NULL,
	[DRUHR] [nvarchar](6) NULL,
	[DRUNR] [nvarchar](4) NULL,
	[AKTNR] [nvarchar](10) NULL,
	[ABELN] [nvarchar](10) NULL,
	[ABELP] [nvarchar](5) NULL,
	[ANZPU] [decimal](13, 3) NULL,
	[PUNEI] [nvarchar](3) NULL,
	[SAISO] [nvarchar](4) NULL,
	[SAISJ] [nvarchar](4) NULL,
	[EBON2] [nvarchar](2) NULL,
	[EBON3] [nvarchar](2) NULL,
	[EBONF] [nvarchar](1) NULL,
	[MLMAA] [nvarchar](1) NULL,
	[MHDRZ] [decimal](4, 0) NULL,
	[ANFNR] [nvarchar](10) NULL,
	[ANFPS] [nvarchar](5) NULL,
	[KZKFG] [nvarchar](1) NULL,
	[USEQU] [nvarchar](1) NULL,
	[UMSOK] [nvarchar](1) NULL,
	[BANFN] [nvarchar](10) NULL,
	[BNFPO] [nvarchar](5) NULL,
	[MTART] [nvarchar](4) NULL,
	[UPTYP] [nvarchar](1) NULL,
	[UPVOR] [nvarchar](1) NULL,
	[KZWI1] [decimal](13, 2) NULL,
	[KZWI2] [decimal](13, 2) NULL,
	[KZWI3] [decimal](13, 2) NULL,
	[KZWI4] [decimal](13, 2) NULL,
	[KZWI5] [decimal](13, 2) NULL,
	[KZWI6] [decimal](13, 2) NULL,
	[SIKGR] [nvarchar](3) NULL,
	[MFZHI] [decimal](15, 3) NULL,
	[FFZHI] [decimal](15, 3) NULL,
	[RETPO] [nvarchar](1) NULL,
	[AUREL] [nvarchar](1) NULL,
	[BSGRU] [nvarchar](3) NULL,
	[LFRET] [nvarchar](4) NULL,
	[MFRGR] [nvarchar](8) NULL,
	[NRFHG] [nvarchar](1) NULL,
	[J_1BNBM] [nvarchar](16) NULL,
	[J_1BMATUSE] [nvarchar](1) NULL,
	[J_1BMATORG] [nvarchar](1) NULL,
	[J_1BOWNPRO] [nvarchar](1) NULL,
	[J_1BINDUST] [nvarchar](2) NULL,
	[ABUEB] [nvarchar](4) NULL,
	[NLABD] [nvarchar](8) NULL,
	[NFABD] [nvarchar](8) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[BONBA] [decimal](13, 2) NULL,
	[FABKZ] [nvarchar](1) NULL,
	[J_1AINDXP] [nvarchar](5) NULL,
	[J_1AIDATEP] [nvarchar](8) NULL,
	[MPROF] [nvarchar](4) NULL,
	[EGLKZ] [nvarchar](1) NULL,
	[KZTLF] [nvarchar](1) NULL,
	[KZFME] [nvarchar](1) NULL,
	[RDPRF] [nvarchar](4) NULL,
	[TECHS] [nvarchar](12) NULL,
	[CHG_SRV] [nvarchar](1) NULL,
	[CHG_FPLNR] [nvarchar](1) NULL,
	[MFRPN] [nvarchar](40) NULL,
	[MFRNR] [nvarchar](10) NULL,
	[EMNFR] [nvarchar](10) NULL,
	[NOVET] [nvarchar](1) NULL,
	[AFNAM] [nvarchar](12) NULL,
	[TZONRC] [nvarchar](6) NULL,
	[IPRKZ] [nvarchar](1) NULL,
	[LEBRE] [nvarchar](1) NULL,
	[BERID] [nvarchar](10) NULL,
	[XCONDITIONS] [nvarchar](1) NULL,
	[APOMS] [nvarchar](1) NULL,
	[CCOMP] [nvarchar](1) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[FKBER] [nvarchar](16) NULL,
	[STATUS] [nvarchar](1) NULL,
	[RESLO] [nvarchar](4) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[WEORA] [nvarchar](1) NULL,
	[SRV_BAS_COM] [nvarchar](1) NULL,
	[PRIO_URG] [nvarchar](2) NULL,
	[PRIO_REQ] [nvarchar](3) NULL,
	[EMPST] [nvarchar](25) NULL,
	[SPE_ABGRU] [nvarchar](2) NULL,
	[SPE_CRM_SO] [nvarchar](10) NULL,
	[SPE_CRM_SO_ITEM] [nvarchar](6) NULL,
	[SPE_CRM_REF_SO] [nvarchar](35) NULL,
	[SPE_CRM_REF_ITEM] [nvarchar](6) NULL,
	[SPE_CRM_FKREL] [nvarchar](1) NULL,
	[SPE_CHNG_SYS] [nvarchar](1) NULL,
	[SPE_INSMK_SRC] [nvarchar](1) NULL,
	[SPE_CQ_CTRLTYPE] [nvarchar](1) NULL,
	[SPE_CQ_NOCQ] [nvarchar](1) NULL,
	[REASON_CODE] [nvarchar](4) NULL,
	[CQU_SAR] [decimal](15, 3) NULL,
	[ANZSN] [int] NULL,
	[SPE_EWM_DTC] [nvarchar](1) NULL,
	[EXLIN] [nvarchar](40) NULL,
	[EXSNR] [nvarchar](5) NULL,
	[EHTYP] [nvarchar](4) NULL,
	[RETPC] [decimal](5, 2) NULL,
	[DPTYP] [nvarchar](4) NULL,
	[DPPCT] [decimal](5, 2) NULL,
	[DPAMT] [decimal](11, 2) NULL,
	[DPDAT] [nvarchar](8) NULL,
	[FLS_RSTO] [nvarchar](1) NULL,
	[EXT_RFX_NUMBER] [nvarchar](35) NULL,
	[EXT_RFX_ITEM] [nvarchar](10) NULL,
	[EXT_RFX_SYSTEM] [nvarchar](10) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL,
	[BLK_REASON_ID] [nvarchar](4) NULL,
	[BLK_REASON_TXT] [nvarchar](40) NULL,
	[ITCONS] [nvarchar](1) NULL,
	[FIXMG] [nvarchar](1) NULL,
	[/BEV1/NEGEN_ITEM] [nvarchar](1) NULL,
	[/BEV1/NEDEPFREE] [nvarchar](1) NULL,
	[/BEV1/NESTRUCCAT] [nvarchar](1) NULL,
	[ADVCODE] [nvarchar](2) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[EXCPE] [nvarchar](2) NULL,
	[IUID_RELEVANT] [nvarchar](1) NULL,
	[MRPIND] [nvarchar](1) NULL,
	[REFSITE] [nvarchar](4) NULL,
	[SERRU] [nvarchar](1) NULL,
	[SERNP] [nvarchar](4) NULL,
	[DISUB_SOBKZ] [nvarchar](1) NULL,
	[DISUB_PSPNR] [nvarchar](8) NULL,
	[DISUB_KUNNR] [nvarchar](10) NULL,
	[DISUB_VBELN] [nvarchar](10) NULL,
	[DISUB_POSNR] [nvarchar](6) NULL,
	[DISUB_OWNER] [nvarchar](10) NULL,
	[REF_ITEM] [nvarchar](5) NULL,
	[SOURCE_ID] [nvarchar](3) NULL,
	[SOURCE_KEY] [nvarchar](32) NULL,
	[PUT_BACK] [nvarchar](1) NULL,
	[POL_ID] [nvarchar](10) NULL,
	[CONS_ORDER] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ELBK]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ELBK](
	[MANDT] [nvarchar](3) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[LOEKZ] [nvarchar](1) NULL,
	[KLASS] [nvarchar](9) NULL,
	[GEWSL] [nvarchar](2) NULL,
	[GESBU] [decimal](3, 0) NULL,
	[LEBEW] [nvarchar](12) NULL,
	[LEBDT] [nvarchar](8) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TXTSL] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ELBM]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ELBM](
	[MANDT] [nvarchar](3) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[INFNR] [nvarchar](10) NOT NULL,
	[HKRIT] [nvarchar](2) NOT NULL,
	[LIFNR] [nvarchar](10) NULL,
	[MATNR] [nvarchar](18) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[LEBDT] [nvarchar](8) NULL,
	[DATUV] [nvarchar](8) NULL,
	[KRT01] [decimal](3, 0) NULL,
	[KRT02] [decimal](3, 0) NULL,
	[KRT03] [decimal](3, 0) NULL,
	[KRT04] [decimal](3, 0) NULL,
	[KRT05] [decimal](3, 0) NULL,
	[KRT06] [decimal](3, 0) NULL,
	[KRT07] [decimal](3, 0) NULL,
	[KRT08] [decimal](3, 0) NULL,
	[KRT09] [decimal](3, 0) NULL,
	[KRT10] [decimal](3, 0) NULL,
	[KRT11] [decimal](3, 0) NULL,
	[KRT12] [decimal](3, 0) NULL,
	[KRT13] [decimal](3, 0) NULL,
	[KRT14] [decimal](3, 0) NULL,
	[KRT15] [decimal](3, 0) NULL,
	[KRT16] [decimal](3, 0) NULL,
	[KRT17] [decimal](3, 0) NULL,
	[KRT18] [decimal](3, 0) NULL,
	[KRT19] [decimal](3, 0) NULL,
	[KRT20] [decimal](3, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ELBP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ELBP](
	[MANDT] [nvarchar](3) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[HKRIT] [nvarchar](2) NOT NULL,
	[BEURT] [decimal](3, 0) NULL,
	[LEBEW] [nvarchar](12) NULL,
	[LEBDT] [nvarchar](8) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[TXTSL] [nvarchar](5) NULL,
	[KRT01] [decimal](3, 0) NULL,
	[KRT02] [decimal](3, 0) NULL,
	[KRT03] [decimal](3, 0) NULL,
	[KRT04] [decimal](3, 0) NULL,
	[KRT05] [decimal](3, 0) NULL,
	[KRT06] [decimal](3, 0) NULL,
	[KRT07] [decimal](3, 0) NULL,
	[KRT08] [decimal](3, 0) NULL,
	[KRT09] [decimal](3, 0) NULL,
	[KRT10] [decimal](3, 0) NULL,
	[KRT11] [decimal](3, 0) NULL,
	[KRT12] [decimal](3, 0) NULL,
	[KRT13] [decimal](3, 0) NULL,
	[KRT14] [decimal](3, 0) NULL,
	[KRT15] [decimal](3, 0) NULL,
	[KRT16] [decimal](3, 0) NULL,
	[KRT17] [decimal](3, 0) NULL,
	[KRT18] [decimal](3, 0) NULL,
	[KRT19] [decimal](3, 0) NULL,
	[KRT20] [decimal](3, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EMFIN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EMFIN](
	[MANDT] [nvarchar](3) NOT NULL,
	[NREMFIN] [nvarchar](4) NOT NULL,
	[FBEMFIN] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EORD]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EORD](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[ZEORD] [nvarchar](5) NOT NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[VDATU] [nvarchar](8) NULL,
	[BDATU] [nvarchar](8) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[FLIFN] [nvarchar](1) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[FEBEL] [nvarchar](1) NULL,
	[RESWK] [nvarchar](4) NULL,
	[FRESW] [nvarchar](1) NULL,
	[EMATN] [nvarchar](18) NULL,
	[NOTKZ] [nvarchar](1) NULL,
	[EKORG] [nvarchar](4) NULL,
	[VRTYP] [nvarchar](1) NULL,
	[EORTP] [nvarchar](1) NULL,
	[AUTET] [nvarchar](1) NULL,
	[MEINS] [nvarchar](3) NULL,
	[LOGSY] [nvarchar](10) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_EQUP]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_EQUP](
	[MANDT] [nvarchar](3) NOT NULL,
	[QUNUM] [nvarchar](10) NOT NULL,
	[QUPOS] [nvarchar](3) NOT NULL,
	[BESKZ] [nvarchar](1) NULL,
	[SOBES] [nvarchar](1) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[BEWRK] [nvarchar](4) NULL,
	[QUOTE] [decimal](3, 0) NULL,
	[QUBMG] [decimal](15, 3) NULL,
	[QUMNG] [decimal](15, 3) NULL,
	[MAXMG] [decimal](15, 3) NULL,
	[VERID] [nvarchar](4) NULL,
	[MAXLS] [decimal](13, 3) NULL,
	[MINLS] [decimal](13, 3) NULL,
	[RDPRF] [nvarchar](4) NULL,
	[KZEIN] [nvarchar](1) NULL,
	[ABRMG] [decimal](13, 3) NULL,
	[ABPER] [nvarchar](1) NULL,
	[ABANZ] [nvarchar](2) NULL,
	[PREIH] [nvarchar](2) NULL,
	[EMATN] [nvarchar](18) NULL,
	[PLIFZ] [decimal](3, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESKL]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESKL](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[INTROW] [nvarchar](10) NOT NULL,
	[NUMKN] [nvarchar](2) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[LOEKZ] [nvarchar](1) NOT NULL,
	[NOACT] [nvarchar](1) NOT NULL,
	[MENGE] [decimal](13, 3) NOT NULL,
	[WPROZ] [decimal](4, 1) NOT NULL,
	[NETWR] [decimal](11, 2) NOT NULL,
	[ZEKKN] [nvarchar](2) NOT NULL,
	[HPACKNO] [nvarchar](10) NOT NULL,
	[ACT_MENGE] [decimal](13, 3) NOT NULL,
	[ACT_WERT] [decimal](13, 2) NULL,
	[PLN_NUMKN] [nvarchar](2) NOT NULL,
	[NAVNW] [decimal](11, 2) NULL,
	[LFPOS] [nvarchar](4) NULL,
	[INV_MENGE] [decimal](13, 3) NULL,
	[FINAL] [nvarchar](1) NULL,
	[FINAL_QTY] [decimal](13, 3) NULL,
	[FINAL_REASON] [nvarchar](2) NULL,
	[AA_FINAL_QTY_F] [float] NULL,
	[MENGE_F] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESKN]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESKN](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[ZEKKN] [nvarchar](2) NOT NULL,
	[BEKKN] [nvarchar](2) NOT NULL,
	[LOEKZ] [nvarchar](1) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[KFLAG] [nvarchar](1) NOT NULL,
	[WPROZ] [decimal](4, 1) NOT NULL,
	[NETWR] [decimal](11, 2) NOT NULL,
	[SAKTO] [nvarchar](10) NOT NULL,
	[GSBER] [nvarchar](4) NOT NULL,
	[KOSTL] [nvarchar](10) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[VBELP] [nvarchar](6) NOT NULL,
	[VETEN] [nvarchar](4) NULL,
	[ANLN1] [nvarchar](12) NOT NULL,
	[ANLN2] [nvarchar](4) NOT NULL,
	[AUFNR] [nvarchar](12) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[XBKST] [nvarchar](1) NOT NULL,
	[XBAUF] [nvarchar](1) NOT NULL,
	[XBPRO] [nvarchar](1) NOT NULL,
	[EREKZ] [nvarchar](1) NOT NULL,
	[KSTRG] [nvarchar](12) NOT NULL,
	[PAOBJNR] [nvarchar](10) NOT NULL,
	[PRCTR] [nvarchar](10) NOT NULL,
	[PS_PSP_PNR] [nvarchar](8) NOT NULL,
	[NPLNR] [nvarchar](12) NOT NULL,
	[AUFPL] [nvarchar](10) NOT NULL,
	[IMKEY] [nvarchar](8) NOT NULL,
	[APLZL] [nvarchar](8) NOT NULL,
	[VPTNR] [nvarchar](10) NOT NULL,
	[FIPOS] [nvarchar](14) NOT NULL,
	[RECID] [nvarchar](2) NOT NULL,
	[ZZSPREG] [nvarchar](5) NULL,
	[ZZBUSPARTN] [nvarchar](10) NULL,
	[ZZPRODUCT] [nvarchar](10) NULL,
	[ZZLOCA] [nvarchar](4) NULL,
	[ZZCHAN] [nvarchar](4) NULL,
	[ZZLOB] [nvarchar](7) NULL,
	[ZZNFAL] [nvarchar](10) NULL,
	[ZZUSERFLD1] [nvarchar](9) NULL,
	[ZZUSERFLD2] [nvarchar](12) NULL,
	[ZZUSERFLD3] [nvarchar](22) NULL,
	[ZZREGION] [nvarchar](3) NULL,
	[ZZSTATE] [nvarchar](3) NULL,
	[FISTL] [nvarchar](16) NOT NULL,
	[GEBER] [nvarchar](10) NOT NULL,
	[FKBER] [nvarchar](16) NOT NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[NAVNW] [decimal](11, 2) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[DABRZ] [nvarchar](8) NULL,
	[LSTAR] [nvarchar](6) NULL,
	[PRZNR] [nvarchar](12) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[FM_SPLIT_BATCH] [nvarchar](3) NULL,
	[FM_SPLIT_BEGRU] [nvarchar](4) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[TCOBJNR] [nvarchar](22) NULL,
	[DATEOFSERVICE] [nvarchar](8) NULL,
	[NOTAXCORR] [nvarchar](1) NULL,
	[DIFFOPTRATE] [decimal](9, 6) NULL,
	[HASDIFFOPTRATE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESLH]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESLH](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[DEL] [nvarchar](1) NOT NULL,
	[FPACKNO] [nvarchar](10) NOT NULL,
	[HPACKNO] [nvarchar](10) NOT NULL,
	[KNUMV] [nvarchar](10) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[BSTYP] [nvarchar](1) NOT NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[SUM_NETWR] [decimal](15, 2) NULL,
	[IWEIN] [nvarchar](3) NULL,
	[SUM_WORK] [decimal](8, 2) NULL,
	[INT_USE] [nvarchar](1) NULL,
	[WKURS] [decimal](9, 5) NULL,
	[VBELN] [nvarchar](10) NULL,
	[POSNR] [nvarchar](6) NULL,
	[VBTYP] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESLL]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESLL](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[INTROW] [nvarchar](10) NOT NULL,
	[EXTROW] [nvarchar](10) NOT NULL,
	[DEL] [nvarchar](1) NOT NULL,
	[SRVPOS] [nvarchar](18) NOT NULL,
	[RANG] [smallint] NOT NULL,
	[EXTGROUP] [nvarchar](8) NOT NULL,
	[PACKAGE] [nvarchar](1) NOT NULL,
	[SUB_PACKNO] [nvarchar](10) NOT NULL,
	[LBNUM] [nvarchar](3) NOT NULL,
	[AUSGB] [nvarchar](4) NOT NULL,
	[STLVPOS] [nvarchar](18) NOT NULL,
	[EXTSRVNO] [nvarchar](18) NOT NULL,
	[MENGE] [decimal](13, 3) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[UEBTO] [decimal](3, 1) NOT NULL,
	[UEBTK] [nvarchar](1) NOT NULL,
	[WITH_LIM] [nvarchar](1) NOT NULL,
	[SPINF] [nvarchar](1) NOT NULL,
	[PEINH] [decimal](5, 0) NULL,
	[BRTWR] [decimal](11, 2) NOT NULL,
	[NETWR] [decimal](11, 2) NOT NULL,
	[FROMPOS] [nvarchar](6) NOT NULL,
	[TOPOS] [nvarchar](6) NOT NULL,
	[KTEXT1] [nvarchar](40) NOT NULL,
	[VRTKZ] [nvarchar](1) NOT NULL,
	[TWRKZ] [nvarchar](1) NOT NULL,
	[PERNR] [nvarchar](8) NOT NULL,
	[MOLGA] [nvarchar](2) NOT NULL,
	[LGART] [nvarchar](4) NOT NULL,
	[LGTXT] [nvarchar](25) NOT NULL,
	[STELL] [nvarchar](8) NOT NULL,
	[IFTNR] [nvarchar](10) NOT NULL,
	[BUDAT] [nvarchar](8) NOT NULL,
	[INSDT] [nvarchar](8) NOT NULL,
	[PLN_PACKNO] [nvarchar](10) NOT NULL,
	[PLN_INTROW] [nvarchar](10) NOT NULL,
	[KNT_PACKNO] [nvarchar](10) NOT NULL,
	[KNT_INTROW] [nvarchar](10) NOT NULL,
	[TMP_PACKNO] [nvarchar](10) NULL,
	[TMP_INTROW] [nvarchar](10) NULL,
	[STLV_LIM] [nvarchar](1) NULL,
	[LIMIT_ROW] [nvarchar](10) NOT NULL,
	[ACT_MENGE] [decimal](13, 3) NOT NULL,
	[ACT_WERT] [decimal](11, 2) NOT NULL,
	[KNT_WERT] [decimal](11, 2) NOT NULL,
	[KNT_MENGE] [decimal](13, 3) NOT NULL,
	[ZIELWERT] [decimal](11, 2) NOT NULL,
	[UNG_WERT] [decimal](11, 2) NOT NULL,
	[UNG_MENGE] [decimal](13, 3) NOT NULL,
	[ALT_INTROW] [nvarchar](10) NOT NULL,
	[BASIC] [nvarchar](1) NOT NULL,
	[ALTERNAT] [nvarchar](1) NOT NULL,
	[BIDDER] [nvarchar](1) NOT NULL,
	[SUPPLE] [nvarchar](1) NOT NULL,
	[FREEQTY] [nvarchar](1) NOT NULL,
	[INFORM] [nvarchar](1) NOT NULL,
	[PAUSCH] [nvarchar](1) NOT NULL,
	[EVENTUAL] [nvarchar](1) NOT NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[PRS_CHG] [nvarchar](1) NULL,
	[MATKL] [nvarchar](9) NULL,
	[TBTWR] [decimal](11, 2) NULL,
	[NAVNW] [decimal](11, 2) NULL,
	[BASWR] [decimal](11, 2) NULL,
	[KKNUMV] [nvarchar](10) NULL,
	[IWEIN] [nvarchar](3) NULL,
	[INT_WORK] [decimal](8, 2) NULL,
	[EXTERNALID] [nvarchar](40) NULL,
	[KSTAR] [nvarchar](10) NULL,
	[ACT_WORK] [decimal](8, 2) NULL,
	[MAPNO] [nvarchar](4) NULL,
	[SRVMAPKEY] [nvarchar](10) NULL,
	[TAXTARIFFCODE] [nvarchar](16) NULL,
	[SDATE] [nvarchar](8) NULL,
	[BEGTIME] [nvarchar](6) NULL,
	[ENDTIME] [nvarchar](6) NULL,
	[PERSEXT] [nvarchar](40) NULL,
	[CATSCOUNTE] [nvarchar](12) NULL,
	[STOKZ] [nvarchar](1) NULL,
	[BELNR] [nvarchar](10) NULL,
	[FORMELNR] [nvarchar](10) NULL,
	[FRMVAL1] [decimal](13, 3) NULL,
	[FRMVAL2] [decimal](13, 3) NULL,
	[FRMVAL3] [decimal](13, 3) NULL,
	[FRMVAL4] [decimal](13, 3) NULL,
	[FRMVAL5] [decimal](13, 3) NULL,
	[USERF1_NUM] [nvarchar](10) NULL,
	[USERF2_NUM] [decimal](13, 3) NULL,
	[USERF1_TXT] [nvarchar](40) NULL,
	[USERF2_TXT] [nvarchar](10) NULL,
	[KNOBJ] [nvarchar](18) NULL,
	[CHGTEXT] [nvarchar](1) NULL,
	[KALNR] [nvarchar](12) NULL,
	[KLVAR] [nvarchar](4) NULL,
	[EXTREFKEY] [nvarchar](40) NULL,
	[INV_MENGE] [decimal](13, 3) NULL,
	[PER_SDATE] [nvarchar](8) NULL,
	[PER_EDATE] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESSR]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESSR](
	[MANDT] [nvarchar](3) NOT NULL,
	[LBLNI] [nvarchar](10) NOT NULL,
	[LBLNE] [nvarchar](16) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[SBNAMAG] [nvarchar](12) NOT NULL,
	[SBNAMAN] [nvarchar](12) NOT NULL,
	[DLORT] [nvarchar](25) NOT NULL,
	[LBLDT] [nvarchar](8) NOT NULL,
	[LZVON] [nvarchar](8) NOT NULL,
	[LZBIS] [nvarchar](8) NOT NULL,
	[LWERT] [decimal](11, 2) NOT NULL,
	[UWERT] [decimal](11, 2) NOT NULL,
	[UNPLV] [decimal](11, 2) NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[TXZ01] [nvarchar](40) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[LOEKZ] [nvarchar](1) NOT NULL,
	[KZABN] [nvarchar](1) NOT NULL,
	[FINAL] [nvarchar](1) NOT NULL,
	[FRGGR] [nvarchar](2) NOT NULL,
	[FRGSX] [nvarchar](2) NOT NULL,
	[FRGKL] [nvarchar](1) NOT NULL,
	[FRGZU] [nvarchar](8) NOT NULL,
	[FRGRL] [nvarchar](1) NOT NULL,
	[F_LOCK] [nvarchar](1) NULL,
	[PWWE] [decimal](3, 0) NULL,
	[PWFR] [decimal](3, 0) NULL,
	[BLDAT] [nvarchar](8) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[XBLNR] [nvarchar](16) NULL,
	[BKTXT] [nvarchar](25) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[NETWR] [decimal](11, 2) NULL,
	[BANFN] [nvarchar](10) NULL,
	[BNFPO] [nvarchar](5) NULL,
	[WARPL] [nvarchar](12) NULL,
	[WAPOS] [nvarchar](16) NULL,
	[ABNUM] [int] NULL,
	[FKNUM] [nvarchar](10) NULL,
	[FKPOS] [nvarchar](6) NULL,
	[USER1] [nvarchar](20) NULL,
	[USER2] [nvarchar](20) NULL,
	[NAVNW] [decimal](11, 2) NULL,
	[SPEC_NO] [nvarchar](10) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[LEMIN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESUC]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESUC](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[INTROW] [nvarchar](10) NOT NULL,
	[DEL] [nvarchar](1) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[LIMIT] [decimal](13, 2) NOT NULL,
	[NOLIMIT] [nvarchar](1) NOT NULL,
	[ACTVALUE] [decimal](13, 2) NOT NULL,
	[KTEXT1] [nvarchar](40) NOT NULL,
	[SUB_PACKNO] [nvarchar](10) NOT NULL,
	[PRS_CHG] [nvarchar](1) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ESUH]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ESUH](
	[MANDT] [nvarchar](3) NOT NULL,
	[PACKNO] [nvarchar](10) NOT NULL,
	[PLN_PACKNO] [nvarchar](10) NOT NULL,
	[SUMLIMIT] [decimal](13, 2) NOT NULL,
	[SUMNOLIM] [nvarchar](1) NOT NULL,
	[COMMITMENT] [decimal](13, 2) NOT NULL,
	[ACTVALUE] [decimal](13, 2) NOT NULL,
	[ST_EXIT] [nvarchar](1) NOT NULL,
	[VC_EXIST] [nvarchar](1) NOT NULL,
	[PK_EXIST] [nvarchar](1) NOT NULL,
	[PRS_CHG] [nvarchar](1) NULL,
	[RESTLIMIT] [decimal](13, 2) NOT NULL,
	[RESTNOLIM] [nvarchar](1) NOT NULL,
	[RESTACT] [decimal](13, 2) NOT NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[LBNUM] [nvarchar](3) NULL,
	[AUSGB] [nvarchar](4) NULL,
	[LBLIMIT] [decimal](11, 2) NULL,
	[LBNOLIM] [nvarchar](1) NULL,
	[ACTLBLIM] [decimal](11, 2) NULL,
	[PRS_CHG_LB] [nvarchar](1) NULL,
	[SPEC_NO] [nvarchar](10) NULL,
	[SPECLIMIT] [decimal](11, 2) NULL,
	[PRS_CHG_MU] [nvarchar](1) NULL,
	[TMP_PROZ] [decimal](3, 1) NULL,
	[LB_PROZ] [decimal](3, 1) NULL,
	[CONT_PROZ] [decimal](3, 1) NULL,
	[SPECNOLIM] [nvarchar](1) NULL,
	[ACTSPLIM] [decimal](11, 2) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[NAVNW] [decimal](13, 2) NULL,
	[KSTAR] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_FMFPO]    Script Date: 10/15/2014 5:40:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_FMFPO](
	[MANDT] [nvarchar](3) NOT NULL,
	[FIKRS] [nvarchar](4) NOT NULL,
	[FIPOS] [nvarchar](14) NOT NULL,
	[DATBIS] [nvarchar](8) NOT NULL,
	[DATAB] [nvarchar](8) NULL,
	[POSIT] [nvarchar](8) NULL,
	[ERFNAME] [nvarchar](12) NULL,
	[ERFDAT] [nvarchar](8) NULL,
	[FIVOR] [nvarchar](2) NULL,
	[KNZAEPO] [nvarchar](1) NULL,
	[DEAKTIV] [nvarchar](1) NULL,
	[LOEVM] [nvarchar](1) NULL,
	[FMA_OBJNR] [nvarchar](22) NULL,
	[AENNAME] [nvarchar](12) NULL,
	[AENDAT] [nvarchar](8) NULL,
	[FICTR] [nvarchar](16) NOT NULL,
	[KRTYP] [nvarchar](5) NULL,
	[KRGRP] [nvarchar](4) NULL,
	[NDAKZ] [nvarchar](1) NULL,
	[AZPKZ] [nvarchar](1) NULL,
	[VPTYP] [nvarchar](2) NULL,
	[FIPEX] [nvarchar](24) NULL,
	[COLLROL] [nvarchar](1) NULL,
	[COLLTYP] [nvarchar](1) NULL,
	[AUGRP] [nvarchar](10) NULL,
	[BUTYP] [nvarchar](4) NULL,
	[AUSART] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_IKPF]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_IKPF](
	[MANDT] [nvarchar](3) NOT NULL,
	[IBLNR] [nvarchar](10) NOT NULL,
	[GJAHR] [nvarchar](4) NOT NULL,
	[VGART] [nvarchar](2) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[BLDAT] [nvarchar](8) NULL,
	[GIDAT] [nvarchar](8) NULL,
	[ZLDAT] [nvarchar](8) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[MONAT] [nvarchar](2) NULL,
	[USNAM] [nvarchar](12) NULL,
	[SPERR] [nvarchar](1) NULL,
	[ZSTAT] [nvarchar](1) NULL,
	[DSTAT] [nvarchar](1) NULL,
	[XBLNI] [nvarchar](16) NULL,
	[LSTAT] [nvarchar](1) NULL,
	[XBUFI] [nvarchar](1) NULL,
	[KEORD] [nvarchar](2) NULL,
	[ORDNG] [nvarchar](10) NULL,
	[INVNU] [nvarchar](16) NULL,
	[IBLTXT] [nvarchar](40) NULL,
	[INVART] [nvarchar](1) NULL,
	[WSTI_BSTAT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ISEG]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ISEG](
	[MANDT] [nvarchar](3) NOT NULL,
	[IBLNR] [nvarchar](10) NOT NULL,
	[GJAHR] [nvarchar](4) NOT NULL,
	[ZEILI] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[CHARG] [nvarchar](10) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[BSTAR] [nvarchar](1) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[KDEIN] [nvarchar](4) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[PLPLA] [nvarchar](10) NULL,
	[USNAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[USNAZ] [nvarchar](12) NULL,
	[ZLDAT] [nvarchar](8) NULL,
	[USNAD] [nvarchar](12) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[XBLNI] [nvarchar](16) NULL,
	[XZAEL] [nvarchar](1) NULL,
	[XDIFF] [nvarchar](1) NULL,
	[XNZAE] [nvarchar](1) NULL,
	[XLOEK] [nvarchar](1) NULL,
	[XAMEI] [nvarchar](1) NULL,
	[BUCHM] [decimal](13, 3) NULL,
	[XNULL] [nvarchar](1) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[ERFMG] [decimal](13, 3) NULL,
	[ERFME] [nvarchar](3) NULL,
	[MBLNR] [nvarchar](10) NULL,
	[MJAHR] [nvarchar](4) NULL,
	[ZEILE] [nvarchar](4) NULL,
	[NBLNR] [nvarchar](10) NULL,
	[DMBTR] [decimal](13, 2) NULL,
	[WAERS] [nvarchar](5) NULL,
	[ABCIN] [nvarchar](1) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[VKWRT] [decimal](13, 2) NULL,
	[EXVKW] [decimal](13, 2) NULL,
	[BUCHW] [decimal](13, 2) NULL,
	[KWART] [nvarchar](1) NULL,
	[VKWRA] [decimal](13, 2) NULL,
	[VKMZL] [decimal](13, 2) NULL,
	[VKNZL] [decimal](13, 2) NULL,
	[WRTZL] [decimal](13, 2) NULL,
	[WRTBM] [decimal](13, 2) NULL,
	[DIWZL] [decimal](13, 2) NULL,
	[ATTYP] [nvarchar](2) NULL,
	[GRUND] [nvarchar](4) NULL,
	[SAMAT] [nvarchar](18) NULL,
	[XDISPATCH] [nvarchar](1) NULL,
	[DISUB_OWNER] [nvarchar](10) NULL,
	[WSTI_COUNTDATE] [nvarchar](8) NULL,
	[WSTI_COUNTTIME] [nvarchar](6) NULL,
	[WSTI_FREEZEDATE] [nvarchar](8) NULL,
	[WSTI_FREEZETIME] [nvarchar](6) NULL,
	[WSTI_POSM] [decimal](13, 3) NULL,
	[WSTI_POSW] [decimal](13, 2) NULL,
	[WSTI_XCALC] [nvarchar](1) NULL,
	[WSTI_ENTERDATE] [nvarchar](8) NULL,
	[WSTI_ENTERTIME] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1ADTYP]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1ADTYP](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[J_1ADTYP] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1AGICD]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1AGICD](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[J_1AGICD] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1AINFT20]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1AINFT20](
	[MANDT] [nvarchar](3) NOT NULL,
	[J_1AINDX] [nvarchar](5) NOT NULL,
	[J_1ACOINDP] [nvarchar](1) NULL,
	[J_1AVERACP] [nvarchar](4) NULL,
	[J_1ADECIMP] [nvarchar](2) NULL,
	[J_1ACOINAP] [nvarchar](1) NULL,
	[J_1ANOVERP] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BAA]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BAA](
	[MANDT] [nvarchar](3) NOT NULL,
	[NFTYPE] [nvarchar](2) NOT NULL,
	[DOCTYP] [nvarchar](1) NULL,
	[DIRECT] [nvarchar](1) NULL,
	[ENTRAD] [nvarchar](1) NULL,
	[NFTYPC] [nvarchar](2) NULL,
	[FORM] [nvarchar](4) NULL,
	[MODEL] [nvarchar](2) NULL,
	[PARVW] [nvarchar](2) NULL,
	[PARTYP] [nvarchar](1) NULL,
	[ITMTYP] [nvarchar](2) NULL,
	[TEXTKEY] [nvarchar](4) NULL,
	[SHIPFROM] [nvarchar](1) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[NFTYPECONTI] [nvarchar](2) NULL,
	[NFE] [nvarchar](1) NULL,
	[NFENRNR] [nvarchar](2) NULL,
	[FORM_SCAN] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BAG]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BAG](
	[MANDT] [nvarchar](3) NOT NULL,
	[CFOP] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BATL1]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BATL1](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXLAW] [nvarchar](3) NOT NULL,
	[TAXSIT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BATL2]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BATL2](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXLAW] [nvarchar](3) NOT NULL,
	[TAXSIT] [nvarchar](5) NULL,
	[TAXSITOUT] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BATL3]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BATL3](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXLAW] [nvarchar](3) NOT NULL,
	[TAXSIT] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BATL4A]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BATL4A](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXLAW] [nvarchar](3) NOT NULL,
	[TAXSIT] [nvarchar](2) NOT NULL,
	[TAXSITOUT] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BATL5]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BATL5](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXLAW] [nvarchar](3) NOT NULL,
	[TAXSIT] [nvarchar](2) NOT NULL,
	[TAXSITOUT] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BBRANCH]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BBRANCH](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[BRANCH] [nvarchar](4) NOT NULL,
	[NAME] [nvarchar](30) NULL,
	[CGC_BRANCH] [nvarchar](4) NULL,
	[STATE_INSC] [nvarchar](18) NULL,
	[MUNIC_INSC] [nvarchar](20) NULL,
	[INDUSTRY] [nvarchar](2) NULL,
	[SINGLE] [nvarchar](1) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[NFDEC] [nvarchar](1) NULL,
	[KR_REPRES] [nvarchar](10) NULL,
	[KR_BUSTYPE] [nvarchar](30) NULL,
	[KR_INDTYPE] [nvarchar](30) NULL,
	[STCD1] [nvarchar](16) NULL,
	[STCD2] [nvarchar](11) NULL,
	[KR_TAXOFF] [nvarchar](3) NULL,
	[PAC01] [nvarchar](14) NULL,
	[VDP01] [nvarchar](8) NULL,
	[PAC02] [nvarchar](14) NULL,
	[VDP02] [nvarchar](8) NULL,
	[IPICONTRIBUTOR] [nvarchar](1) NULL,
	[IDSIGN] [nvarchar](30) NULL,
	[SOURE_DANGERGOOD] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_J_1BTXSDC]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_J_1BTXSDC](
	[MANDT] [nvarchar](3) NOT NULL,
	[TAXCODE] [nvarchar](2) NOT NULL,
	[CUSTUSAGE] [nvarchar](1) NULL,
	[ICMS] [nvarchar](1) NULL,
	[IPI] [nvarchar](1) NULL,
	[SUBTRIB] [nvarchar](1) NULL,
	[ISS] [nvarchar](1) NULL,
	[ICMS_EX] [nvarchar](1) NULL,
	[IPI_EX] [nvarchar](1) NULL,
	[ICMS_FR] [nvarchar](1) NULL,
	[ICMS_FS] [nvarchar](1) NULL,
	[PIS] [nvarchar](1) NULL,
	[COFINS] [nvarchar](1) NULL,
	[WHT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_KLAH]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_KLAH](
	[MANDT] [nvarchar](3) NOT NULL,
	[CLINT] [nvarchar](10) NOT NULL,
	[KLART] [nvarchar](3) NULL,
	[CLASS] [nvarchar](18) NULL,
	[STATU] [nvarchar](1) NULL,
	[KLAGR] [nvarchar](10) NULL,
	[BGRSE] [nvarchar](3) NULL,
	[BGRKL] [nvarchar](3) NULL,
	[BGRKP] [nvarchar](3) NULL,
	[ANAME] [nvarchar](12) NULL,
	[ADATU] [nvarchar](8) NULL,
	[VNAME] [nvarchar](12) NULL,
	[VDATU] [nvarchar](8) NULL,
	[VONDT] [nvarchar](8) NULL,
	[BISDT] [nvarchar](8) NULL,
	[ANZUO] [nvarchar](5) NULL,
	[PRAUS] [nvarchar](1) NULL,
	[SICHT] [nvarchar](10) NULL,
	[DOKNR] [nvarchar](25) NULL,
	[DOKAR] [nvarchar](3) NULL,
	[DOKTL] [nvarchar](3) NULL,
	[DOKVR] [nvarchar](2) NULL,
	[DINKZ] [nvarchar](1) NULL,
	[NNORM] [nvarchar](10) NULL,
	[NORMN] [nvarchar](20) NULL,
	[NORMB] [nvarchar](70) NULL,
	[NRMT1] [nvarchar](70) NULL,
	[NRMT2] [nvarchar](70) NULL,
	[AUSGD] [nvarchar](8) NULL,
	[VERSD] [nvarchar](8) NULL,
	[VERSI] [nvarchar](2) NULL,
	[LEIST] [nvarchar](20) NULL,
	[VERWE] [nvarchar](1) NULL,
	[SPART] [nvarchar](2) NULL,
	[LREF3] [nvarchar](3) NULL,
	[WWSKZ] [nvarchar](1) NULL,
	[WWSSI] [nvarchar](1) NULL,
	[POTPR] [nvarchar](1) NULL,
	[CLOBK] [nvarchar](1) NULL,
	[CLMUL] [nvarchar](1) NULL,
	[CVIEW] [nvarchar](10) NULL,
	[DISST] [nvarchar](3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[CLMOD] [nvarchar](1) NULL,
	[VWSTL] [nvarchar](1) NULL,
	[VWPLA] [nvarchar](1) NULL,
	[CLALT] [nvarchar](1) NULL,
	[LBREI] [nvarchar](3) NULL,
	[BNAME] [nvarchar](20) NULL,
	[MAXBL] [nvarchar](18) NULL,
	[KNOBJ] [nvarchar](18) NULL,
	[LOCLA] [nvarchar](1) NULL,
	[KATALOG] [nvarchar](30) NULL,
	[KDOKAZ] [nvarchar](1) NULL,
	[GENRKZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_KNA1]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_KNA1](
	[MANDT] [nvarchar](3) NOT NULL,
	[KUNNR] [nvarchar](10) NOT NULL,
	[LAND1] [nvarchar](3) NULL,
	[NAME1] [nvarchar](35) NULL,
	[NAME2] [nvarchar](35) NULL,
	[ORT01] [nvarchar](35) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[REGIO] [nvarchar](3) NULL,
	[SORTL] [nvarchar](10) NULL,
	[STRAS] [nvarchar](35) NULL,
	[TELF1] [nvarchar](16) NULL,
	[TELFX] [nvarchar](31) NULL,
	[XCPDK] [nvarchar](1) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[MCOD1] [nvarchar](25) NULL,
	[MCOD2] [nvarchar](25) NULL,
	[MCOD3] [nvarchar](25) NULL,
	[ANRED] [nvarchar](15) NULL,
	[AUFSD] [nvarchar](2) NULL,
	[BAHNE] [nvarchar](25) NULL,
	[BAHNS] [nvarchar](25) NULL,
	[BBBNR] [nvarchar](7) NULL,
	[BBSNR] [nvarchar](5) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[BRSCH] [nvarchar](4) NULL,
	[BUBKZ] [nvarchar](1) NULL,
	[DATLT] [nvarchar](14) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[EXABL] [nvarchar](1) NULL,
	[FAKSD] [nvarchar](2) NULL,
	[FISKN] [nvarchar](10) NULL,
	[KNAZK] [nvarchar](2) NULL,
	[KNRZA] [nvarchar](10) NULL,
	[KONZS] [nvarchar](10) NULL,
	[KTOKD] [nvarchar](4) NULL,
	[KUKLA] [nvarchar](2) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[LIFSD] [nvarchar](2) NULL,
	[LOCCO] [nvarchar](10) NULL,
	[LOEVM] [nvarchar](1) NULL,
	[NAME3] [nvarchar](35) NULL,
	[NAME4] [nvarchar](35) NULL,
	[NIELS] [nvarchar](2) NULL,
	[ORT02] [nvarchar](35) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTL2] [nvarchar](10) NULL,
	[COUNC] [nvarchar](3) NULL,
	[CITYC] [nvarchar](4) NULL,
	[RPMKR] [nvarchar](5) NULL,
	[SPERR] [nvarchar](1) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[STCD1] [nvarchar](16) NULL,
	[STCD2] [nvarchar](11) NULL,
	[STKZA] [nvarchar](1) NULL,
	[STKZU] [nvarchar](1) NULL,
	[TELBX] [nvarchar](15) NULL,
	[TELF2] [nvarchar](16) NULL,
	[TELTX] [nvarchar](30) NULL,
	[TELX1] [nvarchar](30) NULL,
	[LZONE] [nvarchar](10) NULL,
	[XZEMP] [nvarchar](1) NULL,
	[VBUND] [nvarchar](6) NULL,
	[STCEG] [nvarchar](20) NULL,
	[DEAR1] [nvarchar](1) NULL,
	[DEAR2] [nvarchar](1) NULL,
	[DEAR3] [nvarchar](1) NULL,
	[DEAR4] [nvarchar](1) NULL,
	[DEAR5] [nvarchar](1) NULL,
	[GFORM] [nvarchar](2) NULL,
	[BRAN1] [nvarchar](10) NULL,
	[BRAN2] [nvarchar](10) NULL,
	[BRAN3] [nvarchar](10) NULL,
	[BRAN4] [nvarchar](10) NULL,
	[BRAN5] [nvarchar](10) NULL,
	[EKONT] [nvarchar](10) NULL,
	[UMSAT] [decimal](8, 2) NULL,
	[UMJAH] [nvarchar](4) NULL,
	[UWAER] [nvarchar](5) NULL,
	[JMZAH] [nvarchar](6) NULL,
	[JMJAH] [nvarchar](4) NULL,
	[KATR1] [nvarchar](2) NULL,
	[KATR2] [nvarchar](2) NULL,
	[KATR3] [nvarchar](2) NULL,
	[KATR4] [nvarchar](2) NULL,
	[KATR5] [nvarchar](2) NULL,
	[KATR6] [nvarchar](3) NULL,
	[KATR7] [nvarchar](3) NULL,
	[KATR8] [nvarchar](3) NULL,
	[KATR9] [nvarchar](3) NULL,
	[KATR10] [nvarchar](3) NULL,
	[STKZN] [nvarchar](1) NULL,
	[UMSA1] [decimal](15, 2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[PERIV] [nvarchar](2) NULL,
	[ABRVW] [nvarchar](3) NULL,
	[INSPBYDEBI] [nvarchar](1) NULL,
	[INSPATDEBI] [nvarchar](1) NULL,
	[KTOCD] [nvarchar](4) NULL,
	[PFORT] [nvarchar](35) NULL,
	[WERKS] [nvarchar](4) NULL,
	[DTAMS] [nvarchar](1) NULL,
	[DTAWS] [nvarchar](2) NULL,
	[DUEFL] [nvarchar](1) NULL,
	[HZUOR] [nvarchar](2) NULL,
	[SPERZ] [nvarchar](1) NULL,
	[ETIKG] [nvarchar](10) NULL,
	[CIVVE] [nvarchar](1) NULL,
	[MILVE] [nvarchar](1) NULL,
	[KDKG1] [nvarchar](2) NULL,
	[KDKG2] [nvarchar](2) NULL,
	[KDKG3] [nvarchar](2) NULL,
	[KDKG4] [nvarchar](2) NULL,
	[KDKG5] [nvarchar](2) NULL,
	[XKNZA] [nvarchar](1) NULL,
	[FITYP] [nvarchar](2) NULL,
	[STCDT] [nvarchar](2) NULL,
	[STCD3] [nvarchar](18) NULL,
	[STCD4] [nvarchar](18) NULL,
	[STCD5] [nvarchar](60) NULL,
	[XICMS] [nvarchar](1) NULL,
	[XXIPI] [nvarchar](1) NULL,
	[XSUBT] [nvarchar](3) NULL,
	[CFOPC] [nvarchar](2) NULL,
	[TXLW1] [nvarchar](3) NULL,
	[TXLW2] [nvarchar](3) NULL,
	[CCC01] [nvarchar](1) NULL,
	[CCC02] [nvarchar](1) NULL,
	[CCC03] [nvarchar](1) NULL,
	[CCC04] [nvarchar](1) NULL,
	[CASSD] [nvarchar](2) NULL,
	[KNURL] [nvarchar](132) NULL,
	[J_1KFREPRE] [nvarchar](10) NULL,
	[J_1KFTBUS] [nvarchar](30) NULL,
	[J_1KFTIND] [nvarchar](30) NULL,
	[CONFS] [nvarchar](1) NOT NULL,
	[UPDAT] [nvarchar](8) NULL,
	[UPTIM] [nvarchar](6) NULL,
	[NODEL] [nvarchar](1) NOT NULL,
	[DEAR6] [nvarchar](1) NULL,
	[/VSO/R_PALHGT] [decimal](13, 3) NULL,
	[/VSO/R_PAL_UL] [nvarchar](3) NULL,
	[/VSO/R_PK_MAT] [nvarchar](1) NULL,
	[/VSO/R_MATPAL] [nvarchar](18) NULL,
	[/VSO/R_I_NO_LYR] [nvarchar](2) NULL,
	[/VSO/R_ONE_MAT] [nvarchar](1) NULL,
	[/VSO/R_ONE_SORT] [nvarchar](1) NULL,
	[/VSO/R_ULD_SIDE] [nvarchar](1) NULL,
	[/VSO/R_LOAD_PREF] [nvarchar](1) NULL,
	[/VSO/R_DPOINT] [nvarchar](10) NULL,
	[ALC] [nvarchar](8) NULL,
	[PMT_OFFICE] [nvarchar](5) NULL,
	[FEE_SCHEDULE] [nvarchar](4) NULL,
	[DUNS] [nvarchar](9) NULL,
	[DUNS4] [nvarchar](4) NULL,
	[PSOFG] [nvarchar](10) NULL,
	[PSOIS] [nvarchar](20) NULL,
	[PSON1] [nvarchar](35) NULL,
	[PSON2] [nvarchar](35) NULL,
	[PSON3] [nvarchar](35) NULL,
	[PSOVN] [nvarchar](35) NULL,
	[PSOTL] [nvarchar](20) NULL,
	[PSOHS] [nvarchar](6) NULL,
	[PSOST] [nvarchar](28) NULL,
	[PSOO1] [nvarchar](50) NULL,
	[PSOO2] [nvarchar](50) NULL,
	[PSOO3] [nvarchar](50) NULL,
	[PSOO4] [nvarchar](50) NULL,
	[PSOO5] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_LAGP]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_LAGP](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[LGTYP] [nvarchar](3) NOT NULL,
	[LGPLA] [nvarchar](10) NOT NULL,
	[LGBER] [nvarchar](3) NULL,
	[LPTYP] [nvarchar](2) NULL,
	[PLAUF] [nvarchar](1) NULL,
	[SKZUA] [nvarchar](1) NULL,
	[SKZUE] [nvarchar](1) NULL,
	[SKZSA] [nvarchar](1) NULL,
	[SKZSE] [nvarchar](1) NULL,
	[SKZSI] [nvarchar](1) NULL,
	[SPGRU] [nvarchar](1) NULL,
	[ANZQU] [decimal](7, 0) NULL,
	[MAXQU] [decimal](7, 0) NULL,
	[ANZLE] [decimal](9, 3) NULL,
	[MAXLE] [decimal](5, 0) NULL,
	[KZDYN] [nvarchar](1) NULL,
	[LGEWI] [decimal](11, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[MGEWI] [decimal](11, 3) NULL,
	[BDATU] [nvarchar](8) NULL,
	[BZEIT] [nvarchar](6) NULL,
	[BTANR] [nvarchar](10) NULL,
	[BTAPS] [nvarchar](4) NULL,
	[RDATU] [nvarchar](8) NULL,
	[RZEIT] [nvarchar](6) NULL,
	[KZINV] [nvarchar](2) NULL,
	[IDATU] [nvarchar](8) NULL,
	[IVNUM] [nvarchar](10) NULL,
	[IVPOS] [nvarchar](4) NULL,
	[IVIVO] [nvarchar](1) NULL,
	[KZLER] [nvarchar](1) NULL,
	[KZVOL] [nvarchar](1) NULL,
	[SORLP] [nvarchar](6) NULL,
	[BRAND] [nvarchar](2) NULL,
	[UNAME] [nvarchar](12) NULL,
	[LAEDT] [nvarchar](8) NULL,
	[LKAPV] [decimal](11, 3) NULL,
	[RKAPV] [decimal](11, 3) NULL,
	[KOBER] [nvarchar](3) NULL,
	[REIHF] [nvarchar](6) NULL,
	[VERIF] [nvarchar](10) NULL,
	[LZONE] [nvarchar](10) NULL,
	[XCORD] [decimal](10, 3) NULL,
	[YCORD] [decimal](10, 3) NULL,
	[ZCORD] [decimal](10, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_LFA1]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_LFA1](
	[MANDT] [nvarchar](3) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[LAND1] [nvarchar](3) NULL,
	[NAME1] [nvarchar](35) NULL,
	[NAME2] [nvarchar](35) NULL,
	[NAME3] [nvarchar](35) NULL,
	[NAME4] [nvarchar](35) NULL,
	[ORT01] [nvarchar](35) NULL,
	[ORT02] [nvarchar](35) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTL2] [nvarchar](10) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[REGIO] [nvarchar](3) NULL,
	[SORTL] [nvarchar](10) NULL,
	[STRAS] [nvarchar](35) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[MCOD1] [nvarchar](25) NULL,
	[MCOD2] [nvarchar](25) NULL,
	[MCOD3] [nvarchar](25) NULL,
	[ANRED] [nvarchar](15) NULL,
	[BAHNS] [nvarchar](25) NULL,
	[BBBNR] [nvarchar](7) NULL,
	[BBSNR] [nvarchar](5) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[BRSCH] [nvarchar](4) NULL,
	[BUBKZ] [nvarchar](1) NULL,
	[DATLT] [nvarchar](14) NULL,
	[DTAMS] [nvarchar](1) NULL,
	[DTAWS] [nvarchar](2) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ESRNR] [nvarchar](11) NULL,
	[KONZS] [nvarchar](10) NULL,
	[KTOKK] [nvarchar](4) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[LNRZA] [nvarchar](10) NULL,
	[LOEVM] [nvarchar](1) NULL,
	[SPERR] [nvarchar](1) NULL,
	[SPERM] [nvarchar](1) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[STCD1] [nvarchar](16) NULL,
	[STCD2] [nvarchar](11) NULL,
	[STKZA] [nvarchar](1) NULL,
	[STKZU] [nvarchar](1) NULL,
	[TELBX] [nvarchar](15) NULL,
	[TELF1] [nvarchar](16) NULL,
	[TELF2] [nvarchar](16) NULL,
	[TELFX] [nvarchar](31) NULL,
	[TELTX] [nvarchar](30) NULL,
	[TELX1] [nvarchar](30) NULL,
	[XCPDK] [nvarchar](1) NULL,
	[XZEMP] [nvarchar](1) NULL,
	[VBUND] [nvarchar](6) NULL,
	[FISKN] [nvarchar](10) NULL,
	[STCEG] [nvarchar](20) NULL,
	[STKZN] [nvarchar](1) NULL,
	[SPERQ] [nvarchar](2) NULL,
	[GBORT] [nvarchar](25) NULL,
	[GBDAT] [nvarchar](8) NULL,
	[SEXKZ] [nvarchar](1) NULL,
	[KRAUS] [nvarchar](11) NULL,
	[REVDB] [nvarchar](8) NULL,
	[QSSYS] [nvarchar](4) NULL,
	[KTOCK] [nvarchar](4) NULL,
	[PFORT] [nvarchar](35) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LTSNA] [nvarchar](1) NULL,
	[WERKR] [nvarchar](1) NULL,
	[PLKAL] [nvarchar](2) NULL,
	[DUEFL] [nvarchar](1) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[SPERZ] [nvarchar](1) NULL,
	[SCACD] [nvarchar](4) NULL,
	[SFRGR] [nvarchar](4) NULL,
	[LZONE] [nvarchar](10) NULL,
	[XLFZA] [nvarchar](1) NULL,
	[DLGRP] [nvarchar](4) NULL,
	[FITYP] [nvarchar](2) NULL,
	[STCDT] [nvarchar](2) NULL,
	[REGSS] [nvarchar](1) NULL,
	[ACTSS] [nvarchar](3) NULL,
	[STCD3] [nvarchar](18) NULL,
	[STCD4] [nvarchar](18) NULL,
	[STCD5] [nvarchar](60) NULL,
	[IPISP] [nvarchar](1) NULL,
	[TAXBS] [nvarchar](1) NULL,
	[PROFS] [nvarchar](30) NULL,
	[STGDL] [nvarchar](2) NULL,
	[EMNFR] [nvarchar](10) NULL,
	[LFURL] [nvarchar](132) NULL,
	[J_1KFREPRE] [nvarchar](10) NULL,
	[J_1KFTBUS] [nvarchar](30) NULL,
	[J_1KFTIND] [nvarchar](30) NULL,
	[CONFS] [nvarchar](1) NOT NULL,
	[UPDAT] [nvarchar](8) NULL,
	[UPTIM] [nvarchar](6) NULL,
	[NODEL] [nvarchar](1) NOT NULL,
	[QSSYSDAT] [nvarchar](8) NULL,
	[PODKZB] [nvarchar](1) NULL,
	[FISKU] [nvarchar](10) NULL,
	[STENR] [nvarchar](18) NULL,
	[CARRIER_CONF] [nvarchar](1) NULL,
	[J_SC_CAPITAL] [decimal](15, 2) NULL,
	[J_SC_CURRENCY] [nvarchar](5) NULL,
	[ALC] [nvarchar](8) NULL,
	[PMT_OFFICE] [nvarchar](5) NULL,
	[PPA_RELEVANT] [nvarchar](1) NULL,
	[PSOFG] [nvarchar](10) NULL,
	[PSOIS] [nvarchar](20) NULL,
	[PSON1] [nvarchar](35) NULL,
	[PSON2] [nvarchar](35) NULL,
	[PSON3] [nvarchar](35) NULL,
	[PSOVN] [nvarchar](35) NULL,
	[PSOTL] [nvarchar](20) NULL,
	[PSOHS] [nvarchar](6) NULL,
	[PSOST] [nvarchar](28) NULL,
	[TRANSPORT_CHAIN] [nvarchar](10) NULL,
	[STAGING_TIME] [decimal](3, 0) NULL,
	[SCHEDULING_TYPE] [nvarchar](1) NULL,
	[SUBMI_RELEVANT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_LIKP]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_LIKP](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERZET] [nvarchar](6) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[BZIRK] [nvarchar](6) NULL,
	[VSTEL] [nvarchar](4) NULL,
	[VKORG] [nvarchar](4) NULL,
	[LFART] [nvarchar](4) NULL,
	[AUTLF] [nvarchar](1) NULL,
	[KZAZU] [nvarchar](1) NULL,
	[WADAT] [nvarchar](8) NULL,
	[LDDAT] [nvarchar](8) NULL,
	[TDDAT] [nvarchar](8) NULL,
	[LFDAT] [nvarchar](8) NULL,
	[KODAT] [nvarchar](8) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[INCO1] [nvarchar](3) NULL,
	[INCO2] [nvarchar](28) NULL,
	[EXPKZ] [nvarchar](1) NULL,
	[ROUTE] [nvarchar](6) NULL,
	[FAKSK] [nvarchar](2) NULL,
	[LIFSK] [nvarchar](2) NULL,
	[VBTYP] [nvarchar](1) NULL,
	[KNFAK] [nvarchar](2) NULL,
	[TPQUA] [nvarchar](1) NULL,
	[TPGRP] [nvarchar](2) NULL,
	[LPRIO] [nvarchar](2) NULL,
	[VSBED] [nvarchar](2) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[KUNAG] [nvarchar](10) NULL,
	[KDGRP] [nvarchar](2) NULL,
	[STZKL] [decimal](3, 2) NULL,
	[STZZU] [decimal](3, 0) NULL,
	[BTGEW] [decimal](15, 3) NULL,
	[NTGEW] [decimal](15, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[VOLUM] [decimal](15, 3) NULL,
	[VOLEH] [nvarchar](3) NULL,
	[ANZPK] [nvarchar](5) NULL,
	[BEROT] [nvarchar](20) NULL,
	[LFUHR] [nvarchar](6) NULL,
	[GRULG] [nvarchar](4) NULL,
	[LSTEL] [nvarchar](2) NULL,
	[TRAGR] [nvarchar](4) NULL,
	[FKARV] [nvarchar](4) NULL,
	[FKDAT] [nvarchar](8) NULL,
	[PERFK] [nvarchar](2) NULL,
	[ROUTA] [nvarchar](6) NULL,
	[STAFO] [nvarchar](6) NULL,
	[KALSM] [nvarchar](6) NULL,
	[KNUMV] [nvarchar](10) NULL,
	[WAERK] [nvarchar](5) NULL,
	[VKBUR] [nvarchar](4) NULL,
	[VBEAK] [decimal](6, 2) NULL,
	[ZUKRL] [nvarchar](40) NULL,
	[VERUR] [nvarchar](35) NULL,
	[COMMN] [nvarchar](5) NULL,
	[STWAE] [nvarchar](5) NULL,
	[STCUR] [decimal](9, 5) NULL,
	[EXNUM] [nvarchar](10) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[LGNUM] [nvarchar](3) NULL,
	[LISPL] [nvarchar](1) NULL,
	[VKOIV] [nvarchar](4) NULL,
	[VTWIV] [nvarchar](2) NULL,
	[SPAIV] [nvarchar](2) NULL,
	[FKAIV] [nvarchar](4) NULL,
	[PIOIV] [nvarchar](2) NULL,
	[FKDIV] [nvarchar](8) NULL,
	[KUNIV] [nvarchar](10) NULL,
	[KKBER] [nvarchar](4) NULL,
	[KNKLI] [nvarchar](10) NULL,
	[GRUPP] [nvarchar](4) NULL,
	[SBGRP] [nvarchar](3) NULL,
	[CTLPC] [nvarchar](3) NULL,
	[CMWAE] [nvarchar](5) NULL,
	[AMTBL] [decimal](15, 2) NULL,
	[BOLNR] [nvarchar](35) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[TRATY] [nvarchar](4) NULL,
	[TRAID] [nvarchar](20) NULL,
	[CMFRE] [nvarchar](8) NULL,
	[CMNGV] [nvarchar](8) NULL,
	[XABLN] [nvarchar](10) NULL,
	[BLDAT] [nvarchar](8) NULL,
	[WADAT_IST] [nvarchar](8) NULL,
	[TRSPG] [nvarchar](2) NULL,
	[TPSID] [nvarchar](5) NULL,
	[LIFEX] [nvarchar](35) NULL,
	[TERNR] [nvarchar](12) NULL,
	[KALSM_CH] [nvarchar](6) NULL,
	[KLIEF] [nvarchar](1) NULL,
	[KALSP] [nvarchar](6) NULL,
	[KNUMP] [nvarchar](10) NULL,
	[NETWR] [decimal](15, 2) NULL,
	[AULWE] [nvarchar](10) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LCNUM] [nvarchar](10) NULL,
	[ABSSC] [nvarchar](6) NULL,
	[KOUHR] [nvarchar](6) NULL,
	[TDUHR] [nvarchar](6) NULL,
	[LDUHR] [nvarchar](6) NULL,
	[WAUHR] [nvarchar](6) NULL,
	[LGTOR] [nvarchar](3) NULL,
	[LGBZO] [nvarchar](10) NULL,
	[AKWAE] [nvarchar](5) NULL,
	[AKKUR] [decimal](9, 5) NULL,
	[AKPRZ] [decimal](5, 2) NULL,
	[PROLI] [nvarchar](3) NULL,
	[XBLNR] [nvarchar](25) NULL,
	[HANDLE] [nvarchar](22) NULL,
	[TSEGFL] [nvarchar](1) NULL,
	[TSEGTP] [nvarchar](10) NULL,
	[TZONIS] [nvarchar](6) NULL,
	[TZONRC] [nvarchar](6) NULL,
	[CONT_DG] [nvarchar](1) NULL,
	[VERURSYS] [nvarchar](10) NULL,
	[KZWAB] [nvarchar](1) NULL,
	[VLSTK] [nvarchar](1) NULL,
	[TCODE] [nvarchar](20) NULL,
	[VSART] [nvarchar](2) NULL,
	[TRMTYP] [nvarchar](18) NULL,
	[SDABW] [nvarchar](4) NULL,
	[VBUND] [nvarchar](6) NULL,
	[XWOFF] [nvarchar](1) NULL,
	[DIRTA] [nvarchar](1) NULL,
	[PRVBE] [nvarchar](10) NULL,
	[FOLAR] [nvarchar](4) NULL,
	[PODAT] [nvarchar](8) NULL,
	[POTIM] [nvarchar](6) NULL,
	[VGANZ] [int] NULL,
	[IMWRK] [nvarchar](1) NULL,
	[SPE_LOEKZ] [nvarchar](1) NULL,
	[SPE_LOC_SEQ] [nvarchar](3) NULL,
	[SPE_ACC_APP_STS] [nvarchar](1) NULL,
	[SPE_SHP_INF_STS] [nvarchar](1) NULL,
	[SPE_RET_CANC] [nvarchar](1) NULL,
	[SPE_WAUHR_IST] [nvarchar](6) NULL,
	[SPE_WAZONE_IST] [nvarchar](6) NULL,
	[SPE_REV_VLSTK] [nvarchar](1) NULL,
	[SPE_LE_SCENARIO] [nvarchar](1) NULL,
	[SPE_ORIG_SYS] [nvarchar](1) NULL,
	[SPE_CHNG_SYS] [nvarchar](1) NULL,
	[SPE_GEOROUTE] [nvarchar](10) NULL,
	[SPE_GEOROUTEIND] [nvarchar](1) NULL,
	[SPE_CARRIER_IND] [nvarchar](1) NULL,
	[SPE_GTS_REL] [nvarchar](2) NULL,
	[SPE_GTS_RT_CDE] [nvarchar](10) NULL,
	[SPE_REL_TMSTMP] [decimal](15, 0) NULL,
	[SPE_UNIT_SYSTEM] [nvarchar](10) NULL,
	[SPE_INV_BFR_GI] [nvarchar](1) NULL,
	[SPE_QI_STATUS] [nvarchar](1) NULL,
	[SPE_RED_IND] [nvarchar](1) NULL,
	[SAKES] [nvarchar](1) NULL,
	[SPE_LIFEX_TYPE] [nvarchar](1) NULL,
	[SPE_TTYPE] [nvarchar](10) NULL,
	[SPE_PRO_NUMBER] [nvarchar](35) NULL,
	[LOC_GUID] [varbinary](16) NULL,
	[SPE_BILLING_IND] [nvarchar](1) NULL,
	[PRINTER_PROFILE] [nvarchar](10) NULL,
	[MSR_ACTIVE] [nvarchar](1) NULL,
	[PRTNR] [nvarchar](10) NULL,
	[STGE_LOC_CHANGE] [nvarchar](1) NULL,
	[TM_CTRL_KEY] [nvarchar](4) NULL,
	[DLV_SPLIT_INITIA] [nvarchar](1) NULL,
	[DLV_VERSION] [nvarchar](4) NULL,
	[/BEV1/LULEINH] [nvarchar](8) NULL,
	[/BEV1/RPFAESS] [decimal](7, 0) NULL,
	[/BEV1/RPKIST] [decimal](7, 0) NULL,
	[/BEV1/RPCONT] [decimal](7, 0) NULL,
	[/BEV1/RPSONST] [decimal](7, 0) NULL,
	[/BEV1/RPFLGNR] [nvarchar](5) NULL,
	[BORGR_GRP] [nvarchar](35) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_LIPS]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_LIPS](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[POSNR] [nvarchar](6) NOT NULL,
	[PSTYV] [nvarchar](4) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERZET] [nvarchar](6) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[MATNR] [nvarchar](18) NULL,
	[MATWA] [nvarchar](18) NULL,
	[MATKL] [nvarchar](9) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[CHARG] [nvarchar](10) NULL,
	[LICHN] [nvarchar](15) NULL,
	[KDMAT] [nvarchar](35) NULL,
	[PRODH] [nvarchar](18) NULL,
	[LFIMG] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[UMVKZ] [decimal](5, 0) NULL,
	[UMVKN] [decimal](5, 0) NULL,
	[NTGEW] [decimal](15, 3) NULL,
	[BRGEW] [decimal](15, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[VOLUM] [decimal](15, 3) NULL,
	[VOLEH] [nvarchar](3) NULL,
	[KZTLF] [nvarchar](1) NULL,
	[UEBTK] [nvarchar](1) NULL,
	[UEBTO] [decimal](3, 1) NULL,
	[UNTTO] [decimal](3, 1) NULL,
	[CHSPL] [nvarchar](1) NULL,
	[FAKSP] [nvarchar](2) NULL,
	[MBDAT] [nvarchar](8) NULL,
	[LGMNG] [decimal](13, 3) NULL,
	[ARKTX] [nvarchar](40) NULL,
	[LGPBE] [nvarchar](10) NULL,
	[VBELV] [nvarchar](10) NULL,
	[POSNV] [nvarchar](6) NULL,
	[VBTYV] [nvarchar](1) NULL,
	[VGSYS] [nvarchar](10) NULL,
	[VGBEL] [nvarchar](10) NULL,
	[VGPOS] [nvarchar](6) NULL,
	[UPFLU] [nvarchar](1) NULL,
	[UEPOS] [nvarchar](6) NULL,
	[FKREL] [nvarchar](1) NULL,
	[LADGR] [nvarchar](4) NULL,
	[TRAGR] [nvarchar](4) NULL,
	[KOMKZ] [nvarchar](1) NULL,
	[LGNUM] [nvarchar](3) NULL,
	[LISPL] [nvarchar](1) NULL,
	[LGTYP] [nvarchar](3) NULL,
	[LGPLA] [nvarchar](10) NULL,
	[BWTEX] [nvarchar](1) NULL,
	[BWART] [nvarchar](3) NULL,
	[BWLVS] [nvarchar](3) NULL,
	[KZDLG] [nvarchar](1) NULL,
	[BDART] [nvarchar](2) NULL,
	[PLART] [nvarchar](1) NULL,
	[MTART] [nvarchar](4) NULL,
	[XCHPF] [nvarchar](1) NULL,
	[XCHAR] [nvarchar](1) NULL,
	[VGREF] [nvarchar](1) NULL,
	[POSAR] [nvarchar](1) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[SUMBD] [nvarchar](1) NULL,
	[MTVFP] [nvarchar](2) NULL,
	[EANNR] [nvarchar](13) NULL,
	[GSBER] [nvarchar](4) NULL,
	[VKBUR] [nvarchar](4) NULL,
	[VKGRP] [nvarchar](3) NULL,
	[VTWEG] [nvarchar](2) NULL,
	[SPART] [nvarchar](2) NULL,
	[GRKOR] [nvarchar](3) NULL,
	[FMENG] [nvarchar](1) NULL,
	[ANTLF] [decimal](1, 0) NULL,
	[VBEAF] [decimal](5, 2) NULL,
	[VBEAV] [decimal](5, 2) NULL,
	[STAFO] [nvarchar](6) NULL,
	[WAVWR] [decimal](13, 2) NULL,
	[KZWI1] [decimal](13, 2) NULL,
	[KZWI2] [decimal](13, 2) NULL,
	[KZWI3] [decimal](13, 2) NULL,
	[KZWI4] [decimal](13, 2) NULL,
	[KZWI5] [decimal](13, 2) NULL,
	[KZWI6] [decimal](13, 2) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[EAN11] [nvarchar](18) NULL,
	[KVGR1] [nvarchar](3) NULL,
	[KVGR2] [nvarchar](3) NULL,
	[KVGR3] [nvarchar](3) NULL,
	[KVGR4] [nvarchar](3) NULL,
	[KVGR5] [nvarchar](3) NULL,
	[MVGR1] [nvarchar](3) NULL,
	[MVGR2] [nvarchar](3) NULL,
	[MVGR3] [nvarchar](3) NULL,
	[MVGR4] [nvarchar](3) NULL,
	[MVGR5] [nvarchar](3) NULL,
	[VPZUO] [nvarchar](1) NULL,
	[VGTYP] [nvarchar](1) NULL,
	[RFVGTYP] [nvarchar](1) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[PAOBJNR] [nvarchar](10) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[POSNR_PP] [nvarchar](4) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[VPMAT] [nvarchar](18) NULL,
	[VPWRK] [nvarchar](4) NULL,
	[PRBME] [nvarchar](3) NULL,
	[UMREF] [float] NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[FISTL] [nvarchar](16) NULL,
	[GEBER] [nvarchar](10) NULL,
	[PCKPF] [nvarchar](1) NULL,
	[BEDAR_LF] [nvarchar](3) NULL,
	[CMPNT] [nvarchar](1) NULL,
	[KCMENG] [decimal](15, 3) NULL,
	[KCBRGEW] [decimal](15, 3) NULL,
	[KCNTGEW] [decimal](15, 3) NULL,
	[KCVOLUM] [decimal](15, 3) NULL,
	[UECHA] [nvarchar](6) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[CUOBJ_CH] [nvarchar](18) NULL,
	[ANZSN] [int] NULL,
	[SERAIL] [nvarchar](4) NULL,
	[KCGEWEI] [nvarchar](3) NULL,
	[KCVOLEH] [nvarchar](3) NULL,
	[SERNR] [nvarchar](8) NULL,
	[ABRLI] [nvarchar](4) NULL,
	[ABART] [nvarchar](1) NULL,
	[ABRVW] [nvarchar](3) NULL,
	[QPLOS] [nvarchar](12) NULL,
	[QTLOS] [nvarchar](6) NULL,
	[NACHL] [nvarchar](1) NULL,
	[MAGRV] [nvarchar](4) NULL,
	[OBJKO] [nvarchar](22) NULL,
	[OBJPO] [nvarchar](22) NULL,
	[AESKD] [nvarchar](17) NULL,
	[SHKZG] [nvarchar](1) NULL,
	[PROSA] [nvarchar](1) NULL,
	[UEPVW] [nvarchar](1) NULL,
	[EMPST] [nvarchar](25) NULL,
	[ABTNR] [nvarchar](4) NULL,
	[KOQUI] [nvarchar](1) NULL,
	[STADAT] [nvarchar](8) NULL,
	[AKTNR] [nvarchar](10) NULL,
	[KNUMH_CH] [nvarchar](10) NULL,
	[PREFE] [nvarchar](1) NULL,
	[EXART] [nvarchar](2) NULL,
	[CLINT] [nvarchar](10) NULL,
	[CHMVS] [nvarchar](3) NULL,
	[ABELN] [nvarchar](10) NULL,
	[ABELP] [nvarchar](5) NULL,
	[LFIMG_FLO] [float] NULL,
	[LGMNG_FLO] [float] NULL,
	[KCMENG_FLO] [float] NULL,
	[KZUMW] [nvarchar](1) NULL,
	[KMPMG] [decimal](13, 3) NULL,
	[AUREL] [nvarchar](1) NULL,
	[KPEIN] [decimal](5, 0) NULL,
	[KMEIN] [nvarchar](3) NULL,
	[NETPR] [decimal](11, 2) NULL,
	[NETWR] [decimal](15, 2) NULL,
	[KOWRR] [nvarchar](1) NULL,
	[KZBEW] [nvarchar](1) NULL,
	[MFRGR] [nvarchar](8) NULL,
	[CHHPV] [nvarchar](1) NULL,
	[ABFOR] [nvarchar](2) NULL,
	[ABGES] [float] NULL,
	[MBUHR] [nvarchar](6) NULL,
	[WKTNR] [nvarchar](10) NULL,
	[WKTPS] [nvarchar](6) NULL,
	[J_1BCFOP] [nvarchar](10) NULL,
	[J_1BTAXLW1] [nvarchar](3) NULL,
	[J_1BTAXLW2] [nvarchar](3) NULL,
	[J_1BTXSDC] [nvarchar](2) NULL,
	[SITUA] [nvarchar](2) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[RSPOS] [nvarchar](4) NULL,
	[RSART] [nvarchar](1) NULL,
	[KANNR] [nvarchar](35) NULL,
	[KZFME] [nvarchar](1) NULL,
	[PROFL] [nvarchar](3) NULL,
	[KCMENGVME] [decimal](15, 3) NULL,
	[KCMENGVMEF] [float] NULL,
	[KZBWS] [nvarchar](1) NULL,
	[PSPNR] [nvarchar](8) NULL,
	[EPRIO] [nvarchar](4) NULL,
	[RULES] [nvarchar](4) NULL,
	[KZBEF] [nvarchar](1) NULL,
	[MPROF] [nvarchar](4) NULL,
	[EMATN] [nvarchar](18) NULL,
	[LGBZO] [nvarchar](10) NULL,
	[HANDLE] [nvarchar](22) NULL,
	[VERURPOS] [nvarchar](6) NULL,
	[LIFEXPOS] [nvarchar](6) NULL,
	[NOATP] [nvarchar](1) NULL,
	[NOPCK] [nvarchar](1) NULL,
	[RBLVS] [nvarchar](3) NULL,
	[BERID] [nvarchar](10) NULL,
	[BESTQ] [nvarchar](1) NULL,
	[UMBSQ] [nvarchar](1) NULL,
	[UMMAT] [nvarchar](18) NULL,
	[UMWRK] [nvarchar](4) NULL,
	[UMLGO] [nvarchar](4) NULL,
	[UMCHA] [nvarchar](10) NULL,
	[UMBAR] [nvarchar](10) NULL,
	[UMSOK] [nvarchar](1) NULL,
	[SONUM] [nvarchar](16) NULL,
	[USONU] [nvarchar](16) NULL,
	[AKKUR] [decimal](9, 5) NULL,
	[AKMNG] [nvarchar](1) NULL,
	[VKGRU] [nvarchar](3) NULL,
	[SHKZG_UM] [nvarchar](1) NULL,
	[INSMK] [nvarchar](1) NULL,
	[KZECH] [nvarchar](1) NULL,
	[FLGWM] [nvarchar](1) NULL,
	[BERKZ] [nvarchar](1) NULL,
	[HUPOS] [nvarchar](1) NULL,
	[NOWAB] [nvarchar](1) NULL,
	[KONTO] [nvarchar](10) NULL,
	[KZEAR] [nvarchar](1) NULL,
	[HSDAT] [nvarchar](8) NULL,
	[VFDAT] [nvarchar](8) NULL,
	[LFGJA] [nvarchar](4) NULL,
	[LFBNR] [nvarchar](10) NULL,
	[LFPOS] [nvarchar](4) NULL,
	[GRUND] [nvarchar](4) NULL,
	[FOBWA] [nvarchar](3) NULL,
	[DLVTP] [nvarchar](2) NULL,
	[EXBWR] [decimal](13, 2) NULL,
	[BPMNG] [decimal](13, 3) NULL,
	[EXVKW] [decimal](13, 2) NULL,
	[CMPRE_FLT] [float] NULL,
	[KZPOD] [nvarchar](1) NULL,
	[LFDEZ] [nvarchar](1) NULL,
	[UMREV] [float] NULL,
	[PODREL] [nvarchar](1) NULL,
	[KZUML] [nvarchar](1) NULL,
	[FKBER] [nvarchar](16) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[KZWSO] [nvarchar](1) NULL,
	[GMCONTROL] [nvarchar](1) NULL,
	[POSTING_CHANGE] [nvarchar](1) NULL,
	[UM_PS_PSP_PNR] [nvarchar](8) NULL,
	[PRE_VL_ETENS] [nvarchar](4) NULL,
	[SPE_GEN_ELIKZ] [nvarchar](1) NULL,
	[SPE_SCRAP_IND] [nvarchar](1) NULL,
	[SPE_AUTH_NUMBER] [nvarchar](20) NULL,
	[SPE_INSPOUT_GUID] [varbinary](16) NULL,
	[SPE_FOLLOW_UP] [nvarchar](4) NULL,
	[SPE_EXP_DATE_EXT] [decimal](15, 0) NULL,
	[SPE_EXP_DATE_INT] [decimal](15, 0) NULL,
	[SPE_AUTH_COMPLET] [nvarchar](1) NULL,
	[ORMNG] [decimal](13, 3) NULL,
	[SPE_ATP_TMSTMP] [decimal](15, 0) NULL,
	[SPE_ORIG_SYS] [nvarchar](1) NULL,
	[SPE_LIEFFZ] [decimal](15, 3) NULL,
	[SPE_IMWRK] [nvarchar](1) NULL,
	[SPE_LIFEXPOS2] [nvarchar](35) NULL,
	[SPE_EXCEPT_CODE] [nvarchar](4) NULL,
	[SPE_KEEP_QTY] [decimal](13, 3) NULL,
	[SPE_ALTERNATE] [nvarchar](40) NULL,
	[SPE_MAT_SUBST] [nvarchar](1) NULL,
	[SPE_STRUC] [nvarchar](3) NULL,
	[SPE_APO_QNTYFAC] [decimal](5, 0) NULL,
	[SPE_APO_QNTYDIV] [decimal](5, 0) NULL,
	[SPE_HERKL] [nvarchar](3) NULL,
	[SPE_BXP_DATE_EXT] [decimal](15, 0) NULL,
	[SPE_VERSION] [nvarchar](4) NULL,
	[SPE_COMPL_MVT] [nvarchar](1) NULL,
	[J_1BTAXLW4] [nvarchar](3) NULL,
	[J_1BTAXLW5] [nvarchar](3) NULL,
	[J_1BTAXLW3] [nvarchar](3) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[KBNKZ] [nvarchar](1) NULL,
	[SITKZ] [nvarchar](1) NULL,
	[CONS_ORDER] [nvarchar](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_LTBK]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_LTBK](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[TBNUM] [nvarchar](10) NOT NULL,
	[STATU] [nvarchar](1) NULL,
	[TRART] [nvarchar](1) NULL,
	[TBPRI] [nvarchar](1) NULL,
	[BNAME] [nvarchar](12) NULL,
	[BDATU] [nvarchar](8) NULL,
	[BZEIT] [nvarchar](6) NULL,
	[TBKTX] [nvarchar](40) NULL,
	[BETYP] [nvarchar](1) NULL,
	[BENUM] [nvarchar](10) NULL,
	[BWART] [nvarchar](3) NULL,
	[BWLVS] [nvarchar](3) NULL,
	[VLTYP] [nvarchar](3) NULL,
	[VLPLA] [nvarchar](10) NULL,
	[VKDYN] [nvarchar](1) NULL,
	[NLTYP] [nvarchar](3) NULL,
	[NLPLA] [nvarchar](10) NULL,
	[NKDYN] [nvarchar](1) NULL,
	[PDATU] [nvarchar](8) NULL,
	[PZEIT] [nvarchar](6) NULL,
	[MBLNR] [nvarchar](10) NULL,
	[MJAHR] [nvarchar](4) NULL,
	[ANZPS] [decimal](4, 0) NULL,
	[BRGEW] [decimal](11, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[KLFR2] [nvarchar](1) NULL,
	[KFAR2] [nvarchar](1) NULL,
	[TBRUE] [nvarchar](1) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[LZNUM] [nvarchar](20) NULL,
	[AUTTA] [nvarchar](1) NULL,
	[BDART] [nvarchar](2) NULL,
	[PKNUM] [nvarchar](7) NULL,
	[PKPOS] [nvarchar](3) NULL,
	[DIRTA] [nvarchar](1) NULL,
	[KBNKZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MARA]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MARA](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[ERSDA] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[LAEDA] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[VPSTA] [nvarchar](15) NULL,
	[PSTAT] [nvarchar](15) NULL,
	[LVORM] [nvarchar](1) NULL,
	[MTART] [nvarchar](4) NULL,
	[MBRSH] [nvarchar](1) NULL,
	[MATKL] [nvarchar](9) NULL,
	[BISMT] [nvarchar](18) NULL,
	[MEINS] [nvarchar](3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[ZEINR] [nvarchar](22) NULL,
	[ZEIAR] [nvarchar](3) NULL,
	[ZEIVR] [nvarchar](2) NULL,
	[ZEIFO] [nvarchar](4) NULL,
	[AESZN] [nvarchar](6) NULL,
	[BLATT] [nvarchar](3) NULL,
	[BLANZ] [nvarchar](3) NULL,
	[FERTH] [nvarchar](18) NULL,
	[FORMT] [nvarchar](4) NULL,
	[GROES] [nvarchar](32) NULL,
	[WRKST] [nvarchar](48) NULL,
	[NORMT] [nvarchar](18) NULL,
	[LABOR] [nvarchar](3) NULL,
	[EKWSL] [nvarchar](4) NULL,
	[BRGEW] [decimal](13, 3) NULL,
	[NTGEW] [decimal](13, 3) NULL,
	[GEWEI] [nvarchar](3) NULL,
	[VOLUM] [decimal](13, 3) NULL,
	[VOLEH] [nvarchar](3) NULL,
	[BEHVO] [nvarchar](2) NULL,
	[RAUBE] [nvarchar](2) NULL,
	[TEMPB] [nvarchar](2) NULL,
	[DISST] [nvarchar](3) NULL,
	[TRAGR] [nvarchar](4) NULL,
	[STOFF] [nvarchar](18) NULL,
	[SPART] [nvarchar](2) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[EANNR] [nvarchar](13) NULL,
	[WESCH] [decimal](13, 3) NULL,
	[BWVOR] [nvarchar](1) NULL,
	[BWSCL] [nvarchar](1) NULL,
	[SAISO] [nvarchar](4) NULL,
	[ETIAR] [nvarchar](2) NULL,
	[ETIFO] [nvarchar](2) NULL,
	[ENTAR] [nvarchar](1) NULL,
	[EAN11] [nvarchar](18) NULL,
	[NUMTP] [nvarchar](2) NULL,
	[LAENG] [decimal](13, 3) NULL,
	[BREIT] [decimal](13, 3) NULL,
	[HOEHE] [decimal](13, 3) NULL,
	[MEABM] [nvarchar](3) NULL,
	[PRDHA] [nvarchar](18) NULL,
	[AEKLK] [nvarchar](1) NULL,
	[CADKZ] [nvarchar](1) NULL,
	[QMPUR] [nvarchar](1) NULL,
	[ERGEW] [decimal](13, 3) NULL,
	[ERGEI] [nvarchar](3) NULL,
	[ERVOL] [decimal](13, 3) NULL,
	[ERVOE] [nvarchar](3) NULL,
	[GEWTO] [decimal](3, 1) NULL,
	[VOLTO] [decimal](3, 1) NULL,
	[VABME] [nvarchar](1) NULL,
	[KZREV] [nvarchar](1) NULL,
	[KZKFG] [nvarchar](1) NULL,
	[XCHPF] [nvarchar](1) NULL,
	[VHART] [nvarchar](4) NULL,
	[FUELG] [decimal](3, 0) NULL,
	[STFAK] [smallint] NULL,
	[MAGRV] [nvarchar](4) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[DATAB] [nvarchar](8) NULL,
	[LIQDT] [nvarchar](8) NULL,
	[SAISJ] [nvarchar](4) NULL,
	[PLGTP] [nvarchar](2) NULL,
	[MLGUT] [nvarchar](1) NULL,
	[EXTWG] [nvarchar](18) NULL,
	[SATNR] [nvarchar](18) NULL,
	[ATTYP] [nvarchar](2) NULL,
	[KZKUP] [nvarchar](1) NULL,
	[KZNFM] [nvarchar](1) NULL,
	[PMATA] [nvarchar](18) NULL,
	[MSTAE] [nvarchar](2) NULL,
	[MSTAV] [nvarchar](2) NULL,
	[MSTDE] [nvarchar](8) NULL,
	[MSTDV] [nvarchar](8) NULL,
	[TAKLV] [nvarchar](1) NULL,
	[RBNRM] [nvarchar](9) NULL,
	[MHDRZ] [decimal](4, 0) NULL,
	[MHDHB] [decimal](4, 0) NULL,
	[MHDLP] [decimal](3, 0) NULL,
	[INHME] [nvarchar](3) NULL,
	[INHAL] [decimal](13, 3) NULL,
	[VPREH] [decimal](5, 0) NULL,
	[ETIAG] [nvarchar](18) NULL,
	[INHBR] [decimal](13, 3) NULL,
	[CMETH] [nvarchar](1) NULL,
	[CUOBF] [nvarchar](18) NULL,
	[KZUMW] [nvarchar](1) NULL,
	[KOSCH] [nvarchar](18) NULL,
	[SPROF] [nvarchar](1) NULL,
	[NRFHG] [nvarchar](1) NULL,
	[MFRPN] [nvarchar](40) NULL,
	[MFRNR] [nvarchar](10) NULL,
	[BMATN] [nvarchar](18) NULL,
	[MPROF] [nvarchar](4) NULL,
	[KZWSM] [nvarchar](1) NULL,
	[SAITY] [nvarchar](2) NULL,
	[PROFL] [nvarchar](3) NULL,
	[IHIVI] [nvarchar](1) NULL,
	[ILOOS] [nvarchar](1) NULL,
	[SERLV] [nvarchar](1) NULL,
	[KZGVH] [nvarchar](1) NULL,
	[XGCHP] [nvarchar](1) NULL,
	[KZEFF] [nvarchar](1) NULL,
	[COMPL] [nvarchar](2) NULL,
	[IPRKZ] [nvarchar](1) NULL,
	[RDMHD] [nvarchar](1) NULL,
	[PRZUS] [nvarchar](1) NULL,
	[MTPOS_MARA] [nvarchar](4) NULL,
	[BFLME] [nvarchar](1) NULL,
	[MATFI] [nvarchar](1) NULL,
	[CMREL] [nvarchar](1) NULL,
	[BBTYP] [nvarchar](1) NULL,
	[SLED_BBD] [nvarchar](1) NULL,
	[GTIN_VARIANT] [nvarchar](2) NULL,
	[GENNR] [nvarchar](18) NULL,
	[RMATP] [nvarchar](18) NULL,
	[GDS_RELEVANT] [nvarchar](1) NULL,
	[WEORA] [nvarchar](1) NULL,
	[HUTYP_DFLT] [nvarchar](4) NULL,
	[PILFERABLE] [nvarchar](1) NULL,
	[WHSTC] [nvarchar](2) NULL,
	[WHMATGR] [nvarchar](4) NULL,
	[HNDLCODE] [nvarchar](4) NULL,
	[HAZMAT] [nvarchar](1) NULL,
	[HUTYP] [nvarchar](4) NULL,
	[TARE_VAR] [nvarchar](1) NULL,
	[MAXC] [decimal](15, 3) NULL,
	[MAXC_TOL] [decimal](3, 1) NULL,
	[MAXL] [decimal](15, 3) NULL,
	[MAXB] [decimal](15, 3) NULL,
	[MAXH] [decimal](15, 3) NULL,
	[MAXDIM_UOM] [nvarchar](3) NULL,
	[HERKL] [nvarchar](3) NULL,
	[MFRGR] [nvarchar](8) NULL,
	[QQTIME] [decimal](3, 0) NULL,
	[QQTIMEUOM] [nvarchar](3) NULL,
	[QGRP] [nvarchar](4) NULL,
	[SERIAL] [nvarchar](4) NULL,
	[PS_SMARTFORM] [nvarchar](30) NULL,
	[LOGUNIT] [nvarchar](3) NULL,
	[CWQREL] [nvarchar](1) NULL,
	[CWQPROC] [nvarchar](2) NULL,
	[CWQTOLGR] [nvarchar](9) NULL,
	[ADPROF] [nvarchar](3) NULL,
	[IPMIPPRODUCT] [nvarchar](40) NULL,
	[ALLOW_PMAT_IGNO] [nvarchar](1) NULL,
	[MEDIUM] [nvarchar](6) NULL,
	[/BEV1/LULEINH] [nvarchar](8) NULL,
	[/BEV1/LULDEGRP] [nvarchar](3) NULL,
	[/BEV1/NESTRUCCAT] [nvarchar](1) NULL,
	[/DSD/SL_TOLTYP] [nvarchar](4) NULL,
	[/DSD/SV_CNT_GRP] [nvarchar](10) NULL,
	[/DSD/VC_GROUP] [nvarchar](6) NULL,
	[/VSO/R_TILT_IND] [nvarchar](1) NULL,
	[/VSO/R_STACK_IND] [nvarchar](1) NULL,
	[/VSO/R_BOT_IND] [nvarchar](1) NULL,
	[/VSO/R_TOP_IND] [nvarchar](1) NULL,
	[/VSO/R_STACK_NO] [nvarchar](3) NULL,
	[/VSO/R_PAL_IND] [nvarchar](1) NULL,
	[/VSO/R_PAL_OVR_D] [decimal](13, 3) NULL,
	[/VSO/R_PAL_OVR_W] [decimal](13, 3) NULL,
	[/VSO/R_PAL_B_HT] [decimal](13, 3) NULL,
	[/VSO/R_PAL_MIN_H] [decimal](13, 3) NULL,
	[/VSO/R_TOL_B_HT] [decimal](13, 3) NULL,
	[/VSO/R_NO_P_GVH] [nvarchar](2) NULL,
	[/VSO/R_QUAN_UNIT] [nvarchar](3) NULL,
	[/VSO/R_KZGVH_IND] [nvarchar](1) NULL,
	[PACKCODE] [nvarchar](10) NULL,
	[DG_PACK_STATUS] [nvarchar](10) NULL,
	[MCOND] [nvarchar](1) NULL,
	[RETDELC] [nvarchar](1) NULL,
	[LOGLEV_RETO] [nvarchar](1) NULL,
	[NSNID] [nvarchar](9) NULL,
	[ADSPC_SPC] [nvarchar](1) NULL,
	[IMATN] [nvarchar](18) NULL,
	[PICNUM] [nvarchar](18) NULL,
	[BSTAT] [nvarchar](2) NULL,
	[COLOR_ATINN] [nvarchar](10) NULL,
	[SIZE1_ATINN] [nvarchar](10) NULL,
	[SIZE2_ATINN] [nvarchar](10) NULL,
	[COLOR] [nvarchar](18) NULL,
	[SIZE1] [nvarchar](18) NULL,
	[SIZE2] [nvarchar](18) NULL,
	[FREE_CHAR] [nvarchar](18) NULL,
	[CARE_CODE] [nvarchar](16) NULL,
	[BRAND_ID] [nvarchar](4) NULL,
	[FIBER_CODE1] [nvarchar](3) NULL,
	[FIBER_PART1] [nvarchar](3) NULL,
	[FIBER_CODE2] [nvarchar](3) NULL,
	[FIBER_PART2] [nvarchar](3) NULL,
	[FIBER_CODE3] [nvarchar](3) NULL,
	[FIBER_PART3] [nvarchar](3) NULL,
	[FIBER_CODE4] [nvarchar](3) NULL,
	[FIBER_PART4] [nvarchar](3) NULL,
	[FIBER_CODE5] [nvarchar](3) NULL,
	[FIBER_PART5] [nvarchar](3) NULL,
	[FASHGRD] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MARC]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MARC](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PSTAT] [nvarchar](15) NULL,
	[LVORM] [nvarchar](1) NULL,
	[BWTTY] [nvarchar](1) NULL,
	[XCHAR] [nvarchar](1) NULL,
	[MMSTA] [nvarchar](2) NULL,
	[MMSTD] [nvarchar](8) NULL,
	[MAABC] [nvarchar](1) NULL,
	[KZKRI] [nvarchar](1) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[AUSME] [nvarchar](3) NULL,
	[DISPR] [nvarchar](4) NULL,
	[DISMM] [nvarchar](2) NULL,
	[DISPO] [nvarchar](3) NULL,
	[KZDIE] [nvarchar](1) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[PERKZ] [nvarchar](1) NULL,
	[AUSSS] [decimal](5, 2) NULL,
	[DISLS] [nvarchar](2) NULL,
	[BESKZ] [nvarchar](1) NULL,
	[SOBSL] [nvarchar](2) NULL,
	[MINBE] [decimal](13, 3) NULL,
	[EISBE] [decimal](13, 3) NULL,
	[BSTMI] [decimal](13, 3) NULL,
	[BSTMA] [decimal](13, 3) NULL,
	[BSTFE] [decimal](13, 3) NULL,
	[BSTRF] [decimal](13, 3) NULL,
	[MABST] [decimal](13, 3) NULL,
	[LOSFX] [decimal](11, 2) NULL,
	[SBDKZ] [nvarchar](1) NULL,
	[LAGPR] [nvarchar](1) NULL,
	[ALTSL] [nvarchar](1) NULL,
	[KZAUS] [nvarchar](1) NULL,
	[AUSDT] [nvarchar](8) NULL,
	[NFMAT] [nvarchar](18) NULL,
	[KZBED] [nvarchar](1) NULL,
	[MISKZ] [nvarchar](1) NULL,
	[FHORI] [nvarchar](3) NULL,
	[PFREI] [nvarchar](1) NULL,
	[FFREI] [nvarchar](1) NULL,
	[RGEKZ] [nvarchar](1) NULL,
	[FEVOR] [nvarchar](3) NULL,
	[BEARZ] [decimal](5, 2) NULL,
	[RUEZT] [decimal](5, 2) NULL,
	[TRANZ] [decimal](5, 2) NULL,
	[BASMG] [decimal](13, 3) NULL,
	[DZEIT] [decimal](3, 0) NULL,
	[MAXLZ] [decimal](5, 0) NULL,
	[LZEIH] [nvarchar](3) NULL,
	[KZPRO] [nvarchar](1) NULL,
	[GPMKZ] [nvarchar](1) NULL,
	[UEETO] [decimal](3, 1) NULL,
	[UEETK] [nvarchar](1) NULL,
	[UNETO] [decimal](3, 1) NULL,
	[WZEIT] [decimal](3, 0) NULL,
	[ATPKZ] [nvarchar](1) NULL,
	[VZUSL] [decimal](5, 2) NULL,
	[HERBL] [nvarchar](2) NULL,
	[INSMK] [nvarchar](1) NULL,
	[SPROZ] [decimal](3, 1) NULL,
	[QUAZT] [decimal](3, 0) NULL,
	[SSQSS] [nvarchar](8) NULL,
	[MPDAU] [decimal](5, 0) NULL,
	[KZPPV] [nvarchar](1) NULL,
	[KZDKZ] [nvarchar](1) NULL,
	[WSTGH] [decimal](9, 0) NULL,
	[PRFRQ] [decimal](5, 0) NULL,
	[NKMPR] [nvarchar](8) NULL,
	[UMLMC] [decimal](13, 3) NULL,
	[LADGR] [nvarchar](4) NULL,
	[XCHPF] [nvarchar](1) NULL,
	[USEQU] [nvarchar](1) NULL,
	[LGRAD] [decimal](3, 1) NULL,
	[AUFTL] [nvarchar](1) NULL,
	[PLVAR] [nvarchar](2) NULL,
	[OTYPE] [nvarchar](2) NULL,
	[OBJID] [nvarchar](8) NULL,
	[MTVFP] [nvarchar](2) NULL,
	[PERIV] [nvarchar](2) NULL,
	[KZKFK] [nvarchar](1) NULL,
	[VRVEZ] [decimal](5, 2) NULL,
	[VBAMG] [decimal](13, 3) NULL,
	[VBEAZ] [decimal](5, 2) NULL,
	[LIZYK] [nvarchar](4) NULL,
	[BWSCL] [nvarchar](1) NULL,
	[KAUTB] [nvarchar](1) NULL,
	[KORDB] [nvarchar](1) NULL,
	[STAWN] [nvarchar](17) NULL,
	[HERKL] [nvarchar](3) NULL,
	[HERKR] [nvarchar](3) NULL,
	[EXPME] [nvarchar](3) NULL,
	[MTVER] [nvarchar](4) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[TRAME] [decimal](13, 3) NULL,
	[MRPPP] [nvarchar](3) NULL,
	[SAUFT] [nvarchar](1) NULL,
	[FXHOR] [nvarchar](3) NULL,
	[VRMOD] [nvarchar](1) NULL,
	[VINT1] [nvarchar](3) NULL,
	[VINT2] [nvarchar](3) NULL,
	[VERKZ] [nvarchar](1) NULL,
	[STLAL] [nvarchar](2) NULL,
	[STLAN] [nvarchar](1) NULL,
	[PLNNR] [nvarchar](8) NULL,
	[APLAL] [nvarchar](2) NULL,
	[LOSGR] [decimal](13, 3) NULL,
	[SOBSK] [nvarchar](2) NULL,
	[FRTME] [nvarchar](3) NULL,
	[LGPRO] [nvarchar](4) NULL,
	[DISGR] [nvarchar](4) NULL,
	[KAUSF] [decimal](5, 2) NULL,
	[QZGTP] [nvarchar](4) NULL,
	[QMATV] [nvarchar](1) NULL,
	[TAKZT] [decimal](3, 0) NULL,
	[RWPRO] [nvarchar](3) NULL,
	[COPAM] [nvarchar](10) NULL,
	[ABCIN] [nvarchar](1) NULL,
	[AWSLS] [nvarchar](6) NULL,
	[SERNP] [nvarchar](4) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[STDPD] [nvarchar](18) NULL,
	[SFEPR] [nvarchar](4) NULL,
	[XMCNG] [nvarchar](1) NULL,
	[QSSYS] [nvarchar](4) NULL,
	[LFRHY] [nvarchar](3) NULL,
	[RDPRF] [nvarchar](4) NULL,
	[VRBMT] [nvarchar](18) NULL,
	[VRBWK] [nvarchar](4) NULL,
	[VRBDT] [nvarchar](8) NULL,
	[VRBFK] [decimal](4, 2) NULL,
	[AUTRU] [nvarchar](1) NULL,
	[PREFE] [nvarchar](1) NULL,
	[PRENC] [nvarchar](1) NULL,
	[PRENO] [nvarchar](8) NULL,
	[PREND] [nvarchar](8) NULL,
	[PRENE] [nvarchar](1) NULL,
	[PRENG] [nvarchar](8) NULL,
	[ITARK] [nvarchar](1) NULL,
	[SERVG] [nvarchar](1) NULL,
	[KZKUP] [nvarchar](1) NULL,
	[STRGR] [nvarchar](2) NULL,
	[CUOBV] [nvarchar](18) NULL,
	[LGFSB] [nvarchar](4) NULL,
	[SCHGT] [nvarchar](1) NULL,
	[CCFIX] [nvarchar](1) NULL,
	[EPRIO] [nvarchar](4) NULL,
	[QMATA] [nvarchar](6) NULL,
	[RESVP] [decimal](3, 0) NULL,
	[PLNTY] [nvarchar](1) NULL,
	[UOMGR] [nvarchar](3) NULL,
	[UMRSL] [nvarchar](4) NULL,
	[ABFAC] [decimal](2, 1) NULL,
	[SFCPF] [nvarchar](6) NULL,
	[SHFLG] [nvarchar](1) NULL,
	[SHZET] [nvarchar](2) NULL,
	[MDACH] [nvarchar](2) NULL,
	[KZECH] [nvarchar](1) NULL,
	[MEGRU] [nvarchar](4) NULL,
	[MFRGR] [nvarchar](8) NULL,
	[VKUMC] [decimal](13, 2) NULL,
	[VKTRW] [decimal](13, 2) NULL,
	[KZAGL] [nvarchar](1) NULL,
	[FVIDK] [nvarchar](4) NULL,
	[FXPRU] [nvarchar](1) NULL,
	[LOGGR] [nvarchar](4) NULL,
	[FPRFM] [nvarchar](3) NULL,
	[GLGMG] [decimal](13, 3) NULL,
	[VKGLG] [decimal](13, 2) NULL,
	[INDUS] [nvarchar](2) NULL,
	[MOWNR] [nvarchar](12) NULL,
	[MOGRU] [nvarchar](6) NULL,
	[CASNR] [nvarchar](15) NULL,
	[GPNUM] [nvarchar](9) NULL,
	[STEUC] [nvarchar](16) NULL,
	[FABKZ] [nvarchar](1) NULL,
	[MATGR] [nvarchar](20) NULL,
	[VSPVB] [nvarchar](10) NULL,
	[DPLFS] [nvarchar](2) NULL,
	[DPLPU] [nvarchar](1) NULL,
	[DPLHO] [decimal](3, 0) NULL,
	[MINLS] [decimal](13, 3) NULL,
	[MAXLS] [decimal](13, 3) NULL,
	[FIXLS] [decimal](13, 3) NULL,
	[LTINC] [decimal](13, 3) NULL,
	[COMPL] [nvarchar](2) NULL,
	[CONVT] [nvarchar](2) NULL,
	[SHPRO] [nvarchar](3) NULL,
	[AHDIS] [nvarchar](1) NULL,
	[DIBER] [nvarchar](1) NULL,
	[KZPSP] [nvarchar](1) NULL,
	[OCMPF] [nvarchar](6) NULL,
	[APOKZ] [nvarchar](1) NULL,
	[MCRUE] [nvarchar](1) NULL,
	[LFMON] [nvarchar](2) NULL,
	[LFGJA] [nvarchar](4) NULL,
	[EISLO] [decimal](13, 3) NULL,
	[NCOST] [nvarchar](1) NULL,
	[ROTATION_DATE] [nvarchar](1) NULL,
	[UCHKZ] [nvarchar](1) NULL,
	[UCMAT] [nvarchar](18) NULL,
	[BWESB] [decimal](13, 3) NOT NULL,
	[/SAPMP/TOLPRPL] [decimal](3, 1) NULL,
	[/SAPMP/TOLPRMI] [decimal](3, 1) NULL,
	[/VSO/R_PKGRP] [nvarchar](18) NULL,
	[/VSO/R_LANE_NUM] [nvarchar](3) NULL,
	[/VSO/R_PAL_VEND] [nvarchar](18) NULL,
	[/VSO/R_FORK_DIR] [nvarchar](1) NULL,
	[IUID_RELEVANT] [nvarchar](1) NULL,
	[IUID_TYPE] [nvarchar](10) NULL,
	[UID_IEA] [nvarchar](1) NULL,
	[CONS_PROCG] [nvarchar](1) NULL,
	[GI_PR_TIME] [decimal](3, 0) NULL,
	[MULTIPLE_EKGRP] [nvarchar](1) NULL,
	[REF_SCHEMA] [nvarchar](2) NULL,
	[MIN_TROC] [nvarchar](3) NULL,
	[MAX_TROC] [nvarchar](3) NULL,
	[TARGET_STOCK] [decimal](13, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MARD]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MARD](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[LGORT] [nvarchar](4) NOT NULL,
	[PSTAT] [nvarchar](15) NULL,
	[LVORM] [nvarchar](1) NULL,
	[LFGJA] [nvarchar](4) NULL,
	[LFMON] [nvarchar](2) NULL,
	[SPERR] [nvarchar](1) NULL,
	[LABST] [decimal](13, 3) NULL,
	[UMLME] [decimal](13, 3) NULL,
	[INSME] [decimal](13, 3) NULL,
	[EINME] [decimal](13, 3) NULL,
	[SPEME] [decimal](13, 3) NULL,
	[RETME] [decimal](13, 3) NULL,
	[VMLAB] [decimal](13, 3) NULL,
	[VMUML] [decimal](13, 3) NULL,
	[VMINS] [decimal](13, 3) NULL,
	[VMEIN] [decimal](13, 3) NULL,
	[VMSPE] [decimal](13, 3) NULL,
	[VMRET] [decimal](13, 3) NULL,
	[KZILL] [nvarchar](3) NULL,
	[KZILQ] [nvarchar](3) NULL,
	[KZILE] [nvarchar](3) NULL,
	[KZILS] [nvarchar](3) NULL,
	[KZVLL] [nvarchar](3) NULL,
	[KZVLQ] [nvarchar](3) NULL,
	[KZVLE] [nvarchar](3) NULL,
	[KZVLS] [nvarchar](3) NULL,
	[DISKZ] [nvarchar](1) NULL,
	[LSOBS] [nvarchar](2) NULL,
	[LMINB] [decimal](13, 3) NULL,
	[LBSTF] [decimal](13, 3) NULL,
	[HERKL] [nvarchar](3) NULL,
	[EXPPG] [nvarchar](1) NULL,
	[EXVER] [nvarchar](2) NULL,
	[LGPBE] [nvarchar](10) NULL,
	[KLABS] [decimal](13, 3) NULL,
	[KINSM] [decimal](13, 3) NULL,
	[KEINM] [decimal](13, 3) NULL,
	[KSPEM] [decimal](13, 3) NULL,
	[DLINL] [nvarchar](8) NULL,
	[PRCTL] [nvarchar](10) NULL,
	[ERSDA] [nvarchar](8) NULL,
	[VKLAB] [decimal](13, 2) NULL,
	[VKUML] [decimal](13, 2) NULL,
	[LWMKB] [nvarchar](3) NULL,
	[BSKRF] [float] NULL,
	[MDRUE] [nvarchar](1) NULL,
	[MDJIN] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MBEW]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MBEW](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[BWTAR] [nvarchar](10) NOT NULL,
	[LVORM] [nvarchar](1) NULL,
	[LBKUM] [decimal](13, 3) NULL,
	[SALK3] [decimal](13, 2) NULL,
	[VPRSV] [nvarchar](1) NULL,
	[VERPR] [decimal](11, 2) NULL,
	[STPRS] [decimal](11, 2) NULL,
	[PEINH] [decimal](5, 0) NULL,
	[BKLAS] [nvarchar](4) NULL,
	[SALKV] [decimal](13, 2) NULL,
	[VMKUM] [decimal](13, 3) NULL,
	[VMSAL] [decimal](13, 2) NULL,
	[VMVPR] [nvarchar](1) NULL,
	[VMVER] [decimal](11, 2) NULL,
	[VMSTP] [decimal](11, 2) NULL,
	[VMPEI] [decimal](5, 0) NULL,
	[VMBKL] [nvarchar](4) NULL,
	[VMSAV] [decimal](13, 2) NULL,
	[VJKUM] [decimal](13, 3) NULL,
	[VJSAL] [decimal](13, 2) NULL,
	[VJVPR] [nvarchar](1) NULL,
	[VJVER] [decimal](11, 2) NULL,
	[VJSTP] [decimal](11, 2) NULL,
	[VJPEI] [decimal](5, 0) NULL,
	[VJBKL] [nvarchar](4) NULL,
	[VJSAV] [decimal](13, 2) NULL,
	[LFGJA] [nvarchar](4) NULL,
	[LFMON] [nvarchar](2) NULL,
	[BWTTY] [nvarchar](1) NULL,
	[STPRV] [decimal](11, 2) NULL,
	[LAEPR] [nvarchar](8) NULL,
	[ZKPRS] [decimal](11, 2) NULL,
	[ZKDAT] [nvarchar](8) NULL,
	[TIMESTAMP] [decimal](15, 0) NULL,
	[BWPRS] [decimal](11, 2) NULL,
	[BWPRH] [decimal](11, 2) NULL,
	[VJBWS] [decimal](11, 2) NULL,
	[VJBWH] [decimal](11, 2) NULL,
	[VVJSL] [decimal](13, 2) NULL,
	[VVJLB] [decimal](13, 3) NULL,
	[VVMLB] [decimal](13, 3) NULL,
	[VVSAL] [decimal](13, 2) NULL,
	[ZPLPR] [decimal](11, 2) NULL,
	[ZPLP1] [decimal](11, 2) NULL,
	[ZPLP2] [decimal](11, 2) NULL,
	[ZPLP3] [decimal](11, 2) NULL,
	[ZPLD1] [nvarchar](8) NULL,
	[ZPLD2] [nvarchar](8) NULL,
	[ZPLD3] [nvarchar](8) NULL,
	[PPERZ] [nvarchar](6) NULL,
	[PPERL] [nvarchar](6) NULL,
	[PPERV] [nvarchar](6) NULL,
	[KALKZ] [nvarchar](1) NULL,
	[KALKL] [nvarchar](1) NULL,
	[KALKV] [nvarchar](1) NULL,
	[KALSC] [nvarchar](6) NULL,
	[XLIFO] [nvarchar](1) NULL,
	[MYPOL] [nvarchar](4) NULL,
	[BWPH1] [decimal](11, 2) NULL,
	[BWPS1] [decimal](11, 2) NULL,
	[ABWKZ] [nvarchar](2) NULL,
	[PSTAT] [nvarchar](15) NULL,
	[KALN1] [nvarchar](12) NULL,
	[KALNR] [nvarchar](12) NULL,
	[BWVA1] [nvarchar](3) NULL,
	[BWVA2] [nvarchar](3) NULL,
	[BWVA3] [nvarchar](3) NULL,
	[VERS1] [nvarchar](2) NULL,
	[VERS2] [nvarchar](2) NULL,
	[VERS3] [nvarchar](2) NULL,
	[HRKFT] [nvarchar](4) NULL,
	[KOSGR] [nvarchar](10) NULL,
	[PPRDZ] [nvarchar](3) NULL,
	[PPRDL] [nvarchar](3) NULL,
	[PPRDV] [nvarchar](3) NULL,
	[PDATZ] [nvarchar](4) NULL,
	[PDATL] [nvarchar](4) NULL,
	[PDATV] [nvarchar](4) NULL,
	[EKALR] [nvarchar](1) NULL,
	[VPLPR] [decimal](11, 2) NULL,
	[MLMAA] [nvarchar](1) NULL,
	[MLAST] [nvarchar](1) NULL,
	[LPLPR] [decimal](11, 2) NULL,
	[VKSAL] [decimal](13, 2) NULL,
	[HKMAT] [nvarchar](1) NULL,
	[SPERW] [nvarchar](1) NULL,
	[KZIWL] [nvarchar](3) NULL,
	[WLINL] [nvarchar](8) NULL,
	[ABCIW] [nvarchar](1) NULL,
	[BWSPA] [decimal](6, 2) NULL,
	[LPLPX] [decimal](11, 2) NULL,
	[VPLPX] [decimal](11, 2) NULL,
	[FPLPX] [decimal](11, 2) NULL,
	[LBWST] [nvarchar](1) NULL,
	[VBWST] [nvarchar](1) NULL,
	[FBWST] [nvarchar](1) NULL,
	[EKLAS] [nvarchar](4) NULL,
	[QKLAS] [nvarchar](4) NULL,
	[MTUSE] [nvarchar](1) NULL,
	[MTORG] [nvarchar](1) NULL,
	[OWNPR] [nvarchar](1) NULL,
	[XBEWM] [nvarchar](1) NULL,
	[BWPEI] [decimal](5, 0) NULL,
	[MBRUE] [nvarchar](1) NULL,
	[OKLAS] [nvarchar](4) NULL,
	[OIPPINV] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MCHA]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MCHA](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[CHARG] [nvarchar](10) NOT NULL,
	[LVORM] [nvarchar](1) NULL,
	[ERSDA] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[AENAM] [nvarchar](12) NULL,
	[LAEDA] [nvarchar](8) NULL,
	[VERAB] [nvarchar](8) NULL,
	[VFDAT] [nvarchar](8) NULL,
	[ZUSCH] [nvarchar](1) NULL,
	[ZUSTD] [nvarchar](1) NULL,
	[ZAEDT] [nvarchar](8) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[LICHA] [nvarchar](15) NULL,
	[VLCHA] [nvarchar](10) NULL,
	[VLWRK] [nvarchar](4) NULL,
	[VLMAT] [nvarchar](18) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[CHAME] [nvarchar](3) NULL,
	[LWEDT] [nvarchar](8) NULL,
	[FVDT1] [nvarchar](8) NULL,
	[FVDT2] [nvarchar](8) NULL,
	[FVDT3] [nvarchar](8) NULL,
	[FVDT4] [nvarchar](8) NULL,
	[FVDT5] [nvarchar](8) NULL,
	[FVDT6] [nvarchar](8) NULL,
	[HERKL] [nvarchar](3) NULL,
	[HERKR] [nvarchar](3) NULL,
	[MTVER] [nvarchar](4) NULL,
	[QNDAT] [nvarchar](8) NULL,
	[HSDAT] [nvarchar](8) NULL,
	[CUOBJ_BM] [nvarchar](18) NULL,
	[DEACT_BM] [nvarchar](1) NULL,
	[BATCH_TYPE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MDIP]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MDIP](
	[MANDT] [nvarchar](3) NOT NULL,
	[DISPR] [nvarchar](4) NOT NULL,
	[DISMM] [nvarchar](2) NULL,
	[DISPO] [nvarchar](3) NULL,
	[KZDIE] [nvarchar](1) NULL,
	[MAABC] [nvarchar](1) NULL,
	[PLIFZ] [decimal](3, 0) NULL,
	[DZEIT] [decimal](3, 0) NULL,
	[FHORI] [nvarchar](3) NULL,
	[SBDKZ] [nvarchar](1) NULL,
	[KZBED] [nvarchar](1) NULL,
	[EISBE] [decimal](13, 3) NULL,
	[MINBE] [decimal](13, 3) NULL,
	[DISLS] [nvarchar](2) NULL,
	[BSTRF] [decimal](13, 3) NULL,
	[BSTMI] [decimal](13, 3) NULL,
	[BSTMA] [decimal](13, 3) NULL,
	[BSTFE] [decimal](13, 3) NULL,
	[MABST] [decimal](13, 3) NULL,
	[AUSSS] [decimal](5, 2) NULL,
	[LOSFX] [decimal](11, 2) NULL,
	[LAGPR] [nvarchar](1) NULL,
	[AUFTL] [nvarchar](1) NULL,
	[LGRAD] [decimal](3, 1) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[USEQU] [nvarchar](1) NULL,
	[PERKZ] [nvarchar](1) NULL,
	[PERIV] [nvarchar](2) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[MRPPP] [nvarchar](3) NULL,
	[SAUFT] [nvarchar](1) NULL,
	[SFEPR] [nvarchar](4) NULL,
	[FXHOR] [nvarchar](3) NULL,
	[VRMOD] [nvarchar](1) NULL,
	[VINT1] [nvarchar](3) NULL,
	[VINT2] [nvarchar](3) NULL,
	[DISGR] [nvarchar](4) NULL,
	[KAUSF] [decimal](5, 2) NULL,
	[ALTSL] [nvarchar](1) NULL,
	[MISKZ] [nvarchar](1) NULL,
	[WZEIT] [decimal](3, 0) NULL,
	[VPMAT] [nvarchar](18) NULL,
	[VPWRK] [nvarchar](4) NULL,
	[VPREF] [nvarchar](10) NULL,
	[TAKZT] [decimal](3, 0) NULL,
	[RWPRO] [nvarchar](3) NULL,
	[LFRHY] [nvarchar](3) NULL,
	[RDPRF] [nvarchar](4) NULL,
	[STRGR] [nvarchar](2) NULL,
	[SOBSL] [nvarchar](2) NULL,
	[RGEKZ] [nvarchar](1) NULL,
	[SCHGT] [nvarchar](1) NULL,
	[WAERS] [nvarchar](5) NULL,
	[SHFLG] [nvarchar](1) NULL,
	[SHZET] [nvarchar](2) NULL,
	[MDACH] [nvarchar](2) NULL,
	[LGPRO] [nvarchar](4) NULL,
	[MTVFP] [nvarchar](2) NULL,
	[BESKZ] [nvarchar](1) NULL,
	[KZECH] [nvarchar](1) NULL,
	[EISLO] [decimal](13, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MDLV]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MDLV](
	[MANDT] [nvarchar](3) NOT NULL,
	[BERID] [nvarchar](10) NOT NULL,
	[BERTY] [nvarchar](2) NULL,
	[BERTX] [nvarchar](40) NULL,
	[WERZG] [nvarchar](4) NULL,
	[ORTZG] [nvarchar](4) NULL,
	[SPE_BNTYP] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MKAL]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_MKAL](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[VERID] [nvarchar](4) NOT NULL,
	[BDATU] [nvarchar](8) NULL,
	[ADATU] [nvarchar](8) NULL,
	[STLAL] [nvarchar](2) NULL,
	[STLAN] [nvarchar](1) NULL,
	[PLNTY] [nvarchar](1) NULL,
	[PLNNR] [nvarchar](8) NULL,
	[ALNAL] [nvarchar](2) NULL,
	[BESKZ] [nvarchar](1) NULL,
	[SOBSL] [nvarchar](2) NULL,
	[LOSGR] [decimal](13, 3) NULL,
	[MDV01] [nvarchar](8) NULL,
	[MDV02] [nvarchar](8) NULL,
	[TEXT1] [nvarchar](40) NULL,
	[EWAHR] [decimal](3, 0) NULL,
	[VERTO] [nvarchar](4) NULL,
	[SERKZ] [nvarchar](1) NULL,
	[BSTMI] [decimal](13, 3) NULL,
	[BSTMA] [decimal](13, 3) NULL,
	[RGEKZ] [nvarchar](1) NULL,
	[ALORT] [nvarchar](4) NULL,
	[PLTYG] [nvarchar](1) NULL,
	[PLNNG] [nvarchar](8) NULL,
	[ALNAG] [nvarchar](2) NULL,
	[PLTYM] [nvarchar](1) NULL,
	[PLNNM] [nvarchar](8) NULL,
	[ALNAM] [nvarchar](2) NULL,
	[CSPLT] [nvarchar](4) NULL,
	[MATKO] [nvarchar](18) NULL,
	[ELPRO] [nvarchar](4) NULL,
	[PRVBE] [nvarchar](10) NULL,
	[PRFG_F] [nvarchar](1) NULL,
	[PRDAT] [nvarchar](8) NULL,
	[MKSP] [nvarchar](1) NULL,
	[PRFG_R] [nvarchar](1) NULL,
	[PRFG_G] [nvarchar](1) NULL,
	[PRFG_S] [nvarchar](1) NULL,
	[UCMAT] [nvarchar](18) NULL,
	[PPEGUID] [varbinary](16) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_MKPF]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MKPF](
	[MANDT] [nvarchar](3) NOT NULL,
	[MBLNR] [nvarchar](10) NOT NULL,
	[MJAHR] [nvarchar](4) NOT NULL,
	[VGART] [nvarchar](2) NULL,
	[BLART] [nvarchar](2) NULL,
	[BLAUM] [nvarchar](2) NULL,
	[BLDAT] [nvarchar](8) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[CPUDT] [nvarchar](8) NULL,
	[CPUTM] [nvarchar](6) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[USNAM] [nvarchar](12) NULL,
	[TCODE] [nvarchar](4) NULL,
	[XBLNR] [nvarchar](16) NULL,
	[BKTXT] [nvarchar](25) NULL,
	[FRATH] [decimal](13, 2) NULL,
	[FRBNR] [nvarchar](16) NULL,
	[WEVER] [nvarchar](1) NULL,
	[XABLN] [nvarchar](10) NULL,
	[AWSYS] [nvarchar](10) NULL,
	[BLA2D] [nvarchar](2) NULL,
	[TCODE2] [nvarchar](20) NULL,
	[BFWMS] [nvarchar](1) NULL,
	[EXNUM] [nvarchar](10) NULL,
	[SPE_BUDAT_UHR] [nvarchar](6) NULL,
	[SPE_BUDAT_ZONE] [nvarchar](6) NULL,
	[LE_VBELN] [nvarchar](10) NULL,
	[SPE_LOGSYS] [nvarchar](10) NULL,
	[SPE_MDNUM_EWM] [nvarchar](16) NULL,
	[GTS_CUSREF_NO] [nvarchar](35) NULL,
	[FLS_RSTO] [nvarchar](1) NULL,
	[MSR_ACTIVE] [nvarchar](1) NULL,
	[KNUMV] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MPLA]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MPLA](
	[MANDT] [nvarchar](3) NOT NULL,
	[WARPL] [nvarchar](12) NOT NULL,
	[ERKNZ] [nvarchar](1) NULL,
	[AEKNZ] [nvarchar](1) NULL,
	[ERSDT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[WPTXT] [nvarchar](40) NULL,
	[STRAT] [nvarchar](6) NULL,
	[ABRHO] [nvarchar](3) NULL,
	[EQUNR] [nvarchar](18) NULL,
	[TPLNR] [nvarchar](30) NULL,
	[KUNUM] [nvarchar](10) NULL,
	[LTKNZ] [nvarchar](1) NULL,
	[LVORM] [nvarchar](1) NULL,
	[ANZPS] [nvarchar](4) NULL,
	[ABNUM] [int] NULL,
	[LANGU] [nvarchar](1) NULL,
	[VSPOS] [nvarchar](3) NULL,
	[VSNEG] [nvarchar](3) NULL,
	[TOPOS] [nvarchar](3) NULL,
	[TONEG] [nvarchar](3) NULL,
	[SFAKT] [decimal](3, 2) NULL,
	[STICH] [nvarchar](1) NULL,
	[TGOON] [nvarchar](3) NULL,
	[HORIZ] [nvarchar](3) NULL,
	[HORIZ_DAYS] [nvarchar](3) NULL,
	[HORIZ_QUALIFIER] [nvarchar](1) NULL,
	[ANDOR] [nvarchar](1) NULL,
	[KNAUT] [nvarchar](1) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[MPTYP] [nvarchar](2) NULL,
	[HUNIT] [nvarchar](3) NULL,
	[STADT] [nvarchar](8) NULL,
	[SZAEH] [nvarchar](22) NULL,
	[CALL_CONFIRM] [nvarchar](1) NULL,
	[PLAN_SORT] [nvarchar](20) NULL,
	[FABKL] [nvarchar](2) NULL,
	[PUFFP] [nvarchar](3) NULL,
	[PUFFN] [nvarchar](3) NULL,
	[START_DATE] [nvarchar](8) NULL,
	[START_TIME] [nvarchar](6) NULL,
	[CALL_UPDATE_IND] [nvarchar](1) NULL,
	[IND_MPLA_API] [nvarchar](2) NULL,
	[MCP_SF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_MSEG]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_MSEG](
	[MANDT] [nvarchar](3) NOT NULL,
	[MBLNR] [nvarchar](10) NOT NULL,
	[MJAHR] [nvarchar](4) NOT NULL,
	[ZEILE] [nvarchar](4) NOT NULL,
	[LINE_ID] [nvarchar](6) NULL,
	[PARENT_ID] [nvarchar](6) NULL,
	[LINE_DEPTH] [nvarchar](2) NULL,
	[MAA_URZEI] [nvarchar](4) NULL,
	[BWART] [nvarchar](3) NULL,
	[XAUTO] [nvarchar](1) NULL,
	[MATNR] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[CHARG] [nvarchar](10) NULL,
	[INSMK] [nvarchar](1) NULL,
	[ZUSCH] [nvarchar](1) NULL,
	[ZUSTD] [nvarchar](1) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[KDEIN] [nvarchar](4) NULL,
	[PLPLA] [nvarchar](10) NULL,
	[SHKZG] [nvarchar](1) NULL,
	[WAERS] [nvarchar](5) NULL,
	[DMBTR] [decimal](13, 2) NULL,
	[BNBTR] [decimal](13, 2) NULL,
	[BUALT] [decimal](13, 2) NULL,
	[SHKUM] [nvarchar](1) NULL,
	[DMBUM] [decimal](13, 2) NULL,
	[BWTAR] [nvarchar](10) NULL,
	[MENGE] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[ERFMG] [decimal](13, 3) NULL,
	[ERFME] [nvarchar](3) NULL,
	[BPMNG] [decimal](13, 3) NULL,
	[BPRME] [nvarchar](3) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[LFBJA] [nvarchar](4) NULL,
	[LFBNR] [nvarchar](10) NOT NULL,
	[LFPOS] [nvarchar](4) NULL,
	[SJAHR] [nvarchar](4) NULL,
	[SMBLN] [nvarchar](10) NULL,
	[SMBLP] [nvarchar](4) NULL,
	[ELIKZ] [nvarchar](1) NULL,
	[SGTXT] [nvarchar](50) NULL,
	[EQUNR] [nvarchar](18) NULL,
	[WEMPF] [nvarchar](12) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[PARGB] [nvarchar](4) NULL,
	[PARBU] [nvarchar](4) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[PROJN] [nvarchar](16) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[ANLN1] [nvarchar](12) NULL,
	[ANLN2] [nvarchar](4) NULL,
	[XSKST] [nvarchar](1) NULL,
	[XSAUF] [nvarchar](1) NULL,
	[XSPRO] [nvarchar](1) NULL,
	[XSERG] [nvarchar](1) NULL,
	[GJAHR] [nvarchar](4) NULL,
	[XRUEM] [nvarchar](1) NULL,
	[XRUEJ] [nvarchar](1) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[BELNR] [nvarchar](10) NULL,
	[BUZEI] [nvarchar](3) NULL,
	[BELUM] [nvarchar](10) NULL,
	[BUZUM] [nvarchar](3) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[RSPOS] [nvarchar](4) NULL,
	[KZEAR] [nvarchar](1) NULL,
	[PBAMG] [decimal](13, 3) NULL,
	[KZSTR] [nvarchar](1) NULL,
	[UMMAT] [nvarchar](18) NULL,
	[UMWRK] [nvarchar](4) NULL,
	[UMLGO] [nvarchar](4) NULL,
	[UMCHA] [nvarchar](10) NULL,
	[UMZST] [nvarchar](1) NULL,
	[UMZUS] [nvarchar](1) NULL,
	[UMBAR] [nvarchar](10) NULL,
	[UMSOK] [nvarchar](1) NULL,
	[KZBEW] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[KZZUG] [nvarchar](1) NULL,
	[WEUNB] [nvarchar](1) NULL,
	[PALAN] [decimal](11, 0) NULL,
	[LGNUM] [nvarchar](3) NULL,
	[LGTYP] [nvarchar](3) NULL,
	[LGPLA] [nvarchar](10) NULL,
	[BESTQ] [nvarchar](1) NULL,
	[BWLVS] [nvarchar](3) NULL,
	[TBNUM] [nvarchar](10) NULL,
	[TBPOS] [nvarchar](4) NULL,
	[XBLVS] [nvarchar](1) NULL,
	[VSCHN] [nvarchar](1) NULL,
	[NSCHN] [nvarchar](1) NULL,
	[DYPLA] [nvarchar](1) NULL,
	[UBNUM] [nvarchar](10) NULL,
	[TBPRI] [nvarchar](1) NULL,
	[TANUM] [nvarchar](10) NULL,
	[WEANZ] [nvarchar](3) NULL,
	[GRUND] [nvarchar](4) NULL,
	[EVERS] [nvarchar](2) NULL,
	[EVERE] [nvarchar](2) NULL,
	[IMKEY] [nvarchar](8) NULL,
	[KSTRG] [nvarchar](12) NULL,
	[PAOBJNR] [nvarchar](10) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[NPLNR] [nvarchar](12) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[APLZL] [nvarchar](8) NULL,
	[AUFPS] [nvarchar](4) NULL,
	[VPTNR] [nvarchar](10) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[SAKTO] [nvarchar](10) NULL,
	[BSTMG] [decimal](13, 3) NULL,
	[BSTME] [nvarchar](3) NULL,
	[XWSBR] [nvarchar](1) NULL,
	[EMLIF] [nvarchar](10) NULL,
	[ZZSPREG] [nvarchar](5) NULL,
	[ZZBUSPARTN] [nvarchar](10) NULL,
	[ZZPRODUCT] [nvarchar](10) NULL,
	[ZZLOCA] [nvarchar](4) NULL,
	[ZZCHAN] [nvarchar](4) NULL,
	[ZZLOB] [nvarchar](7) NULL,
	[ZZNFAL] [nvarchar](10) NULL,
	[ZZUSERFLD1] [nvarchar](9) NULL,
	[ZZUSERFLD2] [nvarchar](12) NULL,
	[ZZUSERFLD3] [nvarchar](22) NULL,
	[ZZREGION] [nvarchar](3) NULL,
	[ZZSTATE] [nvarchar](3) NULL,
	[EXBWR] [decimal](13, 2) NULL,
	[VKWRT] [decimal](13, 2) NULL,
	[AKTNR] [nvarchar](10) NULL,
	[ZEKKN] [nvarchar](2) NULL,
	[VFDAT] [nvarchar](8) NULL,
	[CUOBJ_CH] [nvarchar](18) NULL,
	[EXVKW] [decimal](13, 2) NULL,
	[PPRCTR] [nvarchar](10) NULL,
	[RSART] [nvarchar](1) NULL,
	[GEBER] [nvarchar](10) NULL,
	[FISTL] [nvarchar](16) NULL,
	[MATBF] [nvarchar](18) NULL,
	[UMMAB] [nvarchar](18) NULL,
	[BUSTM] [nvarchar](4) NULL,
	[BUSTW] [nvarchar](4) NULL,
	[MENGU] [nvarchar](1) NULL,
	[WERTU] [nvarchar](1) NULL,
	[LBKUM] [decimal](13, 3) NULL,
	[SALK3] [decimal](13, 2) NULL,
	[VPRSV] [nvarchar](1) NULL,
	[FKBER] [nvarchar](16) NULL,
	[DABRBZ] [nvarchar](8) NULL,
	[VKWRA] [decimal](13, 2) NULL,
	[DABRZ] [nvarchar](8) NULL,
	[XBEAU] [nvarchar](1) NULL,
	[LSMNG] [decimal](13, 3) NULL,
	[LSMEH] [nvarchar](3) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[QINSPST] [nvarchar](1) NULL,
	[URZEI] [nvarchar](4) NULL,
	[J_1BEXBASE] [decimal](13, 2) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[EMATN] [nvarchar](18) NULL,
	[J_1AGIRUPD] [nvarchar](1) NULL,
	[VKMWS] [nvarchar](2) NULL,
	[HSDAT] [nvarchar](8) NULL,
	[BERKZ] [nvarchar](1) NULL,
	[MAT_KDAUF] [nvarchar](10) NULL,
	[MAT_KDPOS] [nvarchar](6) NULL,
	[MAT_PSPNR] [nvarchar](8) NULL,
	[XWOFF] [nvarchar](1) NULL,
	[BEMOT] [nvarchar](2) NULL,
	[PRZNR] [nvarchar](12) NULL,
	[LLIEF] [nvarchar](10) NULL,
	[LSTAR] [nvarchar](6) NULL,
	[XOBEW] [nvarchar](1) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[ZUSTD_T156M] [nvarchar](1) NULL,
	[SPE_GTS_STOCK_TY] [nvarchar](1) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[XMACC] [nvarchar](1) NULL,
	[VGART_MKPF] [nvarchar](2) NULL,
	[BUDAT_MKPF] [nvarchar](8) NULL,
	[CPUDT_MKPF] [nvarchar](8) NULL,
	[CPUTM_MKPF] [nvarchar](6) NULL,
	[USNAM_MKPF] [nvarchar](12) NULL,
	[XBLNR_MKPF] [nvarchar](16) NULL,
	[TCODE2_MKPF] [nvarchar](20) NULL,
	[VBELN_IM] [nvarchar](10) NULL,
	[VBELP_IM] [nvarchar](6) NULL,
	[/BEV2/ED_KZ_VER] [nvarchar](1) NULL,
	[/BEV2/ED_USER] [nvarchar](12) NULL,
	[/BEV2/ED_AEDAT] [nvarchar](8) NULL,
	[/BEV2/ED_AETIM] [nvarchar](6) NULL,
	[DISUB_OWNER] [nvarchar](10) NULL,
	[OINAVNW] [decimal](13, 2) NULL,
	[OICONDCOD] [nvarchar](2) NULL,
	[CONDI] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_OIB01]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_OIB01](
	[MANDT] [nvarchar](3) NOT NULL,
	[UMRSL] [nvarchar](4) NOT NULL,
	[PDTYP] [nvarchar](1) NULL,
	[BSTMP] [float] NULL,
	[BSTEH] [nvarchar](3) NULL,
	[WQTYL] [float] NULL,
	[WQTYH] [float] NULL,
	[EQTYL] [float] NULL,
	[EQTYH] [float] NULL,
	[DNTYP] [nvarchar](1) NULL,
	[VCFLN] [nvarchar](1) NULL,
	[MCFI] [nvarchar](1) NULL,
	[PDCL] [nvarchar](2) NULL,
	[HVTYP] [nvarchar](2) NULL,
	[BPRESH] [float] NULL,
	[BPRESHEH] [nvarchar](3) NULL,
	[BSTMPH] [float] NULL,
	[BSTMPHEH] [nvarchar](3) NULL,
	[EXT_PROG_VERSION] [nvarchar](1) NULL,
	[BPRESV] [float] NULL,
	[BPRESVEH] [nvarchar](3) NULL,
	[BTMPVP] [float] NULL,
	[BTMPVPEH] [nvarchar](3) NULL,
	[CHGS] [nvarchar](1) NULL,
	[CHLQ] [nvarchar](1) NULL,
	[EXTDNUNIT] [nvarchar](3) NULL,
	[EXTHVUNIT] [nvarchar](3) NULL,
	[EXTIND] [nvarchar](1) NULL,
	[VCFLN_LPG] [nvarchar](1) NULL,
	[BSDNEH] [nvarchar](3) NULL,
	[BSHVEH] [nvarchar](3) NULL,
	[TDTHV] [nvarchar](1) NULL,
	[BDBHV] [nvarchar](1) NULL,
	[AROMATICS] [nvarchar](2) NULL,
	[BHVCLS] [nvarchar](2) NULL,
	[IDGAS] [nvarchar](1) NULL,
	[RFC_RELEASE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_OIB06]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_OIB06](
	[MANDT] [nvarchar](3) NOT NULL,
	[UOMGR] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_ONR00]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_ONR00](
	[MANDT] [nvarchar](3) NOT NULL,
	[OBJNR] [nvarchar](22) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_PKHD]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_PKHD](
	[MANDT] [nvarchar](3) NOT NULL,
	[PKNUM] [nvarchar](7) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PRVBE] [nvarchar](10) NOT NULL,
	[BEHAZ] [nvarchar](3) NOT NULL,
	[BEHMG] [decimal](13, 3) NOT NULL,
	[VERID] [nvarchar](4) NOT NULL,
	[SIGAZ] [nvarchar](3) NOT NULL,
	[RGVER] [nvarchar](3) NOT NULL,
	[PKOSA] [nvarchar](12) NOT NULL,
	[PKSTE] [nvarchar](4) NOT NULL,
	[BERKZ] [nvarchar](1) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[LGTYP] [nvarchar](3) NOT NULL,
	[LGPLA] [nvarchar](10) NOT NULL,
	[NKDYN] [nvarchar](1) NOT NULL,
	[PKSTF] [nvarchar](4) NOT NULL,
	[PKSTU] [nvarchar](4) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ANSWB] [nvarchar](1) NOT NULL,
	[PKBHT] [nvarchar](18) NOT NULL,
	[QUFKT] [nvarchar](1) NOT NULL,
	[UMLGO] [nvarchar](4) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[RKSTA] [nvarchar](1) NOT NULL,
	[KOSTL] [nvarchar](10) NOT NULL,
	[VBPRN] [nvarchar](4) NOT NULL,
	[PKDRS] [nvarchar](1) NOT NULL,
	[PKUMW] [nvarchar](4) NOT NULL,
	[PKADR] [nvarchar](10) NOT NULL,
	[PKSFG] [nvarchar](4) NOT NULL,
	[PKLOG] [nvarchar](1) NULL,
	[ALSMG] [decimal](13, 3) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[KCART] [nvarchar](1) NULL,
	[KCSAF] [decimal](5, 3) NULL,
	[KCCON] [smallint] NULL,
	[PKRMG] [decimal](13, 3) NULL,
	[PKFMG] [decimal](13, 3) NULL,
	[KCPRF] [nvarchar](4) NULL,
	[KWBZD] [decimal](3, 0) NULL,
	[KWBZM] [decimal](11, 0) NULL,
	[VBELN] [nvarchar](10) NULL,
	[VBELP] [nvarchar](6) NULL,
	[QUPVB] [nvarchar](10) NULL,
	[PABPRF] [nvarchar](4) NULL,
	[PACKV] [nvarchar](22) NULL,
	[ANZLT] [nvarchar](3) NULL,
	[RKFORM] [nvarchar](16) NULL,
	[ZPUNKT] [nvarchar](4) NULL,
	[LCM_STATUS] [nvarchar](1) NULL,
	[CRE_DATE] [nvarchar](8) NULL,
	[RLS_DATE] [nvarchar](8) NULL,
	[OBS_DATE] [nvarchar](8) NULL,
	[PINTVD] [decimal](3, 0) NULL,
	[PINTVM] [decimal](11, 0) NULL,
	[KNFZD] [decimal](5, 2) NULL,
	[KNFZM] [decimal](11, 0) NULL,
	[KWTZD] [decimal](5, 2) NULL,
	[KWTZM] [decimal](11, 0) NULL,
	[KITZD] [decimal](5, 2) NULL,
	[KITZM] [decimal](11, 0) NULL,
	[KDMBUF] [decimal](3, 0) NULL,
	[KSPBUF] [decimal](3, 0) NULL,
	[NTREL] [nvarchar](3) NULL,
	[TRIGAZ] [nvarchar](3) NULL,
	[TRIGGR] [nvarchar](10) NULL,
	[CAPA_WRKCT] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_PLAF]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_PLAF](
	[MANDT] [nvarchar](3) NOT NULL,
	[PLNUM] [nvarchar](10) NOT NULL,
	[MATNR] [nvarchar](18) NULL,
	[PLWRK] [nvarchar](4) NULL,
	[PWWRK] [nvarchar](4) NULL,
	[PAART] [nvarchar](4) NULL,
	[BESKZ] [nvarchar](1) NULL,
	[SOBES] [nvarchar](1) NULL,
	[GSMNG] [decimal](13, 3) NULL,
	[TLMNG] [decimal](13, 3) NULL,
	[AVMNG] [decimal](13, 3) NULL,
	[BDMNG] [decimal](13, 3) NULL,
	[PSTTR] [nvarchar](8) NULL,
	[PEDTR] [nvarchar](8) NULL,
	[PERTR] [nvarchar](8) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[DISPO] [nvarchar](3) NULL,
	[UMSKZ] [nvarchar](1) NULL,
	[AUFFX] [nvarchar](1) NULL,
	[STLFX] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[KDEIN] [nvarchar](4) NULL,
	[PROJN] [nvarchar](16) NULL,
	[RSNUM] [nvarchar](10) NULL,
	[QUNUM] [nvarchar](10) NULL,
	[QUPOS] [nvarchar](3) NULL,
	[FLIEF] [nvarchar](10) NULL,
	[KONNR] [nvarchar](10) NULL,
	[KTPNR] [nvarchar](5) NULL,
	[EKORG] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[NUMVR] [nvarchar](2) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[PSPEL] [nvarchar](8) NULL,
	[SERNR] [nvarchar](8) NULL,
	[PALTR] [nvarchar](8) NULL,
	[TECHS] [nvarchar](12) NULL,
	[STLAN] [nvarchar](1) NULL,
	[STALT] [nvarchar](2) NULL,
	[STSTA] [nvarchar](2) NULL,
	[AENNR] [nvarchar](12) NULL,
	[ARSNR] [nvarchar](10) NULL,
	[ARSPS] [nvarchar](4) NULL,
	[VERTO] [nvarchar](4) NULL,
	[VERID] [nvarchar](4) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[TRART] [nvarchar](1) NULL,
	[PLGRP] [nvarchar](3) NULL,
	[TERST] [nvarchar](8) NULL,
	[TERED] [nvarchar](8) NULL,
	[BEDID] [nvarchar](12) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[LINID] [nvarchar](15) NULL,
	[TRMKZ] [nvarchar](1) NULL,
	[TRMER] [nvarchar](2) NULL,
	[REDKZ] [nvarchar](1) NULL,
	[TRMHK] [nvarchar](1) NULL,
	[PLNNR] [nvarchar](8) NULL,
	[PLNAL] [nvarchar](2) NULL,
	[PLNTY] [nvarchar](1) NULL,
	[FRTHW] [nvarchar](1) NULL,
	[RGEKZ] [nvarchar](1) NULL,
	[MEINS] [nvarchar](3) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[REVLV] [nvarchar](2) NULL,
	[ABMNG] [decimal](13, 3) NULL,
	[RATID] [nvarchar](12) NULL,
	[GROID] [nvarchar](12) NULL,
	[RATER] [nvarchar](2) NULL,
	[GROER] [nvarchar](2) NULL,
	[OBART] [nvarchar](1) NULL,
	[PLSCN] [nvarchar](3) NULL,
	[SBNUM] [nvarchar](10) NULL,
	[KBNKZ] [nvarchar](1) NULL,
	[KAPFX] [nvarchar](1) NULL,
	[SEQNR] [nvarchar](14) NULL,
	[PSTTI] [nvarchar](6) NULL,
	[PEDTI] [nvarchar](6) NULL,
	[MONKZ] [nvarchar](1) NULL,
	[PRNKZ] [nvarchar](1) NULL,
	[MDPBV] [nvarchar](1) NULL,
	[VFMNG] [decimal](13, 3) NULL,
	[MDACH] [nvarchar](2) NULL,
	[MDACC] [nvarchar](4) NULL,
	[MDACD] [nvarchar](8) NULL,
	[MDACT] [nvarchar](6) NULL,
	[GSBTR] [nvarchar](8) NULL,
	[PLETX] [nvarchar](1) NULL,
	[PRSCH] [nvarchar](1) NULL,
	[LVSCH] [nvarchar](1) NULL,
	[KZAVC] [nvarchar](1) NULL,
	[VRPLA] [nvarchar](1) NULL,
	[PBDNR] [nvarchar](10) NULL,
	[AGREQ] [nvarchar](1) NULL,
	[UMREZ] [decimal](5, 0) NULL,
	[UMREN] [decimal](5, 0) NULL,
	[ERFMG] [decimal](13, 3) NULL,
	[ERFME] [nvarchar](3) NULL,
	[RQNUM] [nvarchar](10) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[WEMNG] [decimal](13, 3) NULL,
	[WAMNG] [decimal](13, 3) NULL,
	[EDGNO] [nvarchar](17) NULL,
	[LBLKZ] [nvarchar](1) NULL,
	[EMLIF] [nvarchar](10) NULL,
	[BERID] [nvarchar](10) NULL,
	[UBERI] [nvarchar](10) NULL,
	[EMATN] [nvarchar](18) NULL,
	[REMFL] [nvarchar](1) NULL,
	[PSTMP] [decimal](15, 0) NULL,
	[PUSER] [nvarchar](12) NULL,
	[BADI] [nvarchar](1) NULL,
	[STAEX] [nvarchar](2) NULL,
	[RESLO] [nvarchar](4) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL,
	[MEDKZ] [nvarchar](1) NULL,
	[CNFQTY] [decimal](13, 3) NULL,
	[KUNNR] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_PREQ]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_PREQ](
	[MANDT] [nvarchar](3) NOT NULL,
	[PRIO_REQ] [nvarchar](3) NOT NULL,
	[PRIOGR_URG] [nvarchar](2) NULL,
	[PRIO_ORG] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_PRPS]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_PRPS](
	[MANDT] [nvarchar](3) NOT NULL,
	[PSPNR] [nvarchar](8) NOT NULL,
	[POSID] [nvarchar](24) NULL,
	[POST1] [nvarchar](40) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[PSPHI] [nvarchar](8) NULL,
	[POSKI] [nvarchar](16) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[VERNR] [nvarchar](8) NULL,
	[VERNA] [nvarchar](25) NULL,
	[ASTNR] [nvarchar](8) NULL,
	[ASTNA] [nvarchar](25) NULL,
	[PBUKR] [nvarchar](4) NULL,
	[PGSBR] [nvarchar](4) NULL,
	[PKOKR] [nvarchar](4) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[PRART] [nvarchar](2) NULL,
	[STUFE] [smallint] NULL,
	[PLAKZ] [nvarchar](1) NULL,
	[BELKZ] [nvarchar](1) NULL,
	[FAKKZ] [nvarchar](1) NULL,
	[NPFAZ] [nvarchar](1) NULL,
	[ZUORD] [nvarchar](1) NULL,
	[TRMEQ] [nvarchar](1) NULL,
	[KVEWE] [nvarchar](1) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[ZSCHL] [nvarchar](6) NULL,
	[ABGSL] [nvarchar](6) NULL,
	[AKOKR] [nvarchar](4) NULL,
	[AKSTL] [nvarchar](10) NULL,
	[FKOKR] [nvarchar](4) NULL,
	[FKSTL] [nvarchar](10) NULL,
	[FABKL] [nvarchar](2) NULL,
	[PSPRI] [nvarchar](1) NULL,
	[EQUNR] [nvarchar](18) NULL,
	[TPLNR] [nvarchar](30) NULL,
	[PWPOS] [nvarchar](5) NULL,
	[WERKS] [nvarchar](4) NULL,
	[TXTSP] [nvarchar](1) NULL,
	[SLWID] [nvarchar](7) NULL,
	[USR00] [nvarchar](20) NULL,
	[USR01] [nvarchar](20) NULL,
	[USR02] [nvarchar](10) NULL,
	[USR03] [nvarchar](10) NULL,
	[USR04] [decimal](13, 3) NULL,
	[USE04] [nvarchar](3) NULL,
	[USR05] [decimal](13, 3) NULL,
	[USE05] [nvarchar](3) NULL,
	[USR06] [decimal](13, 3) NULL,
	[USE06] [nvarchar](5) NULL,
	[USR07] [decimal](13, 3) NULL,
	[USE07] [nvarchar](5) NULL,
	[USR08] [nvarchar](8) NULL,
	[USR09] [nvarchar](8) NULL,
	[USR10] [nvarchar](1) NULL,
	[USR11] [nvarchar](1) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[KTRG] [nvarchar](12) NULL,
	[BERST] [nvarchar](16) NULL,
	[BERTR] [nvarchar](16) NULL,
	[BERKO] [nvarchar](16) NULL,
	[BERBU] [nvarchar](16) NULL,
	[CLASF] [nvarchar](1) NULL,
	[SPSNR] [nvarchar](8) NULL,
	[SCOPE] [nvarchar](2) NULL,
	[XSTAT] [nvarchar](1) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[ZSCHM] [nvarchar](7) NULL,
	[IMPRF] [nvarchar](6) NULL,
	[EVGEW] [decimal](8, 0) NULL,
	[AENNR] [nvarchar](12) NULL,
	[SUBPR] [nvarchar](12) NULL,
	[POSTU] [nvarchar](40) NULL,
	[PLINT] [nvarchar](1) NULL,
	[LOEVM] [nvarchar](1) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[FPLNR] [nvarchar](10) NULL,
	[TADAT] [nvarchar](8) NULL,
	[IZWEK] [nvarchar](2) NULL,
	[ISIZE] [nvarchar](2) NULL,
	[IUMKZ] [nvarchar](5) NULL,
	[ABUKR] [nvarchar](4) NULL,
	[GRPKZ] [nvarchar](1) NULL,
	[PGPRF] [nvarchar](6) NULL,
	[LOGSYSTEM] [nvarchar](10) NULL,
	[PSPNR_LOGS] [nvarchar](8) NULL,
	[STORT] [nvarchar](10) NULL,
	[FUNC_AREA] [nvarchar](16) NULL,
	[KLVAR] [nvarchar](4) NULL,
	[KALNR] [nvarchar](12) NULL,
	[POSID_EDIT] [nvarchar](24) NULL,
	[PSPKZ] [nvarchar](1) NULL,
	[MATNR] [nvarchar](18) NULL,
	[VLPSP] [nvarchar](8) NULL,
	[VLPKZ] [nvarchar](1) NULL,
	[SORT1] [nvarchar](10) NULL,
	[SORT2] [nvarchar](10) NULL,
	[SORT3] [nvarchar](10) NULL,
	[VNAME] [nvarchar](6) NULL,
	[RECID] [nvarchar](2) NULL,
	[ETYPE] [nvarchar](3) NULL,
	[OTYPE] [nvarchar](4) NULL,
	[JIBCL] [nvarchar](3) NULL,
	[JIBSA] [nvarchar](5) NULL,
	[CGPL_GUID16] [varbinary](16) NULL,
	[CGPL_LOGSYS] [nvarchar](10) NULL,
	[CGPL_OBJTYPE] [nvarchar](3) NULL,
	[ADPSP] [nvarchar](40) NULL,
	[RFIPPNT] [nvarchar](20) NULL,
	[ZZPS01] [nvarchar](5) NULL,
	[ZZPS02] [nvarchar](5) NULL,
	[ZZPS03] [nvarchar](2) NULL,
	[ZZPS04] [nvarchar](2) NULL,
	[ZZPS05] [nvarchar](2) NULL,
	[FERC_IND] [nvarchar](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_PURG]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_PURG](
	[MANDT] [nvarchar](3) NOT NULL,
	[PRIO_URG] [nvarchar](2) NOT NULL,
	[PRIOGR_URG] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_PVBE]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_PVBE](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PRVBE] [nvarchar](10) NOT NULL,
	[LGORT] [nvarchar](4) NOT NULL,
	[RGVER] [nvarchar](3) NOT NULL,
	[ABLAD] [nvarchar](25) NULL,
	[PVADR] [nvarchar](10) NULL,
	[LGBZO] [nvarchar](10) NULL,
	[FABKLV] [nvarchar](2) NULL,
	[SCHGRUPV] [nvarchar](2) NULL,
	[SPROGV] [nvarchar](4) NULL,
	[PINTVD] [decimal](3, 0) NULL,
	[PINTVM] [decimal](11, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_QALS]    Script Date: 10/15/2014 5:40:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_QALS](
	[MANDANT] [nvarchar](3) NOT NULL,
	[PRUEFLOS] [nvarchar](12) NOT NULL,
	[WERK] [nvarchar](4) NULL,
	[ART] [nvarchar](8) NULL,
	[HERKUNFT] [nvarchar](2) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[OBTYP] [nvarchar](3) NULL,
	[STSMA] [nvarchar](8) NULL,
	[QMATAUTH] [nvarchar](6) NULL,
	[STAT11] [nvarchar](1) NULL,
	[INSMK] [nvarchar](1) NULL,
	[STAT01] [nvarchar](1) NULL,
	[STAT02] [nvarchar](1) NULL,
	[STAT04] [nvarchar](1) NULL,
	[STAT06] [nvarchar](1) NULL,
	[STAT07] [nvarchar](1) NULL,
	[STAT08] [nvarchar](1) NULL,
	[STAT09] [nvarchar](1) NULL,
	[STAT10] [nvarchar](1) NULL,
	[STAT14] [nvarchar](1) NULL,
	[STAT16] [nvarchar](1) NULL,
	[STAT18] [nvarchar](1) NULL,
	[STAT19] [nvarchar](1) NULL,
	[STAT20] [nvarchar](1) NULL,
	[STAT21] [nvarchar](1) NULL,
	[STAT22] [nvarchar](1) NULL,
	[STAT23] [nvarchar](1) NULL,
	[STAT24] [nvarchar](1) NULL,
	[STAT25] [nvarchar](1) NULL,
	[STAT29] [nvarchar](1) NULL,
	[STAT26] [nvarchar](1) NULL,
	[STAT27] [nvarchar](1) NULL,
	[STAT28] [nvarchar](1) NULL,
	[STAT31] [nvarchar](1) NULL,
	[STAT34] [nvarchar](1) NULL,
	[STAT35] [nvarchar](1) NULL,
	[STAT45] [nvarchar](1) NULL,
	[STAT46] [nvarchar](1) NULL,
	[STAT47] [nvarchar](1) NULL,
	[STAT48] [nvarchar](1) NULL,
	[STAT49] [nvarchar](1) NULL,
	[STAT50] [nvarchar](1) NULL,
	[KZSKIPLOT] [nvarchar](1) NULL,
	[DYN] [nvarchar](1) NULL,
	[HPZ] [nvarchar](1) NULL,
	[EIN] [nvarchar](1) NULL,
	[ANZSN] [int] NULL,
	[KZDYNERF] [nvarchar](1) NULL,
	[DYNHEAD] [nvarchar](1) NULL,
	[STPRVER] [nvarchar](8) NULL,
	[EXTNUM] [nvarchar](1) NULL,
	[STAFO] [nvarchar](6) NULL,
	[STAT30] [nvarchar](1) NULL,
	[QINFSTATUS] [nvarchar](8) NULL,
	[ENSTEHDAT] [nvarchar](8) NULL,
	[ENTSTEZEIT] [nvarchar](6) NULL,
	[ERSTELLER] [nvarchar](12) NULL,
	[ERSTELDAT] [nvarchar](8) NULL,
	[ERSTELZEIT] [nvarchar](6) NULL,
	[AENDERER] [nvarchar](12) NULL,
	[AENDERDAT] [nvarchar](8) NULL,
	[AENDERZEIT] [nvarchar](6) NULL,
	[PASTRTERM] [nvarchar](8) NULL,
	[PASTRZEIT] [nvarchar](6) NULL,
	[PAENDTERM] [nvarchar](8) NULL,
	[PAENDZEIT] [nvarchar](6) NULL,
	[PLNTY] [nvarchar](1) NULL,
	[PLNNR] [nvarchar](8) NULL,
	[PPLVERW] [nvarchar](3) NULL,
	[PLNAL] [nvarchar](2) NULL,
	[ZAEHL] [nvarchar](8) NULL,
	[ZKRIZ] [nvarchar](7) NULL,
	[STAT15] [nvarchar](1) NULL,
	[SLWBEZ] [nvarchar](3) NULL,
	[STAT13] [nvarchar](1) NULL,
	[PPKZTLZU] [nvarchar](1) NULL,
	[ZAEHL1] [nvarchar](8) NULL,
	[PRBNAVERF] [nvarchar](8) NULL,
	[PRBNAVV] [nvarchar](6) NULL,
	[STAT12] [nvarchar](1) NULL,
	[SELMATNR] [nvarchar](18) NULL,
	[SELREVLV] [nvarchar](2) NULL,
	[SELWERK] [nvarchar](4) NULL,
	[SELLIFNR] [nvarchar](10) NULL,
	[STAT17] [nvarchar](1) NULL,
	[SELHERST] [nvarchar](10) NULL,
	[SELKUNNR] [nvarchar](10) NULL,
	[SELPPLVERW] [nvarchar](3) NULL,
	[GUELTIGAB] [nvarchar](8) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[CUOBJ_CH] [nvarchar](18) NULL,
	[VERID] [nvarchar](4) NULL,
	[SA_AUFNR] [nvarchar](12) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[HERSTELLER] [nvarchar](10) NULL,
	[EMATNR] [nvarchar](18) NULL,
	[MATNR] [nvarchar](18) NULL,
	[REVLV] [nvarchar](2) NULL,
	[XCHPF] [nvarchar](1) NULL,
	[CHARG] [nvarchar](10) NULL,
	[LAGORTCHRG] [nvarchar](4) NULL,
	[ZEUGNISBIS] [nvarchar](8) NULL,
	[VFDAT] [nvarchar](8) NULL,
	[LICHN] [nvarchar](15) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[PS_PSP_PNR] [nvarchar](8) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[ETENR] [nvarchar](4) NULL,
	[BLART] [nvarchar](2) NULL,
	[MJAHR] [nvarchar](4) NULL,
	[MBLNR] [nvarchar](10) NULL,
	[ZEILE] [nvarchar](4) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[BWART] [nvarchar](3) NULL,
	[WERKVORG] [nvarchar](4) NULL,
	[LAGORTVORG] [nvarchar](4) NULL,
	[LGNUM] [nvarchar](3) NULL,
	[LGTYP] [nvarchar](3) NULL,
	[LGPLA] [nvarchar](10) NULL,
	[LS_KDAUF] [nvarchar](10) NULL,
	[LS_KDPOS] [nvarchar](6) NULL,
	[LS_VBELN] [nvarchar](10) NULL,
	[LS_POSNR] [nvarchar](6) NULL,
	[LS_ABRVW] [nvarchar](3) NULL,
	[LS_ROUTE] [nvarchar](6) NULL,
	[LS_LLAND] [nvarchar](3) NULL,
	[LS_KUNAG] [nvarchar](10) NULL,
	[LS_VKORG] [nvarchar](4) NULL,
	[LS_KDMAT] [nvarchar](35) NULL,
	[SPRACHE] [nvarchar](1) NULL,
	[KTEXTLOS] [nvarchar](40) NULL,
	[LTEXTKZ] [nvarchar](1) NULL,
	[KTEXTMAT] [nvarchar](40) NULL,
	[ZUSMKZAEHL] [smallint] NULL,
	[OFFENNLZMK] [smallint] NULL,
	[OFFEN_LZMK] [smallint] NULL,
	[LOSMENGE] [decimal](13, 3) NULL,
	[MENGENEINH] [nvarchar](3) NULL,
	[ANZGEB] [decimal](6, 3) NULL,
	[GEBEH] [nvarchar](3) NULL,
	[LVS_STIKZ] [nvarchar](1) NULL,
	[LVS_STIMG] [decimal](13, 3) NULL,
	[GESSTICHPR] [decimal](13, 3) NULL,
	[EINHPROBE] [nvarchar](3) NULL,
	[DYNREGEL] [nvarchar](3) NULL,
	[STAT44] [nvarchar](1) NULL,
	[PRSTUFE] [nvarchar](4) NULL,
	[PRSCHAERFE] [nvarchar](3) NULL,
	[LMENGE01] [decimal](13, 3) NULL,
	[LMENGE02] [decimal](13, 3) NULL,
	[LMENGE03] [decimal](13, 3) NULL,
	[LMENGE04] [decimal](13, 3) NULL,
	[LMENGE05] [decimal](13, 3) NULL,
	[LMENGE06] [decimal](13, 3) NULL,
	[MATNRNEU] [nvarchar](18) NULL,
	[CHARGNEU] [nvarchar](10) NULL,
	[LMENGE07] [decimal](13, 3) NULL,
	[LMENGE08] [decimal](13, 3) NULL,
	[LMENGE09] [decimal](13, 3) NULL,
	[LMENGEZUB] [decimal](13, 3) NULL,
	[LMENGELZ] [decimal](13, 3) NULL,
	[LMENGEPR] [decimal](13, 3) NULL,
	[LMENGEZER] [decimal](13, 3) NULL,
	[LMENGEIST] [decimal](13, 3) NULL,
	[LMENGESCH] [decimal](13, 3) NULL,
	[LTEXTKZBB] [nvarchar](1) NULL,
	[ANTEIL] [float] NULL,
	[QKZVERF] [nvarchar](2) NULL,
	[STAT03] [nvarchar](1) NULL,
	[QPMATLOS] [float] NULL,
	[AUFNR_CO] [nvarchar](12) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[PSTYP] [nvarchar](1) NULL,
	[STAT05] [nvarchar](1) NULL,
	[KOSTL] [nvarchar](10) NULL,
	[AUFPS] [nvarchar](4) NULL,
	[ANLN1] [nvarchar](12) NULL,
	[ANLN2] [nvarchar](4) NULL,
	[KONT_PSPNR] [nvarchar](8) NULL,
	[NPLNR] [nvarchar](12) NULL,
	[APLZL] [nvarchar](8) NULL,
	[KONT_KDAUF] [nvarchar](10) NULL,
	[KONT_KDPOS] [nvarchar](6) NULL,
	[IMKEY] [nvarchar](8) NULL,
	[DABRZ] [nvarchar](8) NULL,
	[KSTRG] [nvarchar](12) NULL,
	[PAOBJNR] [nvarchar](10) NULL,
	[PRCTR] [nvarchar](10) NULL,
	[GSBER] [nvarchar](4) NULL,
	[KONTO] [nvarchar](10) NULL,
	[KOKRS] [nvarchar](4) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[SERNP] [nvarchar](4) NULL,
	[LOS_REF] [nvarchar](12) NULL,
	[BEARBSTATU] [nvarchar](2) NULL,
	[STAT32] [nvarchar](1) NULL,
	[STAT33] [nvarchar](1) NULL,
	[STAT36] [nvarchar](1) NULL,
	[STAT37] [nvarchar](1) NULL,
	[STAT38] [nvarchar](1) NULL,
	[STAT39] [nvarchar](1) NULL,
	[STAT40] [nvarchar](1) NULL,
	[STAT41] [nvarchar](1) NULL,
	[STAT42] [nvarchar](1) NULL,
	[STAT43] [nvarchar](1) NULL,
	[MENGU] [nvarchar](1) NULL,
	[KZPZADR] [nvarchar](1) NULL,
	[KZPRADR] [nvarchar](1) NULL,
	[ZUSCH] [nvarchar](1) NULL,
	[ZUSTD] [nvarchar](1) NULL,
	[KZERSTLIEF] [nvarchar](1) NULL,
	[KZERSTMUST] [nvarchar](1) NULL,
	[ADDON_DUMMY] [nvarchar](1) NULL,
	[WARPL] [nvarchar](12) NULL,
	[WAPOS] [nvarchar](16) NULL,
	[ABNUM] [int] NULL,
	[STRAT] [nvarchar](6) NULL,
	[TRIALID] [nvarchar](12) NULL,
	[RESPONSIBLE] [nvarchar](45) NULL,
	[INSP_DOC_NUMBER] [nvarchar](30) NULL,
	[LOG_SYSTEM] [nvarchar](10) NULL,
	[GESSTICHPR_EXT] [decimal](13, 3) NULL,
	[EINHPROBE_EXT] [nvarchar](3) NULL,
	[PRIO_PUNKTE] [int] NULL,
	[SIGN_TYPE_RR] [nvarchar](1) NULL,
	[SIGN_TYPE_UD] [nvarchar](1) NULL,
	[SIGN_TYPE_SM] [nvarchar](1) NULL,
	[SIGNSTRAT_RR] [nvarchar](8) NULL,
	[SIGNSTRAT_UD] [nvarchar](8) NULL,
	[SIGNSTRAT_SM] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_RBKP]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_RBKP](
	[MANDT] [nvarchar](3) NOT NULL,
	[BELNR] [nvarchar](10) NOT NULL,
	[GJAHR] [nvarchar](4) NOT NULL,
	[BLART] [nvarchar](2) NOT NULL,
	[BLDAT] [nvarchar](8) NOT NULL,
	[BUDAT] [nvarchar](8) NOT NULL,
	[USNAM] [nvarchar](12) NOT NULL,
	[TCODE] [nvarchar](20) NOT NULL,
	[CPUDT] [nvarchar](8) NOT NULL,
	[CPUTM] [nvarchar](6) NOT NULL,
	[VGART] [nvarchar](2) NOT NULL,
	[XBLNR] [nvarchar](16) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[KURSF] [decimal](9, 5) NOT NULL,
	[RMWWR] [decimal](13, 2) NOT NULL,
	[BEZNK] [decimal](13, 2) NOT NULL,
	[WMWST1] [decimal](13, 2) NOT NULL,
	[MWSKZ1] [nvarchar](2) NOT NULL,
	[WMWST2] [decimal](13, 2) NULL,
	[MWSKZ2] [nvarchar](2) NULL,
	[ZTERM] [nvarchar](4) NOT NULL,
	[ZBD1T] [decimal](3, 0) NOT NULL,
	[ZBD1P] [decimal](5, 3) NOT NULL,
	[ZBD2T] [decimal](3, 0) NOT NULL,
	[ZBD2P] [decimal](5, 3) NOT NULL,
	[ZBD3T] [decimal](3, 0) NOT NULL,
	[WSKTO] [decimal](13, 2) NOT NULL,
	[XRECH] [nvarchar](1) NOT NULL,
	[BKTXT] [nvarchar](25) NOT NULL,
	[SAPRL] [nvarchar](4) NOT NULL,
	[LOGSYS] [nvarchar](10) NOT NULL,
	[XMWST] [nvarchar](1) NOT NULL,
	[STBLG] [nvarchar](10) NULL,
	[STJAH] [nvarchar](4) NULL,
	[MWSKZ_BNK] [nvarchar](2) NULL,
	[TXJCD_BNK] [nvarchar](15) NULL,
	[IVTYP] [nvarchar](1) NULL,
	[XRBTX] [nvarchar](1) NULL,
	[REPART] [nvarchar](1) NULL,
	[RBSTAT] [nvarchar](1) NULL,
	[KNUMVE] [nvarchar](10) NULL,
	[KNUMVL] [nvarchar](10) NULL,
	[ARKUEN] [decimal](13, 2) NULL,
	[ARKUEMW] [decimal](13, 2) NULL,
	[MAKZN] [decimal](13, 2) NULL,
	[MAKZMW] [decimal](13, 2) NULL,
	[LIEFFN] [decimal](13, 2) NULL,
	[LIEFFMW] [decimal](13, 2) NULL,
	[XAUTAKZ] [nvarchar](1) NULL,
	[ESRNR] [nvarchar](11) NULL,
	[ESRPZ] [nvarchar](2) NULL,
	[ESRRE] [nvarchar](27) NULL,
	[QSSHB] [decimal](13, 2) NULL,
	[QSFBT] [decimal](13, 2) NULL,
	[QSSKZ] [nvarchar](2) NULL,
	[DIEKZ] [nvarchar](1) NULL,
	[LANDL] [nvarchar](3) NULL,
	[LZBKZ] [nvarchar](3) NULL,
	[TXKRS] [decimal](9, 5) NULL,
	[EMPFB] [nvarchar](10) NULL,
	[BVTYP] [nvarchar](4) NULL,
	[HBKID] [nvarchar](5) NULL,
	[ZUONR] [nvarchar](18) NULL,
	[ZLSPR] [nvarchar](1) NULL,
	[ZLSCH] [nvarchar](1) NULL,
	[ZFBDT] [nvarchar](8) NULL,
	[KIDNO] [nvarchar](30) NULL,
	[REBZG] [nvarchar](10) NULL,
	[REBZJ] [nvarchar](4) NULL,
	[XINVE] [nvarchar](1) NULL,
	[EGMLD] [nvarchar](3) NULL,
	[XEGDR] [nvarchar](1) NULL,
	[VATDATE] [nvarchar](8) NULL,
	[J_1BNFTYPE] [nvarchar](2) NULL,
	[BRNCH] [nvarchar](4) NULL,
	[ERFPR] [nvarchar](12) NULL,
	[SECCO] [nvarchar](4) NULL,
	[NAME1] [nvarchar](35) NULL,
	[NAME2] [nvarchar](35) NULL,
	[NAME3] [nvarchar](35) NULL,
	[NAME4] [nvarchar](35) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[ORT01] [nvarchar](35) NULL,
	[LAND1] [nvarchar](3) NULL,
	[STRAS] [nvarchar](35) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTL2] [nvarchar](10) NULL,
	[PSKTO] [nvarchar](16) NULL,
	[BANKN] [nvarchar](18) NULL,
	[BANKL] [nvarchar](15) NULL,
	[BANKS] [nvarchar](3) NULL,
	[STCD1] [nvarchar](16) NULL,
	[STCD2] [nvarchar](11) NULL,
	[STKZU] [nvarchar](1) NULL,
	[STKZA] [nvarchar](1) NULL,
	[REGIO] [nvarchar](3) NULL,
	[BKONT] [nvarchar](2) NULL,
	[DTAWS] [nvarchar](2) NULL,
	[DTAMS] [nvarchar](1) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[XCPDK] [nvarchar](1) NULL,
	[EMPFG] [nvarchar](16) NULL,
	[FITYP] [nvarchar](2) NULL,
	[STCDT] [nvarchar](2) NULL,
	[STKZN] [nvarchar](1) NULL,
	[STCD3] [nvarchar](18) NULL,
	[STCD4] [nvarchar](18) NULL,
	[BKREF] [nvarchar](20) NULL,
	[J_1KFREPRE] [nvarchar](10) NULL,
	[J_1KFTBUS] [nvarchar](30) NULL,
	[J_1KFTIND] [nvarchar](30) NULL,
	[ANRED] [nvarchar](15) NULL,
	[STCEG] [nvarchar](20) NULL,
	[ERNAME] [nvarchar](12) NULL,
	[REINDAT] [nvarchar](8) NULL,
	[UZAWE] [nvarchar](2) NULL,
	[FDLEV] [nvarchar](2) NULL,
	[FDTAG] [nvarchar](8) NULL,
	[ZBFIX] [nvarchar](1) NULL,
	[FRGKZ] [nvarchar](1) NULL,
	[ERFNAM] [nvarchar](12) NULL,
	[BUPLA] [nvarchar](4) NULL,
	[FILKD] [nvarchar](10) NULL,
	[GSBER] [nvarchar](4) NULL,
	[LOTKZ] [nvarchar](10) NULL,
	[SGTXT] [nvarchar](50) NULL,
	[PREPAY_STATUS] [nvarchar](1) NULL,
	[PREPAY_AWKEY] [nvarchar](20) NULL,
	[ASSIGN_STATUS] [nvarchar](1) NULL,
	[ASSIGN_NEXT_DATE] [nvarchar](8) NULL,
	[ASSIGN_END_DATE] [nvarchar](8) NULL,
	[COPY_BY_BELNR] [nvarchar](10) NULL,
	[COPY_BY_YEAR] [nvarchar](4) NULL,
	[COPY_TO_BELNR] [nvarchar](10) NULL,
	[COPY_TO_YEAR] [nvarchar](4) NULL,
	[COPY_USER] [nvarchar](12) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_RDPR]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_RDPR](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[RDPRF] [nvarchar](4) NOT NULL,
	[RDZAE] [nvarchar](6) NOT NULL,
	[BDMNG] [decimal](13, 3) NOT NULL,
	[VORMG] [decimal](13, 3) NOT NULL,
	[RDMPO] [nvarchar](1) NULL,
	[RDRGL] [nvarchar](2) NULL,
	[CHKMELI] [nvarchar](1) NULL,
	[CHKMEKU] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_RESB]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_RESB](
	[MANDT] [nvarchar](3) NOT NULL,
	[RSNUM] [nvarchar](10) NOT NULL,
	[RSPOS] [nvarchar](4) NOT NULL,
	[RSART] [nvarchar](1) NOT NULL,
	[BDART] [nvarchar](2) NULL,
	[RSSTA] [nvarchar](1) NULL,
	[XLOEK] [nvarchar](1) NULL,
	[XWAOK] [nvarchar](1) NULL,
	[KZEAR] [nvarchar](1) NULL,
	[XFEHL] [nvarchar](1) NULL,
	[MATNR] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[LGORT] [nvarchar](4) NULL,
	[PRVBE] [nvarchar](10) NULL,
	[CHARG] [nvarchar](10) NULL,
	[PLPLA] [nvarchar](10) NULL,
	[SOBKZ] [nvarchar](1) NULL,
	[BDTER] [nvarchar](8) NULL,
	[BDMNG] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[SHKZG] [nvarchar](1) NULL,
	[FMENG] [nvarchar](1) NULL,
	[ENMNG] [decimal](13, 3) NULL,
	[ENWRT] [decimal](13, 2) NULL,
	[WAERS] [nvarchar](5) NULL,
	[ERFMG] [decimal](13, 3) NULL,
	[ERFME] [nvarchar](3) NULL,
	[PLNUM] [nvarchar](10) NULL,
	[BANFN] [nvarchar](10) NULL,
	[BNFPO] [nvarchar](5) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[BAUGR] [nvarchar](18) NULL,
	[SERNR] [nvarchar](8) NULL,
	[KDAUF] [nvarchar](10) NULL,
	[KDPOS] [nvarchar](6) NULL,
	[KDEIN] [nvarchar](4) NULL,
	[PROJN] [nvarchar](16) NULL,
	[BWART] [nvarchar](3) NULL,
	[SAKNR] [nvarchar](10) NULL,
	[GSBER] [nvarchar](4) NULL,
	[UMWRK] [nvarchar](4) NULL,
	[UMLGO] [nvarchar](4) NULL,
	[NAFKZ] [nvarchar](1) NULL,
	[NOMAT] [nvarchar](18) NULL,
	[NOMNG] [decimal](13, 3) NULL,
	[POSTP] [nvarchar](1) NULL,
	[POSNR] [nvarchar](4) NULL,
	[ROMS1] [decimal](13, 3) NULL,
	[ROMS2] [decimal](13, 3) NULL,
	[ROMS3] [decimal](13, 3) NULL,
	[ROMEI] [nvarchar](3) NULL,
	[ROMEN] [decimal](13, 3) NULL,
	[SGTXT] [nvarchar](50) NULL,
	[LMENG] [decimal](13, 3) NULL,
	[ROHPS] [nvarchar](1) NULL,
	[RFORM] [nvarchar](2) NULL,
	[ROANZ] [decimal](13, 3) NULL,
	[FLMNG] [decimal](13, 3) NULL,
	[STLTY] [nvarchar](1) NULL,
	[STLNR] [nvarchar](8) NULL,
	[STLKN] [nvarchar](8) NULL,
	[STPOZ] [nvarchar](8) NULL,
	[LTXSP] [nvarchar](1) NULL,
	[POTX1] [nvarchar](40) NULL,
	[POTX2] [nvarchar](40) NULL,
	[SANKA] [nvarchar](1) NULL,
	[ALPOS] [nvarchar](1) NULL,
	[EWAHR] [decimal](3, 0) NULL,
	[AUSCH] [decimal](5, 2) NULL,
	[AVOAU] [decimal](5, 2) NULL,
	[NETAU] [nvarchar](1) NULL,
	[NLFZT] [decimal](3, 0) NULL,
	[AENNR] [nvarchar](12) NULL,
	[UMREZ] [decimal](5, 0) NULL,
	[UMREN] [decimal](5, 0) NULL,
	[SORTF] [nvarchar](10) NULL,
	[SBTER] [nvarchar](8) NULL,
	[VERTI] [nvarchar](4) NULL,
	[SCHGT] [nvarchar](1) NULL,
	[UPSKZ] [nvarchar](1) NULL,
	[DBSKZ] [nvarchar](1) NULL,
	[TXTPS] [nvarchar](1) NULL,
	[DUMPS] [nvarchar](1) NULL,
	[BEIKZ] [nvarchar](1) NULL,
	[ERSKZ] [nvarchar](1) NULL,
	[AUFST] [nvarchar](2) NULL,
	[AUFWG] [nvarchar](2) NULL,
	[BAUST] [nvarchar](2) NULL,
	[BAUWG] [nvarchar](2) NULL,
	[AUFPS] [nvarchar](2) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[EBELE] [nvarchar](4) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[KZVBR] [nvarchar](1) NULL,
	[PSPEL] [nvarchar](8) NULL,
	[AUFPL] [nvarchar](10) NULL,
	[PLNFL] [nvarchar](6) NULL,
	[VORNR] [nvarchar](4) NULL,
	[APLZL] [nvarchar](8) NULL,
	[OBJNR] [nvarchar](22) NULL,
	[FLGAT] [nvarchar](1) NULL,
	[GPREIS] [decimal](15, 2) NULL,
	[FPREIS] [decimal](15, 2) NULL,
	[PEINH] [decimal](5, 0) NULL,
	[RGEKZ] [nvarchar](1) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[ROKME] [nvarchar](3) NULL,
	[ZUMEI] [nvarchar](3) NULL,
	[ZUMS1] [decimal](13, 3) NULL,
	[ZUMS2] [decimal](13, 3) NULL,
	[ZUMS3] [decimal](13, 3) NULL,
	[ZUDIV] [nvarchar](5) NULL,
	[VMENG] [decimal](15, 3) NULL,
	[PRREG] [nvarchar](2) NULL,
	[LIFZT] [decimal](3, 0) NULL,
	[CUOBJ] [nvarchar](18) NULL,
	[KFPOS] [nvarchar](1) NULL,
	[REVLV] [nvarchar](2) NULL,
	[BERKZ] [nvarchar](1) NULL,
	[LGNUM] [nvarchar](3) NULL,
	[LGTYP] [nvarchar](3) NULL,
	[LGPLA] [nvarchar](10) NULL,
	[TBMNG] [decimal](13, 3) NULL,
	[NPTXTKY] [nvarchar](12) NULL,
	[KBNKZ] [nvarchar](1) NULL,
	[KZKUP] [nvarchar](1) NULL,
	[AFPOS] [nvarchar](4) NULL,
	[NO_DISP] [nvarchar](1) NULL,
	[BDZTP] [nvarchar](6) NULL,
	[ESMNG] [float] NULL,
	[ALPGR] [nvarchar](2) NULL,
	[ALPRF] [nvarchar](2) NULL,
	[ALPST] [nvarchar](1) NULL,
	[KZAUS] [nvarchar](1) NULL,
	[NFEAG] [nvarchar](2) NULL,
	[NFPKZ] [nvarchar](1) NULL,
	[NFGRP] [nvarchar](2) NULL,
	[NFUML] [decimal](5, 4) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[CHOBJ] [nvarchar](18) NULL,
	[SPLKZ] [nvarchar](1) NULL,
	[SPLRV] [nvarchar](4) NULL,
	[KNUMH] [nvarchar](10) NULL,
	[WEMPF] [nvarchar](12) NULL,
	[ABLAD] [nvarchar](25) NULL,
	[HKMAT] [nvarchar](1) NULL,
	[HRKFT] [nvarchar](4) NULL,
	[VORAB] [nvarchar](1) NULL,
	[MATKL] [nvarchar](9) NULL,
	[FRUNV] [nvarchar](1) NULL,
	[CLAKZ] [nvarchar](1) NULL,
	[INPOS] [nvarchar](1) NULL,
	[WEBAZ] [decimal](3, 0) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[FLGEX] [nvarchar](1) NULL,
	[FUNCT] [nvarchar](3) NULL,
	[GPREIS_2] [decimal](15, 2) NULL,
	[FPREIS_2] [decimal](15, 2) NULL,
	[PEINH_2] [decimal](5, 0) NULL,
	[INFNR] [nvarchar](10) NULL,
	[KZECH] [nvarchar](1) NULL,
	[KZMPF] [nvarchar](1) NULL,
	[STLAL] [nvarchar](2) NULL,
	[PBDNR] [nvarchar](10) NULL,
	[STVKN] [nvarchar](8) NULL,
	[KTOMA] [nvarchar](1) NULL,
	[VRPLA] [nvarchar](1) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[NLFZV] [decimal](3, 0) NULL,
	[NLFMV] [nvarchar](3) NULL,
	[TECHS] [nvarchar](12) NULL,
	[OBJTYPE] [nvarchar](1) NULL,
	[CH_PROC] [nvarchar](1) NULL,
	[FXPRU] [nvarchar](1) NULL,
	[UMSOK] [nvarchar](1) NULL,
	[VORAB_SM] [nvarchar](1) NULL,
	[FIPOS] [nvarchar](14) NULL,
	[FIPEX] [nvarchar](24) NULL,
	[FISTL] [nvarchar](16) NULL,
	[GEBER] [nvarchar](10) NULL,
	[GRANT_NBR] [nvarchar](20) NULL,
	[FKBER] [nvarchar](16) NULL,
	[PRIO_URG] [nvarchar](2) NULL,
	[PRIO_REQ] [nvarchar](3) NULL,
	[KBLNR] [nvarchar](10) NULL,
	[KBLPOS] [nvarchar](3) NULL,
	[BUDGET_PD] [nvarchar](10) NULL,
	[ADVCODE] [nvarchar](2) NULL,
	[WTY_IND] [nvarchar](1) NULL,
	[R_PART_INDICATOR] [nvarchar](1) NULL,
	[WTYSC_CLMITEM] [nvarchar](16) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_RSEG]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_RSEG](
	[MANDT] [nvarchar](3) NOT NULL,
	[BELNR] [nvarchar](10) NOT NULL,
	[GJAHR] [nvarchar](4) NOT NULL,
	[BUZEI] [nvarchar](6) NOT NULL,
	[EBELN] [nvarchar](10) NOT NULL,
	[EBELP] [nvarchar](5) NOT NULL,
	[ZEKKN] [nvarchar](2) NOT NULL,
	[MATNR] [nvarchar](18) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[BWTAR] [nvarchar](10) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[WRBTR] [decimal](13, 2) NOT NULL,
	[SHKZG] [nvarchar](1) NOT NULL,
	[MWSKZ] [nvarchar](2) NOT NULL,
	[TXJCD] [nvarchar](15) NOT NULL,
	[MENGE] [decimal](13, 3) NOT NULL,
	[BSTME] [nvarchar](3) NOT NULL,
	[BPMNG] [decimal](13, 3) NOT NULL,
	[BPRME] [nvarchar](3) NOT NULL,
	[LBKUM] [decimal](13, 3) NOT NULL,
	[VRKUM] [decimal](13, 3) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[PSTYP] [nvarchar](1) NOT NULL,
	[KNTTP] [nvarchar](1) NOT NULL,
	[BKLAS] [nvarchar](4) NOT NULL,
	[EREKZ] [nvarchar](1) NOT NULL,
	[EXKBE] [nvarchar](1) NOT NULL,
	[XEKBZ] [nvarchar](1) NOT NULL,
	[TBTKZ] [nvarchar](1) NOT NULL,
	[SPGRP] [nvarchar](1) NOT NULL,
	[SPGRM] [nvarchar](1) NOT NULL,
	[SPGRT] [nvarchar](1) NOT NULL,
	[SPGRG] [nvarchar](1) NOT NULL,
	[SPGRV] [nvarchar](1) NOT NULL,
	[SPGRQ] [nvarchar](1) NOT NULL,
	[SPGRS] [nvarchar](1) NOT NULL,
	[SPGRC] [nvarchar](1) NOT NULL,
	[SPGREXT] [nvarchar](1) NULL,
	[BUSTW] [nvarchar](4) NOT NULL,
	[XBLNR] [nvarchar](16) NOT NULL,
	[XRUEB] [nvarchar](1) NOT NULL,
	[BNKAN] [decimal](13, 2) NOT NULL,
	[KSCHL] [nvarchar](4) NOT NULL,
	[SALK3] [decimal](13, 2) NOT NULL,
	[VMSAL] [decimal](13, 2) NOT NULL,
	[XLIFO] [nvarchar](1) NOT NULL,
	[LFBNR] [nvarchar](10) NOT NULL,
	[LFGJA] [nvarchar](4) NOT NULL,
	[LFPOS] [nvarchar](4) NOT NULL,
	[MATBF] [nvarchar](18) NOT NULL,
	[RBMNG] [decimal](13, 3) NULL,
	[BPRBM] [decimal](13, 3) NULL,
	[RBWWR] [decimal](13, 2) NULL,
	[LFEHL] [nvarchar](1) NULL,
	[GRICD] [nvarchar](2) NULL,
	[GRIRG] [nvarchar](3) NULL,
	[GITYP] [nvarchar](2) NULL,
	[PACKNO] [nvarchar](10) NULL,
	[INTROW] [nvarchar](10) NULL,
	[SGTXT] [nvarchar](50) NULL,
	[XSKRL] [nvarchar](1) NULL,
	[KZMEK] [nvarchar](1) NULL,
	[MRMOK] [nvarchar](1) NULL,
	[STUNR] [nvarchar](3) NULL,
	[ZAEHK] [nvarchar](2) NULL,
	[STOCK_POSTING] [decimal](13, 2) NULL,
	[STOCK_POSTING_PP] [decimal](13, 2) NULL,
	[STOCK_POSTING_PY] [decimal](13, 2) NULL,
	[WEREC] [nvarchar](1) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[FRBNR] [nvarchar](16) NULL,
	[XHISTMA] [nvarchar](1) NULL,
	[COMPLAINT_REASON] [nvarchar](2) NULL,
	[RETAMT_FC] [decimal](13, 2) NULL,
	[RETPC] [decimal](5, 2) NULL,
	[RETDUEDT] [nvarchar](8) NULL,
	[XRETTAXNET] [nvarchar](1) NULL,
	[RE_ACCOUNT] [nvarchar](10) NULL,
	[ERP_CONTRACT_ID] [nvarchar](10) NULL,
	[ERP_CONTRACT_ITM] [nvarchar](5) NULL,
	[SRM_CONTRACT_ID] [nvarchar](10) NULL,
	[SRM_CONTRACT_ITM] [nvarchar](10) NULL,
	[CONT_PSTYP] [nvarchar](1) NULL,
	[SRVMAPKEY] [nvarchar](10) NULL,
	[CHARG] [nvarchar](10) NULL,
	[XCPRF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_SECCODE]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_SECCODE](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[SECCODE] [nvarchar](4) NOT NULL,
	[BPLACE] [nvarchar](4) NULL,
	[RGOFFICE] [nvarchar](3) NULL,
	[TAXOFFICE] [nvarchar](3) NULL,
	[ADRNR] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_SKA1]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_SKA1](
	[MANDT] [nvarchar](3) NOT NULL,
	[KTOPL] [nvarchar](4) NOT NULL,
	[SAKNR] [nvarchar](10) NOT NULL,
	[XBILK] [nvarchar](1) NULL,
	[SAKAN] [nvarchar](10) NULL,
	[BILKT] [nvarchar](10) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[GVTYP] [nvarchar](2) NULL,
	[KTOKS] [nvarchar](4) NULL,
	[MUSTR] [nvarchar](10) NULL,
	[VBUND] [nvarchar](6) NULL,
	[XLOEV] [nvarchar](1) NULL,
	[XSPEA] [nvarchar](1) NULL,
	[XSPEB] [nvarchar](1) NULL,
	[XSPEP] [nvarchar](1) NULL,
	[MCOD1] [nvarchar](25) NULL,
	[FUNC_AREA] [nvarchar](16) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_SNUM]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_SNUM](
	[MANDT] [nvarchar](3) NOT NULL,
	[SERNR] [nvarchar](8) NOT NULL,
	[BRUTR] [nvarchar](8) NULL,
	[TECHS] [nvarchar](12) NULL,
	[SONDB] [nvarchar](1) NULL,
	[MATNR] [nvarchar](18) NULL,
	[WERKS] [nvarchar](4) NULL,
	[SNTXT] [nvarchar](40) NULL,
	[SNSTA] [nvarchar](1) NULL,
	[XLOEK] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T000]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T000](
	[MANDT] [nvarchar](3) NOT NULL,
	[MTEXT] [nvarchar](25) NOT NULL,
	[ORT01] [nvarchar](25) NOT NULL,
	[MWAER] [nvarchar](5) NOT NULL,
	[ADRNR] [nvarchar](10) NOT NULL,
	[CCCATEGORY] [nvarchar](1) NOT NULL,
	[CCCORACTIV] [nvarchar](1) NOT NULL,
	[CCNOCLIIND] [nvarchar](1) NOT NULL,
	[CCCOPYLOCK] [nvarchar](1) NOT NULL,
	[CCNOCASCAD] [nvarchar](1) NOT NULL,
	[CCSOFTLOCK] [nvarchar](1) NOT NULL,
	[CCORIGCONT] [nvarchar](1) NOT NULL,
	[CCIMAILDIS] [nvarchar](1) NOT NULL,
	[CCTEMPLOCK] [nvarchar](1) NOT NULL,
	[CHANGEUSER] [nvarchar](12) NOT NULL,
	[CHANGEDATE] [nvarchar](8) NOT NULL,
	[LOGSYS] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T001]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T001](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[BUTXT] [nvarchar](25) NULL,
	[ORT01] [nvarchar](25) NULL,
	[LAND1] [nvarchar](3) NULL,
	[WAERS] [nvarchar](5) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[KTOPL] [nvarchar](4) NULL,
	[WAABW] [nvarchar](2) NULL,
	[PERIV] [nvarchar](2) NULL,
	[KOKFI] [nvarchar](1) NULL,
	[RCOMP] [nvarchar](6) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[STCEG] [nvarchar](20) NULL,
	[FIKRS] [nvarchar](4) NULL,
	[XFMCO] [nvarchar](1) NULL,
	[XFMCB] [nvarchar](1) NULL,
	[XFMCA] [nvarchar](1) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[FMHRDATE] [nvarchar](8) NULL,
	[BUVAR] [nvarchar](1) NULL,
	[FDBUK] [nvarchar](4) NULL,
	[XFDIS] [nvarchar](1) NULL,
	[XVALV] [nvarchar](1) NULL,
	[XSKFN] [nvarchar](1) NULL,
	[KKBER] [nvarchar](4) NULL,
	[XMWSN] [nvarchar](1) NULL,
	[MREGL] [nvarchar](4) NULL,
	[XGSBE] [nvarchar](1) NULL,
	[XGJRV] [nvarchar](1) NULL,
	[XKDFT] [nvarchar](1) NULL,
	[XPROD] [nvarchar](1) NULL,
	[XEINK] [nvarchar](1) NULL,
	[XJVAA] [nvarchar](1) NULL,
	[XVVWA] [nvarchar](1) NULL,
	[XSLTA] [nvarchar](1) NULL,
	[XFDMM] [nvarchar](1) NULL,
	[XFDSD] [nvarchar](1) NULL,
	[XEXTB] [nvarchar](1) NULL,
	[EBUKR] [nvarchar](4) NULL,
	[KTOP2] [nvarchar](4) NULL,
	[UMKRS] [nvarchar](4) NULL,
	[BUKRS_GLOB] [nvarchar](6) NULL,
	[FSTVA] [nvarchar](4) NULL,
	[OPVAR] [nvarchar](4) NULL,
	[XCOVR] [nvarchar](1) NULL,
	[TXKRS] [nvarchar](1) NULL,
	[WFVAR] [nvarchar](4) NULL,
	[XBBBF] [nvarchar](1) NULL,
	[XBBBE] [nvarchar](1) NULL,
	[XBBBA] [nvarchar](1) NULL,
	[XBBKO] [nvarchar](1) NULL,
	[XSTDT] [nvarchar](1) NULL,
	[MWSKV] [nvarchar](2) NULL,
	[MWSKA] [nvarchar](2) NULL,
	[IMPDA] [nvarchar](1) NULL,
	[XNEGP] [nvarchar](1) NULL,
	[XKKBI] [nvarchar](1) NULL,
	[WT_NEWWT] [nvarchar](1) NULL,
	[PP_PDATE] [nvarchar](1) NULL,
	[INFMT] [nvarchar](4) NULL,
	[FSTVARE] [nvarchar](4) NULL,
	[KOPIM] [nvarchar](1) NULL,
	[DKWEG] [nvarchar](1) NULL,
	[OFFSACCT] [nvarchar](1) NULL,
	[BAPOVAR] [nvarchar](2) NULL,
	[XCOS] [nvarchar](1) NULL,
	[XCESSION] [nvarchar](1) NULL,
	[XSPLT] [nvarchar](1) NULL,
	[SURCCM] [nvarchar](1) NULL,
	[DTPROV] [nvarchar](2) NULL,
	[DTAMTC] [nvarchar](2) NULL,
	[DTTAXC] [nvarchar](2) NULL,
	[DTTDSP] [nvarchar](2) NULL,
	[DTAXR] [nvarchar](4) NULL,
	[XVATDATE] [nvarchar](1) NULL,
	[PST_PER_VAR] [nvarchar](1) NULL,
	[FM_DERIVE_ACC] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T001K]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T001K](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[BWMOD] [nvarchar](4) NULL,
	[XBKNG] [nvarchar](1) NULL,
	[MLBWA] [nvarchar](1) NULL,
	[MLBWV] [nvarchar](1) NULL,
	[XVKBW] [nvarchar](1) NULL,
	[ERKLAERKOM] [nvarchar](1) NULL,
	[UPROF] [nvarchar](4) NULL,
	[WBPRO] [nvarchar](4) NULL,
	[MLAST] [nvarchar](1) NULL,
	[MLASV] [nvarchar](1) NULL,
	[BDIFP] [decimal](5, 2) NULL,
	[XLBPD] [nvarchar](1) NULL,
	[XEWRX] [nvarchar](1) NULL,
	[X2FDO] [nvarchar](1) NULL,
	[PRSFR] [nvarchar](1) NULL,
	[MLCCS] [nvarchar](1) NULL,
	[XEFRE] [nvarchar](1) NULL,
	[EFREJ] [nvarchar](4) NULL,
	[/FMP/PRSFR] [nvarchar](1) NULL,
	[/FMP/PRFRGR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T001L]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T001L](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[LGORT] [nvarchar](4) NOT NULL,
	[LGOBE] [nvarchar](16) NOT NULL,
	[SPART] [nvarchar](2) NOT NULL,
	[XLONG] [nvarchar](1) NOT NULL,
	[XBUFX] [nvarchar](1) NOT NULL,
	[DISKZ] [nvarchar](1) NOT NULL,
	[XBLGO] [nvarchar](1) NULL,
	[XRESS] [nvarchar](1) NULL,
	[XHUPF] [nvarchar](1) NULL,
	[PARLG] [nvarchar](4) NULL,
	[VKORG] [nvarchar](4) NULL,
	[VTWEG] [nvarchar](2) NULL,
	[VSTEL] [nvarchar](4) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[MESBS] [nvarchar](60) NULL,
	[MESST] [nvarchar](1) NULL,
	[OIH_LICNO] [nvarchar](15) NULL,
	[OIG_ITRFL] [nvarchar](1) NULL,
	[OIB_TNKASSIGN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T001W]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T001W](
	[MANDT] [nvarchar](3) NOT NULL,
	[NAME1] [nvarchar](30) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[KUNNR] [nvarchar](10) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[FABKL] [nvarchar](2) NULL,
	[NAME2] [nvarchar](30) NULL,
	[STRAS] [nvarchar](30) NULL,
	[PFACH] [nvarchar](10) NULL,
	[PSTLZ] [nvarchar](10) NULL,
	[ORT01] [nvarchar](25) NULL,
	[EKORG] [nvarchar](4) NULL,
	[CHAZV] [nvarchar](1) NULL,
	[KKOWK] [nvarchar](1) NULL,
	[KORDB] [nvarchar](1) NULL,
	[BEDPL] [nvarchar](1) NULL,
	[LAND1] [nvarchar](3) NULL,
	[REGIO] [nvarchar](3) NULL,
	[COUNC] [nvarchar](3) NULL,
	[CITYC] [nvarchar](4) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[IWERK] [nvarchar](4) NULL,
	[SPART] [nvarchar](2) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[AWSLS] [nvarchar](6) NULL,
	[CHAZV_OLD] [nvarchar](1) NULL,
	[BZIRK] [nvarchar](6) NULL,
	[TAXIW] [nvarchar](1) NULL,
	[BZQHL] [nvarchar](1) NULL,
	[LET01] [decimal](3, 0) NULL,
	[LET02] [decimal](3, 0) NULL,
	[LET03] [decimal](3, 0) NULL,
	[BETOL] [nvarchar](3) NULL,
	[J_1BBRANCH] [nvarchar](4) NULL,
	[FPRFW] [nvarchar](3) NULL,
	[ACHVM] [nvarchar](1) NULL,
	[DVSART] [nvarchar](1) NULL,
	[NODETYPE] [nvarchar](3) NULL,
	[NSCHEMA] [nvarchar](4) NULL,
	[PKOSA] [nvarchar](1) NULL,
	[MISCH] [nvarchar](1) NULL,
	[MGVUPD] [nvarchar](1) NULL,
	[MGVLAUPD] [nvarchar](1) NULL,
	[MGVLAREVAL] [nvarchar](1) NULL,
	[SOURCING] [nvarchar](1) NULL,
	[OILIVAL] [nvarchar](1) NULL,
	[OIHVTYPE] [nvarchar](1) NULL,
	[OIHCREDIPI] [nvarchar](1) NULL,
	[STORETYPE] [nvarchar](1) NULL,
	[DEP_STORE] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T002]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T002](
	[SPRAS] [nvarchar](1) NOT NULL,
	[LASPEZ] [nvarchar](1) NOT NULL,
	[LAHQ] [nvarchar](1) NULL,
	[LAISO] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T003]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T003](
	[MANDT] [nvarchar](3) NOT NULL,
	[BLART] [nvarchar](2) NOT NULL,
	[NUMKR] [nvarchar](2) NULL,
	[KOARS] [nvarchar](5) NULL,
	[STBLA] [nvarchar](2) NULL,
	[XNETB] [nvarchar](1) NULL,
	[XRVUP] [nvarchar](1) NULL,
	[XSYBL] [nvarchar](1) NULL,
	[XVORK] [nvarchar](1) NULL,
	[XKKPR] [nvarchar](1) NULL,
	[XGSUB] [nvarchar](1) NULL,
	[XMGES] [nvarchar](1) NULL,
	[BRGRU] [nvarchar](4) NULL,
	[RECID] [nvarchar](2) NULL,
	[RECIC] [nvarchar](2) NULL,
	[XMTXT] [nvarchar](1) NULL,
	[XMREF] [nvarchar](1) NULL,
	[XNGBK] [nvarchar](1) NULL,
	[KURST] [nvarchar](4) NULL,
	[XNEGP] [nvarchar](1) NULL,
	[XKOAA] [nvarchar](1) NULL,
	[XKOAD] [nvarchar](1) NULL,
	[XKOAK] [nvarchar](1) NULL,
	[XKOAM] [nvarchar](1) NULL,
	[XKOAS] [nvarchar](1) NULL,
	[XNMRL] [nvarchar](1) NULL,
	[XAUSG] [nvarchar](1) NULL,
	[XDTCH] [nvarchar](1) NULL,
	[BLKLS] [nvarchar](1) NULL,
	[XROLLUP] [nvarchar](1) NULL,
	[XPLAN] [nvarchar](1) NULL,
	[XALLOCACT] [nvarchar](1) NULL,
	[XALLOCPLAN] [nvarchar](1) NULL,
	[X_PP_PROCESS] [nvarchar](1) NULL,
	[XMREF2] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T005]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T005](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[LANDK] [nvarchar](3) NOT NULL,
	[LNPLZ] [nvarchar](2) NOT NULL,
	[PRPLZ] [nvarchar](1) NOT NULL,
	[ADDRS] [nvarchar](3) NOT NULL,
	[XPLZS] [nvarchar](1) NOT NULL,
	[XPLPF] [nvarchar](1) NOT NULL,
	[SPRAS] [nvarchar](1) NOT NULL,
	[XLAND] [nvarchar](1) NOT NULL,
	[XADDR] [nvarchar](1) NULL,
	[NMFMT] [nvarchar](2) NULL,
	[XREGS] [nvarchar](1) NULL,
	[XPLST] [nvarchar](1) NULL,
	[INTCA] [nvarchar](2) NULL,
	[INTCA3] [nvarchar](3) NULL,
	[INTCN3] [nvarchar](3) NULL,
	[XEGLD] [nvarchar](1) NULL,
	[XSKFN] [nvarchar](1) NULL,
	[XMWSN] [nvarchar](1) NULL,
	[LNBKN] [nvarchar](2) NULL,
	[PRBKN] [nvarchar](1) NULL,
	[LNBLZ] [nvarchar](2) NULL,
	[PRBLZ] [nvarchar](1) NULL,
	[LNPSK] [nvarchar](2) NULL,
	[PRPSK] [nvarchar](1) NULL,
	[XPRBK] [nvarchar](1) NULL,
	[BNKEY] [nvarchar](1) NULL,
	[LNBKS] [nvarchar](2) NULL,
	[PRBKS] [nvarchar](1) NULL,
	[XPRSO] [nvarchar](1) NULL,
	[PRUIN] [nvarchar](1) NULL,
	[UINLN] [nvarchar](2) NULL,
	[LNST1] [nvarchar](2) NULL,
	[PRST1] [nvarchar](1) NULL,
	[LNST2] [nvarchar](2) NULL,
	[PRST2] [nvarchar](1) NULL,
	[LNST3] [nvarchar](2) NULL,
	[PRST3] [nvarchar](1) NULL,
	[LNST4] [nvarchar](2) NULL,
	[PRST4] [nvarchar](1) NULL,
	[LNST5] [nvarchar](2) NULL,
	[PRST5] [nvarchar](1) NULL,
	[LANDD] [nvarchar](3) NULL,
	[KALSM] [nvarchar](6) NULL,
	[LANDA] [nvarchar](3) NOT NULL,
	[WECHF] [nvarchar](3) NOT NULL,
	[LKVRZ] [nvarchar](7) NOT NULL,
	[INTCN] [nvarchar](3) NOT NULL,
	[XDEZP] [nvarchar](1) NOT NULL,
	[DATFM] [nvarchar](1) NOT NULL,
	[CURIN] [nvarchar](5) NOT NULL,
	[CURHA] [nvarchar](5) NOT NULL,
	[WAERS] [nvarchar](5) NULL,
	[KURST] [nvarchar](4) NULL,
	[AFAPL] [nvarchar](4) NULL,
	[GWGWRT] [decimal](13, 2) NULL,
	[UMRWRT] [decimal](13, 2) NULL,
	[KZRBWB] [nvarchar](1) NULL,
	[XANZUM] [nvarchar](1) NULL,
	[CTNCONCEPT] [nvarchar](4) NULL,
	[KZSRV] [nvarchar](1) NULL,
	[XXINVE] [nvarchar](1) NULL,
	[SUREG] [nvarchar](8) NULL,
	[LANDGRP_VP] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T005S]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T005S](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[BLAND] [nvarchar](3) NOT NULL,
	[FPRCD] [nvarchar](3) NULL,
	[HERBL] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T006]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T006](
	[MANDT] [nvarchar](3) NOT NULL,
	[MSEHI] [nvarchar](3) NOT NULL,
	[KZEX3] [nvarchar](1) NULL,
	[KZEX6] [nvarchar](1) NULL,
	[ANDEC] [smallint] NULL,
	[KZKEH] [nvarchar](1) NULL,
	[KZWOB] [nvarchar](1) NULL,
	[KZ1EH] [nvarchar](1) NULL,
	[KZ2EH] [nvarchar](1) NULL,
	[DIMID] [nvarchar](6) NULL,
	[ZAEHL] [int] NULL,
	[NENNR] [int] NULL,
	[EXP10] [smallint] NULL,
	[ADDKO] [decimal](9, 6) NULL,
	[EXPON] [smallint] NULL,
	[DECAN] [smallint] NULL,
	[ISOCODE] [nvarchar](3) NULL,
	[PRIMARY] [nvarchar](1) NULL,
	[TEMP_VALUE] [float] NULL,
	[TEMP_UNIT] [nvarchar](3) NULL,
	[FAMUNIT] [nvarchar](1) NULL,
	[PRESS_VAL] [float] NULL,
	[PRESS_UNIT] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T007A]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T007A](
	[MANDT] [nvarchar](3) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[MWSKZ] [nvarchar](2) NOT NULL,
	[PRUEF] [nvarchar](1) NULL,
	[MWART] [nvarchar](1) NULL,
	[XMSTU] [nvarchar](1) NULL,
	[ZMWSK] [nvarchar](2) NULL,
	[EGRKZ] [nvarchar](1) NULL,
	[XSLTA] [nvarchar](1) NULL,
	[PROCD] [nvarchar](10) NULL,
	[TXIND] [nvarchar](1) NULL,
	[TXREL] [nvarchar](1) NULL,
	[LSTML] [nvarchar](3) NULL,
	[J_1BUSAGE] [nvarchar](1) NULL,
	[J_1BISS] [nvarchar](1) NULL,
	[J_1BTAXLW1] [nvarchar](3) NULL,
	[J_1BTAXLW2] [nvarchar](3) NULL,
	[J_1BTXICEX] [nvarchar](1) NULL,
	[J_1BTXIPEX] [nvarchar](1) NULL,
	[TOLERANCE] [decimal](3, 1) NULL,
	[ZMWSK_ESA] [nvarchar](2) NULL,
	[ZMWSK_ESE] [nvarchar](2) NULL,
	[NEWDEFTAX] [nvarchar](1) NULL,
	[J_1BTAXLW4] [nvarchar](3) NULL,
	[J_1BTAXLW5] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T008]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T008](
	[MANDT] [nvarchar](3) NOT NULL,
	[ZAHLS] [nvarchar](1) NOT NULL,
	[CHAR1] [nvarchar](1) NULL,
	[XOZSP] [nvarchar](1) NULL,
	[XNCHG] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T009]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T009](
	[MANDT] [nvarchar](3) NULL,
	[PERIV] [nvarchar](2) NULL,
	[XKALE] [nvarchar](1) NULL,
	[XJABH] [nvarchar](1) NULL,
	[ANZBP] [nvarchar](3) NULL,
	[ANZSP] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T012]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T012](
	[MANDT] [nvarchar](3) NOT NULL,
	[BUKRS] [nvarchar](4) NOT NULL,
	[HBKID] [nvarchar](5) NOT NULL,
	[BANKS] [nvarchar](3) NULL,
	[BANKL] [nvarchar](15) NULL,
	[TELF1] [nvarchar](16) NULL,
	[STCD1] [nvarchar](16) NULL,
	[NAME1] [nvarchar](30) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[BUPLA] [nvarchar](4) NULL,
	[VPAST] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T014]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T014](
	[MANDT] [nvarchar](3) NOT NULL,
	[KKBER] [nvarchar](4) NOT NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[STAFO] [nvarchar](6) NOT NULL,
	[PERIV] [nvarchar](2) NOT NULL,
	[CTLPC] [nvarchar](3) NOT NULL,
	[KLIMK] [decimal](15, 2) NOT NULL,
	[SBGRP] [nvarchar](3) NOT NULL,
	[ALLCC] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T015L]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T015L](
	[MANDT] [nvarchar](3) NOT NULL,
	[LZBKZ] [nvarchar](3) NOT NULL,
	[BLART] [nvarchar](1) NULL,
	[LVAWV] [nvarchar](3) NULL,
	[ZWCK1] [nvarchar](70) NULL,
	[ZWCK2] [nvarchar](70) NULL,
	[EDIBL] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T023]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T023](
	[MANDT] [nvarchar](3) NOT NULL,
	[MATKL] [nvarchar](9) NOT NULL,
	[SPART] [nvarchar](2) NOT NULL,
	[LREF3] [nvarchar](3) NOT NULL,
	[WWGDA] [nvarchar](18) NOT NULL,
	[WWGPA] [nvarchar](18) NOT NULL,
	[ABTNR] [nvarchar](4) NOT NULL,
	[BEGRU] [nvarchar](4) NOT NULL,
	[GEWEI] [nvarchar](3) NOT NULL,
	[J_1BNBM] [nvarchar](16) NULL,
	[BKLAS] [nvarchar](4) NULL,
	[EKWSL] [nvarchar](4) NULL,
	[ANLKL] [nvarchar](8) NULL,
	[DEF_SCHDSC] [nvarchar](6) NULL,
	[PRICE_GROUP] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T024]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T024](
	[MANDT] [nvarchar](3) NOT NULL,
	[EKGRP] [nvarchar](3) NOT NULL,
	[EKNAM] [nvarchar](18) NULL,
	[EKTEL] [nvarchar](12) NULL,
	[LDEST] [nvarchar](4) NULL,
	[TELFX] [nvarchar](31) NULL,
	[TEL_NUMBER] [nvarchar](30) NOT NULL,
	[TEL_EXTENS] [nvarchar](10) NOT NULL,
	[SMTP_ADDR] [nvarchar](241) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T024B]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T024B](
	[MANDT] [nvarchar](3) NOT NULL,
	[SBGRP] [nvarchar](3) NOT NULL,
	[KKBER] [nvarchar](4) NOT NULL,
	[STEXT] [nvarchar](30) NOT NULL,
	[SMAIL] [nvarchar](12) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T024D]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T024D](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[DISPO] [nvarchar](3) NOT NULL,
	[DSNAM] [nvarchar](18) NOT NULL,
	[DSTEL] [nvarchar](12) NOT NULL,
	[EKGRP] [nvarchar](3) NOT NULL,
	[MEMPF] [nvarchar](12) NOT NULL,
	[GSBER] [nvarchar](4) NOT NULL,
	[PRCTR] [nvarchar](10) NOT NULL,
	[USRTYP] [nvarchar](2) NOT NULL,
	[USRKEY] [nvarchar](70) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T024E]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T024E](
	[MANDT] [nvarchar](3) NOT NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[EKOTX] [nvarchar](20) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[TXADR] [nvarchar](70) NULL,
	[TXKOP] [nvarchar](70) NULL,
	[TXFUS] [nvarchar](70) NULL,
	[TXGRU] [nvarchar](70) NULL,
	[KALSE] [nvarchar](4) NULL,
	[MKALS] [nvarchar](6) NULL,
	[BPEFF] [nvarchar](1) NULL,
	[BUKRS_NTR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T024F]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T024F](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[FEVOR] [nvarchar](3) NOT NULL,
	[TXT] [nvarchar](30) NOT NULL,
	[SFCPF] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T025]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T025](
	[MANDT] [nvarchar](3) NOT NULL,
	[BKLAS] [nvarchar](4) NOT NULL,
	[KKREF] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T027A]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T027A](
	[MANDT] [nvarchar](3) NOT NULL,
	[EVERS] [nvarchar](2) NOT NULL,
	[EVDRU] [nvarchar](1) NOT NULL,
	[IVERS] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T027C]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T027C](
	[MANDT] [nvarchar](3) NULL,
	[EVERS] [nvarchar](2) NULL,
	[EVERE] [nvarchar](2) NULL,
	[EVPKT] [decimal](3, 0) NULL,
	[EVXOK] [nvarchar](1) NULL,
	[EVTXT] [nvarchar](70) NULL,
	[EVDRK] [nvarchar](1) NULL,
	[EVDRL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T042Z]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T042Z](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[ZLSCH] [nvarchar](1) NOT NULL,
	[TEXT1] [nvarchar](30) NULL,
	[XBKKT] [nvarchar](1) NULL,
	[XSTRA] [nvarchar](1) NULL,
	[XEINZ] [nvarchar](1) NULL,
	[XESRD] [nvarchar](1) NULL,
	[XPGIR] [nvarchar](1) NULL,
	[XEZER] [nvarchar](1) NULL,
	[XSCHK] [nvarchar](1) NULL,
	[PROGN] [nvarchar](40) NULL,
	[XZWHR] [nvarchar](1) NULL,
	[XEURO] [nvarchar](1) NULL,
	[FORMI] [nvarchar](30) NULL,
	[FORMZ] [nvarchar](6) NULL,
	[XWECH] [nvarchar](1) NULL,
	[XWANF] [nvarchar](1) NULL,
	[XPSKT] [nvarchar](1) NULL,
	[XWECS] [nvarchar](1) NULL,
	[BLART] [nvarchar](2) NULL,
	[BLARV] [nvarchar](2) NULL,
	[UMSKZ] [nvarchar](1) NULL,
	[XSWEC] [nvarchar](1) NULL,
	[TXTSL] [nvarchar](2) NULL,
	[ZLSTN] [nvarchar](6) NULL,
	[WLSTN] [nvarchar](6) NULL,
	[XZANF] [nvarchar](1) NULL,
	[XAKTZ] [nvarchar](1) NULL,
	[WEART] [nvarchar](2) NULL,
	[XNOPO] [nvarchar](1) NULL,
	[XORB] [nvarchar](1) NULL,
	[XIBAN] [nvarchar](1) NULL,
	[XNO_ACCNO] [nvarchar](1) NULL,
	[XSEPA] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T059Q]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T059Q](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[QSSKZ] [nvarchar](2) NOT NULL,
	[QSCOD] [nvarchar](4) NULL,
	[QSBEZ] [nvarchar](40) NULL,
	[QPROZ] [decimal](5, 2) NULL,
	[QSATZ] [decimal](4, 2) NULL,
	[XNTTO] [nvarchar](1) NULL,
	[XQSBZ] [nvarchar](1) NULL,
	[QSATR] [decimal](4, 2) NULL,
	[XQFOR] [nvarchar](1) NULL,
	[QMIND] [decimal](13, 2) NULL,
	[QMIWA] [nvarchar](5) NULL,
	[BLAND] [nvarchar](3) NULL,
	[FPRCD] [nvarchar](3) NULL,
	[QEKAR] [nvarchar](4) NULL,
	[QSATS] [decimal](4, 2) NULL,
	[J_1ISECTIO] [nvarchar](10) NULL,
	[J_1ITXVNTY] [nvarchar](1) NULL,
	[J_1IXVNDS] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T064B]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T064B](
	[SPRAS] [nvarchar](1) NOT NULL,
	[BSTAR] [nvarchar](1) NOT NULL,
	[BTEXT] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T134]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T134](
	[MANDT] [nvarchar](3) NOT NULL,
	[MTART] [nvarchar](4) NOT NULL,
	[MTREF] [nvarchar](4) NULL,
	[MBREF] [nvarchar](4) NULL,
	[FLREF] [nvarchar](4) NULL,
	[NUMKI] [nvarchar](2) NULL,
	[NUMKE] [nvarchar](2) NULL,
	[ENVOP] [nvarchar](1) NULL,
	[BSEXT] [nvarchar](1) NULL,
	[BSINT] [nvarchar](1) NULL,
	[PSTAT] [nvarchar](15) NULL,
	[KKREF] [nvarchar](4) NULL,
	[VPRSV] [nvarchar](1) NULL,
	[KZVPR] [nvarchar](1) NULL,
	[VMTPO] [nvarchar](4) NULL,
	[EKALR] [nvarchar](1) NULL,
	[KZGRP] [nvarchar](1) NULL,
	[KZKFG] [nvarchar](1) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[KZPRC] [nvarchar](1) NULL,
	[KZPIP] [nvarchar](1) NULL,
	[PRDRU] [nvarchar](1) NULL,
	[ARANZ] [nvarchar](1) NULL,
	[WMAKG] [nvarchar](1) NULL,
	[IZUST] [nvarchar](1) NULL,
	[ARDEL] [nvarchar](4) NULL,
	[KZMPN] [nvarchar](1) NULL,
	[MSTAE] [nvarchar](2) NULL,
	[CCHIS] [nvarchar](1) NULL,
	[CTYPE] [nvarchar](3) NULL,
	[CLASS] [nvarchar](18) NULL,
	[CHNEU] [nvarchar](1) NULL,
	[VTYPE] [nvarchar](10) NULL,
	[VNUMKI] [nvarchar](2) NULL,
	[VNUMKE] [nvarchar](2) NULL,
	[KZRAC] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T141]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T141](
	[MANDT] [nvarchar](3) NOT NULL,
	[MMSTA] [nvarchar](2) NOT NULL,
	[DEINK] [nvarchar](1) NOT NULL,
	[DSTLK] [nvarchar](1) NOT NULL,
	[DSTLP] [nvarchar](1) NOT NULL,
	[DAPLA] [nvarchar](1) NOT NULL,
	[DPBED] [nvarchar](1) NOT NULL,
	[DDISP] [nvarchar](1) NOT NULL,
	[DFAPO] [nvarchar](1) NOT NULL,
	[DFAKO] [nvarchar](1) NOT NULL,
	[DINST] [nvarchar](1) NOT NULL,
	[DBEST] [nvarchar](1) NOT NULL,
	[DPROG] [nvarchar](1) NOT NULL,
	[DFHMI] [nvarchar](1) NOT NULL,
	[DQMPF] [nvarchar](1) NOT NULL,
	[DTBED] [nvarchar](1) NOT NULL,
	[DTAUF] [nvarchar](1) NOT NULL,
	[DERZK] [nvarchar](1) NOT NULL,
	[DLFPL] [nvarchar](1) NOT NULL,
	[DLOCK] [nvarchar](1) NULL,
	[AUPRF] [nvarchar](10) NULL,
	[JSPPP] [nvarchar](1) NULL,
	[JSPPO] [nvarchar](1) NULL,
	[JSPR2P] [nvarchar](1) NULL,
	[JSPRPO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T147G]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T147G](
	[MANDT] [nvarchar](3) NOT NULL,
	[HKRIT] [nvarchar](2) NOT NULL,
	[KRTXT] [nvarchar](20) NOT NULL,
	[KURZTXT] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T147J]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T147J](
	[MANDT] [nvarchar](3) NOT NULL,
	[GEWSL] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T148]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T148](
	[MANDT] [nvarchar](3) NOT NULL,
	[SOBKZ] [nvarchar](1) NOT NULL,
	[SOBFI] [nvarchar](1) NOT NULL,
	[SOBLO] [nvarchar](1) NOT NULL,
	[SOBVO] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T149]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T149](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[BWTTY] [nvarchar](1) NOT NULL,
	[VBWAF] [nvarchar](10) NOT NULL,
	[KZVBF] [nvarchar](1) NOT NULL,
	[VBWAE] [nvarchar](10) NOT NULL,
	[KZVBE] [nvarchar](1) NOT NULL,
	[KZBAA] [nvarchar](1) NOT NULL,
	[VBWAA] [nvarchar](10) NOT NULL,
	[KZVBA] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T149C]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T149C](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWTTY] [nvarchar](1) NOT NULL,
	[VBWAF] [nvarchar](10) NOT NULL,
	[KZVBF] [nvarchar](1) NOT NULL,
	[VBWAE] [nvarchar](10) NOT NULL,
	[KZVBE] [nvarchar](1) NOT NULL,
	[KZBAA] [nvarchar](1) NOT NULL,
	[VBWAA] [nvarchar](10) NOT NULL,
	[KZVBA] [nvarchar](1) NOT NULL,
	[RSTBW] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T149D]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T149D](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWTAR] [nvarchar](10) NOT NULL,
	[KKREF] [nvarchar](4) NOT NULL,
	[BSEXT] [nvarchar](1) NOT NULL,
	[BSINT] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T151]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T151](
	[MANDT] [nvarchar](3) NOT NULL,
	[KDGRP] [nvarchar](2) NOT NULL,
	[BEZBG] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T156]    Script Date: 10/15/2014 5:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T156](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWART] [nvarchar](3) NOT NULL,
	[SHKZG] [nvarchar](1) NOT NULL,
	[KZWES] [nvarchar](1) NOT NULL,
	[KZVBU] [nvarchar](1) NOT NULL,
	[KZDRU] [nvarchar](1) NOT NULL,
	[KZKON] [nvarchar](1) NOT NULL,
	[CHNEU] [nvarchar](1) NOT NULL,
	[KZZDE] [nvarchar](1) NOT NULL,
	[RSTYP] [nvarchar](1) NOT NULL,
	[SELPA] [nvarchar](10) NOT NULL,
	[XLAUT] [nvarchar](1) NOT NULL,
	[KZSTR] [nvarchar](1) NOT NULL,
	[KZGRU] [nvarchar](1) NOT NULL,
	[XINVB] [nvarchar](1) NOT NULL,
	[QSSBW] [nvarchar](1) NOT NULL,
	[KZBWA] [nvarchar](2) NOT NULL,
	[XSTBW] [nvarchar](1) NOT NULL,
	[XPBED] [nvarchar](1) NOT NULL,
	[XWSBR] [nvarchar](1) NOT NULL,
	[KZMHD] [nvarchar](1) NOT NULL,
	[KZCLA] [nvarchar](1) NOT NULL,
	[XKOKO] [nvarchar](1) NOT NULL,
	[XKCFC] [nvarchar](1) NOT NULL,
	[XNEBE] [nvarchar](1) NOT NULL,
	[J_1BNFREL] [nvarchar](1) NULL,
	[J_1BNFTYPE] [nvarchar](2) NULL,
	[J_1BITMTYP] [nvarchar](2) NULL,
	[J_1BSPCSTO] [nvarchar](2) NULL,
	[J_1BPARTYP] [nvarchar](1) NULL,
	[J_1BPARVW] [nvarchar](2) NULL,
	[RULES] [nvarchar](4) NULL,
	[J_1AREVIDX] [nvarchar](1) NULL,
	[J_1ADOCCL] [nvarchar](1) NULL,
	[J_1AEXPKZ] [nvarchar](1) NULL,
	[XOARC] [nvarchar](1) NULL,
	[BUSTR] [nvarchar](3) NULL,
	[KZDIR] [nvarchar](1) NULL,
	[OIJ1BNFFI] [nvarchar](1) NULL,
	[MILL_CPCONF] [nvarchar](1) NULL,
	[CO_WIPB_CPCONF] [nvarchar](1) NULL,
	[XWIPB] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T157D]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T157D](
	[MANDT] [nvarchar](3) NULL,
	[BWART] [nvarchar](3) NULL,
	[GRUND] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T158V]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T158V](
	[VGART] [nvarchar](2) NULL,
	[XVORG] [nvarchar](1) NULL,
	[J_1BNFREL] [nvarchar](1) NULL,
	[XMKPF] [nvarchar](1) NULL,
	[XIKPF] [nvarchar](1) NULL,
	[XRKPF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T159C]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T159C](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[ABCIN] [nvarchar](1) NOT NULL,
	[ANINV] [nvarchar](3) NULL,
	[ININV] [nvarchar](3) NULL,
	[PZINV] [nvarchar](2) NULL,
	[CCDEV] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T161]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T161](
	[MANDT] [nvarchar](3) NOT NULL,
	[BSTYP] [nvarchar](1) NOT NULL,
	[BSART] [nvarchar](4) NOT NULL,
	[BSAKZ] [nvarchar](1) NOT NULL,
	[PINCR] [nvarchar](5) NOT NULL,
	[NUMKI] [nvarchar](2) NOT NULL,
	[NUMKE] [nvarchar](2) NOT NULL,
	[BREFN] [nvarchar](20) NOT NULL,
	[REFBA] [nvarchar](4) NOT NULL,
	[ABVOR] [nvarchar](1) NOT NULL,
	[STAFO] [nvarchar](6) NOT NULL,
	[UPINC] [nvarchar](5) NOT NULL,
	[STAKO] [nvarchar](1) NOT NULL,
	[PARGR] [nvarchar](4) NOT NULL,
	[NUMKA] [nvarchar](2) NOT NULL,
	[HITYP] [nvarchar](1) NULL,
	[LPHIS] [nvarchar](1) NULL,
	[GSFRG] [nvarchar](1) NULL,
	[VARIANTE] [nvarchar](10) NULL,
	[SHENQ] [nvarchar](1) NULL,
	[KZALE] [nvarchar](1) NULL,
	[ABGEBOT] [nvarchar](1) NULL,
	[KORNR] [nvarchar](1) NULL,
	[UMLIF] [nvarchar](1) NULL,
	[KOETT] [nvarchar](1) NULL,
	[AR_OBJECT] [nvarchar](10) NULL,
	[KOAKO] [nvarchar](1) NULL,
	[OICSEGI] [nvarchar](1) NULL,
	[OIRFQREQ] [nvarchar](1) NULL,
	[WVVKZ] [nvarchar](1) NULL,
	[XLOKZ] [nvarchar](1) NULL,
	[CP_AKTIVE] [nvarchar](1) NULL,
	[CPTYPE] [nvarchar](1) NULL,
	[FLS_RSTO] [nvarchar](1) NULL,
	[MSR_ACTIVE] [nvarchar](1) NULL,
	[NUMKC] [nvarchar](2) NOT NULL,
	[/SAPMP/CEACT] [nvarchar](1) NULL,
	[/SAPMP/PDACT] [nvarchar](1) NULL,
	[/SAPMP/PPROT] [nvarchar](1) NULL,
	[/SAPMP/PUSER] [nvarchar](1) NULL,
	[/SAPMP/PAUSW] [nvarchar](1) NULL,
	[/SAPMP/ATNAM] [nvarchar](30) NULL,
	[/SAPMP/GAUF] [nvarchar](1) NULL,
	[TOLSL] [nvarchar](4) NULL,
	[MILL_OMKZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T161S]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T161S](
	[MANDT] [nvarchar](3) NOT NULL,
	[FRGKZ] [nvarchar](1) NOT NULL,
	[FIXBP] [nvarchar](1) NULL,
	[FRANG] [nvarchar](1) NULL,
	[FRBST] [nvarchar](1) NULL,
	[FLREF] [nvarchar](20) NULL,
	[KZFAE] [nvarchar](1) NULL,
	[TLFAE] [decimal](4, 1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163](
	[MANDT] [nvarchar](3) NOT NULL,
	[PSTYP] [nvarchar](1) NOT NULL,
	[MATNO] [nvarchar](1) NOT NULL,
	[KNTZU] [nvarchar](1) NOT NULL,
	[BFKNZ] [nvarchar](1) NOT NULL,
	[WEPOS] [nvarchar](1) NOT NULL,
	[WEPOV] [nvarchar](1) NOT NULL,
	[WEUNB] [nvarchar](1) NOT NULL,
	[WEUNV] [nvarchar](1) NOT NULL,
	[REPOS] [nvarchar](1) NOT NULL,
	[REPOV] [nvarchar](1) NOT NULL,
	[STAFO] [nvarchar](6) NOT NULL,
	[J_1BITMTYP] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163B]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163B](
	[MANDT] [nvarchar](3) NOT NULL,
	[BEWTP] [nvarchar](1) NOT NULL,
	[TBTKZ] [nvarchar](1) NOT NULL,
	[PRSPR] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163E]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163E](
	[MANDT] [nvarchar](3) NOT NULL,
	[EBTYP] [nvarchar](2) NOT NULL,
	[KZDIS] [nvarchar](1) NULL,
	[WEREL] [nvarchar](1) NULL,
	[WEZUO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163K]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163K](
	[MANDT] [nvarchar](3) NOT NULL,
	[KNTTP] [nvarchar](1) NOT NULL,
	[KZVBR] [nvarchar](1) NOT NULL,
	[KNTAE] [nvarchar](1) NOT NULL,
	[REUPD] [nvarchar](1) NOT NULL,
	[WEPOS] [nvarchar](1) NOT NULL,
	[WEPOV] [nvarchar](1) NOT NULL,
	[WEUNB] [nvarchar](1) NOT NULL,
	[WEUNV] [nvarchar](1) NOT NULL,
	[REPOS] [nvarchar](1) NOT NULL,
	[REPOV] [nvarchar](1) NOT NULL,
	[KOMOK] [nvarchar](3) NOT NULL,
	[KNTDY] [nvarchar](1) NOT NULL,
	[SOBKZ] [nvarchar](1) NOT NULL,
	[KONAB] [nvarchar](1) NOT NULL,
	[TAXIK] [nvarchar](1) NOT NULL,
	[XBNSB] [nvarchar](1) NULL,
	[VRTKZ] [nvarchar](1) NULL,
	[TWRKZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163L]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163L](
	[MANDT] [nvarchar](3) NOT NULL,
	[BSTAE] [nvarchar](4) NOT NULL,
	[AAGEN] [nvarchar](1) NULL,
	[PODREL] [nvarchar](1) NULL,
	[QTYDH] [nvarchar](8) NULL,
	[IDT_TRACK_IND] [nvarchar](1) NULL,
	[COMPL_COMPL_IND] [nvarchar](1) NULL,
	[ASN_INBOUND_AUTO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163P]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163P](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[ABUEB] [nvarchar](4) NOT NULL,
	[RUSKZ] [nvarchar](1) NULL,
	[FRUSA] [nvarchar](1) NULL,
	[LRUSA] [nvarchar](1) NULL,
	[FABHO] [nvarchar](3) NULL,
	[LABHO] [nvarchar](3) NULL,
	[FKAGG] [nvarchar](3) NULL,
	[LKAGG] [nvarchar](3) NULL,
	[FTAGG] [nvarchar](3) NULL,
	[LTAGG] [nvarchar](3) NULL,
	[FPAGG] [nvarchar](3) NULL,
	[FKALA] [nvarchar](3) NULL,
	[LPAGG] [nvarchar](3) NULL,
	[LKALA] [nvarchar](3) NULL,
	[LWAGG] [nvarchar](3) NULL,
	[LMAGG] [nvarchar](3) NULL,
	[FKUEB] [nvarchar](1) NULL,
	[LKUEB] [nvarchar](1) NULL,
	[FTUEB] [nvarchar](1) NULL,
	[LTUEB] [nvarchar](1) NULL,
	[FPUEB] [nvarchar](1) NULL,
	[FKALU] [nvarchar](3) NULL,
	[LPUEB] [nvarchar](1) NULL,
	[LKALU] [nvarchar](3) NULL,
	[FWUEB] [nvarchar](1) NULL,
	[LWUEB] [nvarchar](1) NULL,
	[LMUEB] [nvarchar](1) NULL,
	[LPLT1] [nvarchar](3) NULL,
	[LPLT2] [nvarchar](3) NULL,
	[LPLT3] [nvarchar](3) NULL,
	[FPLT1] [nvarchar](3) NULL,
	[FPLT2] [nvarchar](3) NULL,
	[FPLT3] [nvarchar](3) NULL,
	[LOTO1] [nvarchar](3) NULL,
	[LOTO2] [nvarchar](3) NULL,
	[LOTO3] [nvarchar](3) NULL,
	[FOTO1] [nvarchar](3) NULL,
	[FOTO2] [nvarchar](3) NULL,
	[FOTO3] [nvarchar](3) NULL,
	[LUTO1] [nvarchar](3) NULL,
	[LUTO2] [nvarchar](3) NULL,
	[LUTO3] [nvarchar](3) NULL,
	[FUTO1] [nvarchar](3) NULL,
	[FUTO2] [nvarchar](3) NULL,
	[FUTO3] [nvarchar](3) NULL,
	[LPRA1] [nvarchar](1) NULL,
	[LPRA2] [nvarchar](1) NULL,
	[LPRA3] [nvarchar](1) NULL,
	[FPRA1] [nvarchar](1) NULL,
	[FPRA2] [nvarchar](1) NULL,
	[FPRA3] [nvarchar](1) NULL,
	[LRUEC] [nvarchar](1) NULL,
	[FRUEC] [nvarchar](1) NULL,
	[FAEODT] [nvarchar](1) NULL,
	[FAEN] [nvarchar](1) NULL,
	[FDT] [nvarchar](1) NULL,
	[FAEUDT] [nvarchar](1) NULL,
	[FNO] [nvarchar](1) NULL,
	[LAEODT] [nvarchar](1) NULL,
	[LAEN] [nvarchar](1) NULL,
	[LDT] [nvarchar](1) NULL,
	[LAEUDT] [nvarchar](1) NULL,
	[LNO] [nvarchar](1) NULL,
	[FPRHO] [nvarchar](3) NULL,
	[LPRHO] [nvarchar](3) NULL,
	[IFAB] [nvarchar](1) NULL,
	[ILAB] [nvarchar](1) NULL,
	[FBEST] [nvarchar](1) NULL,
	[LBEST] [nvarchar](1) NULL,
	[LAGGR] [nvarchar](1) NULL,
	[FRSVZ] [nvarchar](1) NULL,
	[LRSVZ] [nvarchar](1) NULL,
	[FVWE] [nvarchar](1) NULL,
	[LWE] [nvarchar](1) NULL,
	[FZWEFZ] [nvarchar](1) NULL,
	[LZWEFZ] [nvarchar](1) NULL,
	[FAASN] [nvarchar](1) NULL,
	[LAASN] [nvarchar](1) NULL,
	[FAWE] [nvarchar](1) NULL,
	[LAWE] [nvarchar](1) NULL,
	[FSORT1] [nvarchar](30) NULL,
	[LSORT1] [nvarchar](30) NULL,
	[FSORT2] [nvarchar](30) NULL,
	[LSORT2] [nvarchar](30) NULL,
	[FSORT3] [nvarchar](30) NULL,
	[LSORT3] [nvarchar](30) NULL,
	[FBMAIL] [nvarchar](1) NULL,
	[LBMAIL] [nvarchar](1) NULL,
	[FLMAIL] [nvarchar](1) NULL,
	[LLMAIL] [nvarchar](1) NULL,
	[FPAGE2] [nvarchar](1) NULL,
	[FLASTDEL] [nvarchar](1) NULL,
	[FCHANGES] [nvarchar](1) NULL,
	[FPACKING] [nvarchar](1) NULL,
	[FFOLLOWM] [nvarchar](1) NULL,
	[FSUBCON] [nvarchar](1) NULL,
	[LSTOPPLT1] [nvarchar](3) NULL,
	[LSTOPPLT2] [nvarchar](3) NULL,
	[LSTOPPLT3] [nvarchar](3) NULL,
	[FSTOPPLT1] [nvarchar](3) NULL,
	[FSTOPPLT2] [nvarchar](3) NULL,
	[FSTOPPLT3] [nvarchar](3) NULL,
	[LSTOPOTO1] [nvarchar](3) NULL,
	[LSTOPOTO2] [nvarchar](3) NULL,
	[LSTOPOTO3] [nvarchar](3) NULL,
	[FSTOPOTO1] [nvarchar](3) NULL,
	[FSTOPOTO2] [nvarchar](3) NULL,
	[FSTOPOTO3] [nvarchar](3) NULL,
	[LSTOPUTO1] [nvarchar](3) NULL,
	[LSTOPUTO2] [nvarchar](3) NULL,
	[LSTOPUTO3] [nvarchar](3) NULL,
	[FSTOPUTO1] [nvarchar](3) NULL,
	[FSTOPUTO2] [nvarchar](3) NULL,
	[FSTOPUTO3] [nvarchar](3) NULL,
	[LSTOPPRA1] [nvarchar](1) NULL,
	[LSTOPPRA2] [nvarchar](1) NULL,
	[LSTOPPRA3] [nvarchar](1) NULL,
	[FSTOPPRA1] [nvarchar](1) NULL,
	[FSTOPPRA2] [nvarchar](1) NULL,
	[FSTOPPRA3] [nvarchar](1) NULL,
	[FABREV] [nvarchar](1) NULL,
	[LABREV] [nvarchar](1) NULL,
	[FANACHF] [nvarchar](1) NULL,
	[LANACHF] [nvarchar](1) NULL,
	[FSTOPPRHO] [nvarchar](3) NULL,
	[LSTOPPRHO] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T163RC]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T163RC](
	[MANDT] [nvarchar](3) NOT NULL,
	[AA_FINAL_REASON] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T165R]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T165R](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABSGR] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T167F]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T167F](
	[MANDT] [nvarchar](3) NOT NULL,
	[FORMELNR] [nvarchar](10) NOT NULL,
	[FORMEL] [nvarchar](65) NULL,
	[MEINS] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T169H]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T169H](
	[MANDT] [nvarchar](3) NOT NULL,
	[ERFPR] [nvarchar](12) NOT NULL,
	[BPSOR] [nvarchar](1) NULL,
	[RVMNG] [nvarchar](1) NULL,
	[GVMNG] [nvarchar](1) NULL,
	[STDYN] [nvarchar](4) NULL,
	[REPART] [nvarchar](1) NULL,
	[XWOUT] [nvarchar](1) NULL,
	[XIOUT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T16FB]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T16FB](
	[MANDT] [nvarchar](3) NOT NULL,
	[FRGKE] [nvarchar](1) NOT NULL,
	[KZFRE] [nvarchar](1) NOT NULL,
	[KZFAE] [nvarchar](1) NOT NULL,
	[TLFAE] [decimal](4, 1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T16FG]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T16FG](
	[MANDT] [nvarchar](3) NOT NULL,
	[FRGGR] [nvarchar](2) NOT NULL,
	[FRGOT] [nvarchar](1) NOT NULL,
	[FRGFG] [nvarchar](1) NULL,
	[FRGKL] [nvarchar](18) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T16FS]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T16FS](
	[MANDT] [nvarchar](3) NOT NULL,
	[FRGGR] [nvarchar](2) NOT NULL,
	[FRGSX] [nvarchar](2) NOT NULL,
	[FRGC1] [nvarchar](2) NOT NULL,
	[FRGC2] [nvarchar](2) NOT NULL,
	[FRGC3] [nvarchar](2) NOT NULL,
	[FRGC4] [nvarchar](2) NOT NULL,
	[FRGC5] [nvarchar](2) NOT NULL,
	[FRGC6] [nvarchar](2) NOT NULL,
	[FRGC7] [nvarchar](2) NOT NULL,
	[FRGC8] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T171]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T171](
	[MANDT] [nvarchar](3) NOT NULL,
	[BZIRK] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T173]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T173](
	[MANDT] [nvarchar](3) NOT NULL,
	[VSART] [nvarchar](2) NOT NULL,
	[VKTRA] [nvarchar](2) NULL,
	[VSGRP] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T179]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T179](
	[MANDT] [nvarchar](3) NOT NULL,
	[PRODH] [nvarchar](18) NOT NULL,
	[STUFE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T300]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T300](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[REGKZ] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T301]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T301](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[LGTYP] [nvarchar](3) NOT NULL,
	[GLCGR] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T30B]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T30B](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[LGTOR] [nvarchar](3) NOT NULL,
	[LGBZO] [nvarchar](10) NULL,
	[WATKZ] [nvarchar](1) NULL,
	[WETKZ] [nvarchar](1) NULL,
	[CDTKZ] [nvarchar](1) NULL,
	[FTTKZ] [nvarchar](1) NULL,
	[GLCGR] [nvarchar](3) NULL,
	[PLCTY] [nvarchar](2) NULL,
	[BLIND] [nvarchar](1) NULL,
	[BLRSN] [nvarchar](2) NULL,
	[YRGLN] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T30C]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T30C](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[LGBZO] [nvarchar](10) NOT NULL,
	[LGTOR] [nvarchar](3) NULL,
	[WATKZ] [nvarchar](1) NULL,
	[WETKZ] [nvarchar](1) NULL,
	[CDTKZ] [nvarchar](1) NULL,
	[FTTKZ] [nvarchar](1) NULL,
	[BORGR_HUCKZ] [nvarchar](1) NULL,
	[GLCGR] [nvarchar](3) NULL,
	[PLCTY] [nvarchar](2) NULL,
	[BLIND] [nvarchar](1) NULL,
	[BLRSN] [nvarchar](2) NULL,
	[YRGLN] [nvarchar](10) NULL,
	[LZONE] [nvarchar](10) NULL,
	[XCORD] [decimal](10, 3) NULL,
	[YCORD] [decimal](10, 3) NULL,
	[ZCORD] [decimal](10, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T333]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T333](
	[MANDT] [nvarchar](3) NOT NULL,
	[LGNUM] [nvarchar](3) NOT NULL,
	[BWLVS] [nvarchar](3) NOT NULL,
	[TRART] [nvarchar](1) NOT NULL,
	[VLTYP] [nvarchar](3) NOT NULL,
	[VLPLA] [nvarchar](10) NOT NULL,
	[NLTYP] [nvarchar](3) NOT NULL,
	[NLPLA] [nvarchar](10) NOT NULL,
	[RLTYP] [nvarchar](3) NOT NULL,
	[RLPLA] [nvarchar](10) NOT NULL,
	[BETYP] [nvarchar](1) NOT NULL,
	[TBOBL] [nvarchar](1) NOT NULL,
	[DRUKZ] [nvarchar](2) NOT NULL,
	[SQUIT] [nvarchar](1) NOT NULL,
	[TBMAN] [nvarchar](1) NOT NULL,
	[DUNKL] [nvarchar](1) NOT NULL,
	[VQUIT] [nvarchar](1) NOT NULL,
	[TBPRI] [nvarchar](1) NOT NULL,
	[WEDAT] [nvarchar](1) NOT NULL,
	[LPMAN] [nvarchar](1) NOT NULL,
	[VKDYN] [nvarchar](1) NOT NULL,
	[NKDYN] [nvarchar](1) NOT NULL,
	[ABILD] [nvarchar](1) NOT NULL,
	[FEHLT] [nvarchar](1) NOT NULL,
	[VFIXP] [nvarchar](1) NOT NULL,
	[NFIXP] [nvarchar](1) NOT NULL,
	[KZUAP] [nvarchar](1) NOT NULL,
	[BWREF] [nvarchar](3) NOT NULL,
	[UELIE] [nvarchar](1) NOT NULL,
	[AUTTA] [nvarchar](1) NOT NULL,
	[ZUSTE] [nvarchar](1) NOT NULL,
	[CHSWM] [nvarchar](6) NOT NULL,
	[QBILD] [nvarchar](1) NULL,
	[RULES] [nvarchar](4) NULL,
	[VEPST] [nvarchar](1) NULL,
	[DBILD] [nvarchar](1) NULL,
	[NO2ST] [nvarchar](1) NULL,
	[PIKTA] [nvarchar](1) NULL,
	[WMMUE] [nvarchar](1) NULL,
	[XDREL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T377P]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T377P](
	[MANDT] [nvarchar](3) NOT NULL,
	[SERAIL] [nvarchar](4) NOT NULL,
	[SERSCHA] [nvarchar](18) NULL,
	[SEREX] [nvarchar](1) NULL,
	[EQTYP] [nvarchar](1) NULL,
	[BSTVP] [nvarchar](1) NULL,
	[IUID_COMPATIBLE] [nvarchar](1) NULL,
	[UID_USED] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T413]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T413](
	[MANDT] [nvarchar](3) NOT NULL,
	[ERSKZ] [nvarchar](1) NOT NULL,
	[KZERS] [nvarchar](1) NOT NULL,
	[CRITICAL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T416]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T416](
	[MANDT] [nvarchar](3) NOT NULL,
	[STLAN] [nvarchar](1) NOT NULL,
	[PMPFE] [nvarchar](1) NOT NULL,
	[PMPKO] [nvarchar](1) NOT NULL,
	[PMPKA] [nvarchar](1) NOT NULL,
	[PMPRV] [nvarchar](1) NOT NULL,
	[PMPVS] [nvarchar](1) NOT NULL,
	[PMPIN] [nvarchar](1) NOT NULL,
	[PMPER] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T417]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T417](
	[MANDT] [nvarchar](3) NOT NULL,
	[BEIKZ] [nvarchar](1) NOT NULL,
	[KZBKD] [nvarchar](1) NOT NULL,
	[KZBLF] [nvarchar](1) NOT NULL,
	[KZBRS] [nvarchar](1) NULL,
	[ADSUB_DEFDLV] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T418]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T418](
	[MANDT] [nvarchar](3) NOT NULL,
	[POSTP] [nvarchar](1) NOT NULL,
	[MATIN] [nvarchar](1) NOT NULL,
	[KZBSF] [nvarchar](1) NOT NULL,
	[TXPOS] [nvarchar](1) NOT NULL,
	[RTPOS] [nvarchar](1) NOT NULL,
	[KLPOS] [nvarchar](1) NOT NULL,
	[BTPOS] [nvarchar](1) NOT NULL,
	[DKPOS] [nvarchar](1) NOT NULL,
	[MNGVZ] [nvarchar](1) NOT NULL,
	[KZUPS] [nvarchar](1) NOT NULL,
	[PSTRG] [nvarchar](4) NOT NULL,
	[INPOS] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T418F]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T418F](
	[MANDT] [nvarchar](3) NOT NULL,
	[RFORM] [nvarchar](2) NOT NULL,
	[FORMEL] [nvarchar](65) NOT NULL,
	[RFDIM] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T434G]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T434G](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[EPRIO] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T434R]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T434R](
	[MANDT] [nvarchar](3) NOT NULL,
	[RULES] [nvarchar](4) NOT NULL,
	[CONS_RULES] [nvarchar](4) NULL,
	[CONS_HND_BF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T436A]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T436A](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[FHORI] [nvarchar](3) NOT NULL,
	[ERHOR] [nvarchar](3) NOT NULL,
	[SICHZ] [nvarchar](3) NOT NULL,
	[VORGZ] [nvarchar](3) NOT NULL,
	[FREIZ] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T437S]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T437S](
	[MANDT] [nvarchar](3) NOT NULL,
	[SFPRO] [nvarchar](4) NOT NULL,
	[AUART] [nvarchar](4) NULL,
	[BACKF] [nvarchar](1) NULL,
	[KSART] [nvarchar](4) NULL,
	[LABOR] [nvarchar](1) NULL,
	[BWAWA] [nvarchar](3) NULL,
	[BWAWE] [nvarchar](3) NULL,
	[REDST] [nvarchar](1) NULL,
	[REDHZ] [decimal](3, 0) NULL,
	[BAKOR] [nvarchar](1) NULL,
	[RRETR] [nvarchar](1) NULL,
	[REPPT] [nvarchar](1) NULL,
	[AUTOWE] [nvarchar](1) NULL,
	[BWASC] [nvarchar](3) NULL,
	[BWACO] [nvarchar](3) NULL,
	[BWAWEM] [nvarchar](3) NULL,
	[XFAN1] [nvarchar](1) NULL,
	[BWAWAM] [nvarchar](3) NULL,
	[BWACR] [nvarchar](3) NULL,
	[PLGEN] [nvarchar](1) NULL,
	[BWAWES] [nvarchar](3) NULL,
	[BWAWAS] [nvarchar](3) NULL,
	[BWASCS] [nvarchar](3) NULL,
	[BWACOS] [nvarchar](3) NULL,
	[BWAWEMS] [nvarchar](3) NULL,
	[BWAWAMS] [nvarchar](3) NULL,
	[BWACRS] [nvarchar](3) NULL,
	[BCKFL] [nvarchar](1) NULL,
	[AGREQ] [nvarchar](1) NULL,
	[NODUM] [nvarchar](1) NULL,
	[PRZST] [nvarchar](4) NULL,
	[CHSMM] [nvarchar](6) NULL,
	[RULES] [nvarchar](4) NULL,
	[BWULACT] [nvarchar](1) NULL,
	[KZTTZ] [nvarchar](1) NOT NULL,
	[RP_KANBAN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T437V]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T437V](
	[MANDT] [nvarchar](3) NULL,
	[WERKS] [nvarchar](4) NULL,
	[VERTL] [nvarchar](4) NULL,
	[FUNCT] [nvarchar](3) NULL,
	[FNART] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T438A]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T438A](
	[MANDT] [nvarchar](3) NOT NULL,
	[DISMM] [nvarchar](2) NOT NULL,
	[DISVF] [nvarchar](1) NOT NULL,
	[PROKZ] [nvarchar](1) NOT NULL,
	[PROVB] [nvarchar](1) NOT NULL,
	[PROOS] [nvarchar](1) NOT NULL,
	[KZSIB] [nvarchar](1) NOT NULL,
	[KZMEB] [nvarchar](1) NOT NULL,
	[PRRED] [nvarchar](1) NULL,
	[FXART] [nvarchar](1) NOT NULL,
	[RESPL] [nvarchar](1) NOT NULL,
	[KZREG] [nvarchar](1) NOT NULL,
	[ICBED] [nvarchar](1) NULL,
	[RYBED] [nvarchar](1) NULL,
	[DYFOL] [nvarchar](3) NOT NULL,
	[CBPPT] [nvarchar](1) NULL,
	[BBBED] [nvarchar](1) NULL,
	[U1BED] [nvarchar](1) NULL,
	[U2BED] [nvarchar](1) NULL,
	[U4BED] [nvarchar](1) NULL,
	[A1BED] [nvarchar](1) NULL,
	[A2BED] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T438M]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T438M](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[MTART] [nvarchar](4) NOT NULL,
	[BANER] [nvarchar](1) NOT NULL,
	[DISER] [nvarchar](1) NOT NULL,
	[UMTHZ] [nvarchar](3) NOT NULL,
	[FIXHZ] [nvarchar](3) NOT NULL,
	[PLAHZ] [nvarchar](3) NOT NULL,
	[SBDIS] [nvarchar](3) NOT NULL,
	[LIFKZ] [nvarchar](1) NOT NULL,
	[GTERM] [nvarchar](1) NOT NULL,
	[KZDRB] [nvarchar](1) NOT NULL,
	[XFAT1] [nvarchar](1) NOT NULL,
	[XFAT2] [nvarchar](1) NOT NULL,
	[VWVOR] [nvarchar](2) NOT NULL,
	[VWVER] [nvarchar](2) NOT NULL,
	[PRREG] [nvarchar](2) NOT NULL,
	[VRMOD] [nvarchar](1) NOT NULL,
	[VINT1] [nvarchar](3) NOT NULL,
	[VINT2] [nvarchar](3) NOT NULL,
	[STRGR] [nvarchar](2) NOT NULL,
	[RESHZ] [decimal](2, 0) NOT NULL,
	[ANDIS] [smallint] NOT NULL,
	[AUART] [nvarchar](4) NOT NULL,
	[AUAR2] [nvarchar](4) NOT NULL,
	[PLSEL] [nvarchar](1) NOT NULL,
	[RVPKZ] [nvarchar](1) NOT NULL,
	[RESVP] [decimal](3, 0) NOT NULL,
	[SHFLG] [nvarchar](1) NULL,
	[SHZET] [nvarchar](2) NULL,
	[MDACH] [nvarchar](2) NULL,
	[PRASTA] [nvarchar](5) NULL,
	[EXSGT] [nvarchar](1) NULL,
	[BESAL] [nvarchar](1) NULL,
	[BSART] [nvarchar](4) NULL,
	[BARTL] [nvarchar](4) NULL,
	[BARTU] [nvarchar](4) NULL,
	[GRREL] [nvarchar](1) NULL,
	[VERTR] [nvarchar](1) NULL,
	[FKOBS] [nvarchar](1) NULL,
	[EVAPR] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T438R]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T438R](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[RWPRO] [nvarchar](3) NOT NULL,
	[RWPER] [nvarchar](1) NOT NULL,
	[RWANZ] [nvarchar](2) NOT NULL,
	[RWART] [nvarchar](1) NOT NULL,
	[RWNTG] [nvarchar](2) NOT NULL,
	[RW1TG] [nvarchar](2) NOT NULL,
	[RW1PR] [nvarchar](2) NOT NULL,
	[RW2TG] [nvarchar](2) NOT NULL,
	[RW2PR] [nvarchar](2) NOT NULL,
	[RW3TG] [nvarchar](2) NOT NULL,
	[MIRW1] [nvarchar](2) NOT NULL,
	[MIRW2] [nvarchar](2) NOT NULL,
	[MIRW3] [nvarchar](2) NOT NULL,
	[MARW1] [nvarchar](2) NOT NULL,
	[MARW2] [nvarchar](2) NOT NULL,
	[MARW3] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T438V]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T438V](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[SHPRO] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T439A]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T439A](
	[MANDT] [nvarchar](3) NOT NULL,
	[DISLS] [nvarchar](2) NOT NULL,
	[LOSVF] [nvarchar](1) NOT NULL,
	[LOSKZ] [nvarchar](1) NOT NULL,
	[PERAZ] [decimal](3, 0) NOT NULL,
	[TERBV] [nvarchar](1) NOT NULL,
	[UELAP] [nvarchar](1) NOT NULL,
	[KFPKZ] [nvarchar](1) NOT NULL,
	[KFPAZ] [decimal](3, 0) NOT NULL,
	[LGLVF] [nvarchar](1) NOT NULL,
	[LGLKZ] [nvarchar](1) NOT NULL,
	[LGPAZ] [decimal](3, 0) NOT NULL,
	[LGTER] [nvarchar](1) NOT NULL,
	[LGUEL] [nvarchar](1) NOT NULL,
	[LGMIN] [nvarchar](1) NOT NULL,
	[LGMAX] [nvarchar](1) NOT NULL,
	[KZSPL] [nvarchar](1) NOT NULL,
	[LGSPL] [nvarchar](1) NOT NULL,
	[INTKA] [nvarchar](1) NOT NULL,
	[LGINT] [nvarchar](1) NOT NULL,
	[LGKND] [nvarchar](1) NOT NULL,
	[KZHOR] [nvarchar](3) NULL,
	[HBVAR] [nvarchar](1) NULL,
	[LASTL] [nvarchar](1) NULL,
	[UNTKZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T439G]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T439G](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[MRPPP] [nvarchar](3) NOT NULL,
	[MRPPS] [nvarchar](1) NOT NULL,
	[FCOPT] [nvarchar](1) NOT NULL,
	[CALHZ] [nvarchar](3) NOT NULL,
	[DATUV] [nvarchar](8) NOT NULL,
	[DATUB] [nvarchar](8) NOT NULL,
	[ERFDT] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T439L]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T439L](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[LAGPR] [nvarchar](1) NOT NULL,
	[LKOST] [decimal](4, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T439P]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T439P](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PERKZ] [nvarchar](1) NOT NULL,
	[AUFTL] [nvarchar](1) NOT NULL,
	[ANZTG] [decimal](3, 0) NOT NULL,
	[ANZWO] [decimal](3, 0) NOT NULL,
	[ANZPR] [decimal](3, 0) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T441R]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T441R](
	[MANDT] [nvarchar](3) NOT NULL,
	[PRREG] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T459K]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T459K](
	[MANDT] [nvarchar](3) NOT NULL,
	[BEDAR] [nvarchar](3) NOT NULL,
	[ATPPR] [nvarchar](1) NULL,
	[BEDSD] [nvarchar](1) NULL,
	[NODIS] [nvarchar](1) NULL,
	[VPZUO] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[APROF] [nvarchar](6) NULL,
	[ABGRS] [nvarchar](6) NULL,
	[PABKZ] [nvarchar](1) NULL,
	[PLNKZ] [nvarchar](1) NULL,
	[ZUVKZ] [nvarchar](1) NULL,
	[BDTYP] [nvarchar](1) NULL,
	[KONFI] [nvarchar](1) NULL,
	[KALKU] [nvarchar](1) NULL,
	[KALSM_K] [nvarchar](6) NULL,
	[KONFV] [nvarchar](1) NULL,
	[MNTGA] [nvarchar](1) NULL,
	[AUART] [nvarchar](4) NULL,
	[VKOMP] [nvarchar](1) NULL,
	[DIAGM] [nvarchar](1) NULL,
	[AUTPL] [nvarchar](1) NULL,
	[VKAPA] [nvarchar](1) NULL,
	[KALART] [nvarchar](1) NULL,
	[KALVAR] [nvarchar](4) NULL,
	[KSUEB] [nvarchar](1) NULL,
	[DIRKST] [nvarchar](1) NULL,
	[SDUPD] [nvarchar](1) NULL,
	[QUOTA] [nvarchar](1) NULL,
	[KZAKP] [nvarchar](1) NULL,
	[KZBWS] [nvarchar](1) NULL,
	[AUCOST] [nvarchar](1) NULL,
	[BWST3] [nvarchar](1) NULL,
	[MNTKAL] [nvarchar](1) NULL,
	[KSCHL_KO] [nvarchar](4) NULL,
	[KSCHL_KOF] [nvarchar](4) NULL,
	[OCMACT] [nvarchar](1) NULL,
	[FKBER] [nvarchar](16) NULL,
	[SLIST] [nvarchar](6) NULL,
	[MODFG] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T460A]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T460A](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[SOBSL] [nvarchar](2) NOT NULL,
	[BESKZ] [nvarchar](1) NOT NULL,
	[SOBES] [nvarchar](1) NOT NULL,
	[WRK02] [nvarchar](4) NOT NULL,
	[CLCOR] [nvarchar](1) NULL,
	[DUMPS] [nvarchar](1) NULL,
	[REWFG] [nvarchar](1) NULL,
	[REWRK] [nvarchar](4) NULL,
	[DIRPR] [nvarchar](1) NULL,
	[UMLDB] [nvarchar](1) NULL,
	[ADDIN] [nvarchar](20) NULL,
	[MLSCR] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T461P]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T461P](
	[MANDT] [nvarchar](3) NOT NULL,
	[STRGR] [nvarchar](2) NOT NULL,
	[HPTST] [nvarchar](2) NOT NULL,
	[STRA2] [nvarchar](2) NOT NULL,
	[STRA3] [nvarchar](2) NOT NULL,
	[STRA4] [nvarchar](2) NOT NULL,
	[STRA5] [nvarchar](2) NOT NULL,
	[STRA6] [nvarchar](2) NOT NULL,
	[STRA7] [nvarchar](2) NOT NULL,
	[STRA8] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T46AC]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T46AC](
	[MANDT] [nvarchar](3) NOT NULL,
	[MDACH] [nvarchar](2) NOT NULL,
	[ACCFM] [nvarchar](4) NOT NULL,
	[ACCTO] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T604]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T604](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[STAWN] [nvarchar](17) NOT NULL,
	[BEMEH] [nvarchar](3) NULL,
	[NIHON] [nvarchar](1) NULL,
	[IMPMA] [nvarchar](3) NULL,
	[MINOL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T604F]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T604F](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[STEUC] [nvarchar](16) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T609G]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T609G](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[GPNUM] [nvarchar](9) NOT NULL,
	[EBNUM] [nvarchar](8) NULL,
	[WZNUM] [nvarchar](8) NULL,
	[WENUM] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T610C]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T610C](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[CASNR] [nvarchar](15) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T618G]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T618G](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[MOGRU] [nvarchar](6) NOT NULL,
	[HEDDA] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T618M]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T618M](
	[MANDT] [nvarchar](3) NOT NULL,
	[LAND1] [nvarchar](3) NOT NULL,
	[MOWNR] [nvarchar](12) NOT NULL,
	[MOORG] [nvarchar](4) NULL,
	[MOONR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T620]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T620](
	[MANDT] [nvarchar](3) NOT NULL,
	[AUFAR] [nvarchar](4) NOT NULL,
	[PINCR] [nvarchar](5) NOT NULL,
	[NUMKI] [nvarchar](2) NOT NULL,
	[NUMKE] [nvarchar](2) NOT NULL,
	[KOGRP] [nvarchar](4) NOT NULL,
	[APSTP] [nvarchar](4) NOT NULL,
	[CPSTP] [nvarchar](4) NULL,
	[FPSTP] [nvarchar](4) NULL,
	[LISTG] [nvarchar](1) NOT NULL,
	[RUNDG] [nvarchar](1) NOT NULL,
	[RESTV] [nvarchar](1) NOT NULL,
	[DATYP] [nvarchar](1) NOT NULL,
	[ASTRA] [nvarchar](4) NOT NULL,
	[FCPOS] [nvarchar](20) NOT NULL,
	[FCFGR] [nvarchar](20) NOT NULL,
	[AAVIT] [nvarchar](4) NULL,
	[KSAVI] [nvarchar](6) NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KSCHL] [nvarchar](4) NULL,
	[APRUE] [nvarchar](2) NULL,
	[FCWRK] [nvarchar](20) NULL,
	[BSTANZ] [nvarchar](1) NULL,
	[EKORGABW] [nvarchar](1) NULL,
	[RETPO] [nvarchar](1) NULL,
	[BERMIMA] [nvarchar](1) NULL,
	[SA_VERF] [nvarchar](1) NULL,
	[SA_MATNAUT] [nvarchar](1) NULL,
	[NF_IM_VB] [nvarchar](1) NULL,
	[NF_NUR_1_MAL] [nvarchar](1) NULL,
	[NREMFIN] [nvarchar](4) NULL,
	[WRF_HIER_CNT] [nvarchar](2) NULL,
	[WRF_CDT_LEVEL] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T621]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T621](
	[MANDT] [nvarchar](3) NOT NULL,
	[APSTP] [nvarchar](4) NOT NULL,
	[BSTGE] [nvarchar](1) NOT NULL,
	[UMLGE] [nvarchar](1) NOT NULL,
	[AAFBG] [nvarchar](1) NULL,
	[WEFBG] [nvarchar](1) NULL,
	[LFART] [nvarchar](4) NOT NULL,
	[BZQFI] [nvarchar](1) NOT NULL,
	[POSGR] [nvarchar](4) NOT NULL,
	[BSART] [nvarchar](4) NULL,
	[UMART] [nvarchar](4) NULL,
	[BSART_GL_BUKRS] [nvarchar](4) NULL,
	[ASNRM] [nvarchar](1) NULL,
	[BSTZU] [nvarchar](1) NULL,
	[UMLZU] [nvarchar](1) NULL,
	[LIEZU] [nvarchar](1) NULL,
	[TERMG] [nvarchar](1) NULL,
	[VZWBG] [nvarchar](1) NULL,
	[LFIND] [nvarchar](1) NULL,
	[KAART] [nvarchar](4) NULL,
	[DETDELDATE] [nvarchar](1) NULL,
	[DETDELDATE_VZ] [nvarchar](1) NULL,
	[PRIO_ORDER_TYPE] [nvarchar](1) NULL,
	[TERMG_NO_WEBAZ] [nvarchar](1) NULL,
	[WRF_TERMG_REACT] [nvarchar](1) NULL,
	[CONS_MODE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T626]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T626](
	[MANDT] [nvarchar](3) NOT NULL,
	[AAVIT] [nvarchar](4) NOT NULL,
	[KNARIFI] [nvarchar](1) NULL,
	[AMITB] [nvarchar](2) NULL,
	[ARMEL] [nvarchar](1) NULL,
	[BM_MIT_WM] [nvarchar](1) NULL,
	[BM_FUELLEN_AUTO] [nvarchar](1) NULL,
	[AMITV] [nvarchar](2) NULL,
	[AANZM] [smallint] NULL,
	[BANZM] [smallint] NULL,
	[DATKT] [nvarchar](1) NULL,
	[DATPT] [nvarchar](1) NULL,
	[DATLW] [nvarchar](1) NULL,
	[DATWM] [nvarchar](1) NULL,
	[DATEK] [nvarchar](1) NULL,
	[DATVK] [nvarchar](1) NULL,
	[DATNP] [nvarchar](1) NULL,
	[AAMEB] [nvarchar](1) NULL,
	[AAMEV] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T627]    Script Date: 10/15/2014 5:40:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T627](
	[MANDT] [nvarchar](3) NOT NULL,
	[ASTRA] [nvarchar](4) NOT NULL,
	[ASTFB] [nvarchar](30) NULL,
	[DYNNR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T629]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T629](
	[MANDT] [nvarchar](3) NOT NULL,
	[SPERR] [nvarchar](1) NOT NULL,
	[BSERL] [nvarchar](1) NOT NULL,
	[UMERL] [nvarchar](1) NOT NULL,
	[AVERL] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T683]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T683](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVEWE] [nvarchar](1) NOT NULL,
	[KAPPL] [nvarchar](2) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[AUSVF] [nvarchar](1) NULL,
	[BONSM] [nvarchar](1) NULL,
	[KNPRS_V] [nvarchar](1) NULL,
	[PRODUCTIVE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T691A]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T691A](
	[MANDT] [nvarchar](3) NULL,
	[CTLPC] [nvarchar](3) NULL,
	[KKBER] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T691K]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T691K](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABSFO] [nvarchar](2) NOT NULL,
	[ABSTP] [nvarchar](1) NULL,
	[AKKTP] [nvarchar](1) NULL,
	[AKART] [nvarchar](2) NULL,
	[KABFO] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T691M]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T691M](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABSSC] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T6WSP]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T6WSP](
	[MANDT] [nvarchar](3) NOT NULL,
	[SAISO] [nvarchar](4) NOT NULL,
	[TGVON] [nvarchar](5) NULL,
	[TGBIS] [nvarchar](5) NULL,
	[GRUKZ] [nvarchar](2) NULL,
	[VLLIS] [nvarchar](3) NULL,
	[NLLIS] [nvarchar](3) NULL,
	[VLVKF] [nvarchar](3) NULL,
	[NLVKF] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T778O]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T778O](
	[MANDT] [nvarchar](3) NOT NULL,
	[OTYPE] [nvarchar](2) NOT NULL,
	[OBJTYP] [nvarchar](10) NULL,
	[ICON] [nvarchar](30) NULL,
	[BW_OBJTYP] [nvarchar](30) NOT NULL,
	[CLASSNAME] [nvarchar](30) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_T778P]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_T778P](
	[MANDT] [nvarchar](3) NOT NULL,
	[PLVAR] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TACT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TACT](
	[ACTVT] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_SAP_TACT] PRIMARY KEY CLUSTERED 
(
	[ACTVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TACTT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TACTT](
	[SPRAS] [nvarchar](1) NOT NULL,
	[ACTVT] [nvarchar](2) NOT NULL,
	[LTEXT] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_SAP_TACTT] PRIMARY KEY CLUSTERED 
(
	[SPRAS] ASC,
	[ACTVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TBDLS]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TBDLS](
	[LOGSYS] [nvarchar](10) NOT NULL,
	[ISPRFCDES] [nvarchar](32) NULL,
	[ISPRFCTYPE] [nvarchar](1) NULL,
	[ISPREL] [nvarchar](8) NULL,
	[ISPRFCDESF] [nvarchar](32) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TBMOT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TBMOT](
	[MANDT] [nvarchar](3) NOT NULL,
	[BEMOT] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TBSG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TBSG](
	[MANDT] [nvarchar](3) NOT NULL,
	[BSGRU] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TC29V]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TC29V](
	[MANDT] [nvarchar](3) NULL,
	[FUNCT] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCA01]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCA01](
	[MANDT] [nvarchar](3) NOT NULL,
	[PLNTY] [nvarchar](1) NOT NULL,
	[PLNAW] [nvarchar](1) NULL,
	[MATKZ] [nvarchar](1) NULL,
	[BLDTY] [nvarchar](1) NULL,
	[OBJECT] [nvarchar](10) NULL,
	[NKNRI] [nvarchar](2) NULL,
	[NKNRE] [nvarchar](2) NULL,
	[FLG_OPRSOP] [nvarchar](1) NULL,
	[FLG_SEQ] [nvarchar](1) NULL,
	[FLG_QSS] [nvarchar](1) NULL,
	[FLG_AOB] [nvarchar](1) NULL,
	[FLG_UOBJ] [nvarchar](1) NULL,
	[FLG_EQUI] [nvarchar](1) NULL,
	[FLG_IFL] [nvarchar](1) NULL,
	[FLG_INST] [nvarchar](1) NULL,
	[SCREENTY] [nvarchar](4) NULL,
	[FLG_REF] [nvarchar](1) NULL,
	[FLG_PHAS] [nvarchar](1) NULL,
	[FLG_FEAT] [nvarchar](1) NULL,
	[FLG_DOC] [nvarchar](1) NULL,
	[FLG_PHYS] [nvarchar](1) NULL,
	[FLG_MST] [nvarchar](1) NULL,
	[FLG_CHK] [nvarchar](1) NULL,
	[PID_MAT] [nvarchar](1) NULL,
	[PID_PLN] [nvarchar](1) NULL,
	[FLG_STUELI] [nvarchar](1) NULL,
	[PID_AUN] [nvarchar](1) NULL,
	[FLG_GPOS] [nvarchar](1) NULL,
	[FLG_MKAL] [nvarchar](1) NULL,
	[FLG_ERF_OP] [nvarchar](1) NULL,
	[OPR_BLDGR] [nvarchar](2) NULL,
	[OPR_PANEL] [nvarchar](4) NULL,
	[FLG_CHK_RE] [nvarchar](1) NULL,
	[FLG_ARBEI] [nvarchar](1) NULL,
	[FLG_KALC] [nvarchar](1) NULL,
	[FLG_CHRULE] [nvarchar](1) NULL,
	[FLG_LK_CHK] [nvarchar](1) NULL,
	[FLG_MATCOM] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCA07]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCA07](
	[FLGAT] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCK05]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCK05](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWVAR] [nvarchar](3) NOT NULL,
	[BWSM1] [nvarchar](1) NULL,
	[BWSM2] [nvarchar](1) NULL,
	[BWSM3] [nvarchar](1) NULL,
	[BWSM4] [nvarchar](1) NULL,
	[BWSM5] [nvarchar](1) NULL,
	[BWSE1] [nvarchar](1) NULL,
	[BWSE2] [nvarchar](1) NULL,
	[BWSE3] [nvarchar](1) NULL,
	[MATSUBSTRAT1] [nvarchar](1) NULL,
	[MATSUBSTRAT2] [nvarchar](1) NULL,
	[MATSUBSTRAT3] [nvarchar](1) NULL,
	[BWMA1] [nvarchar](1) NULL,
	[BWMA2] [nvarchar](1) NULL,
	[BWMA3] [nvarchar](1) NULL,
	[BWMA4] [nvarchar](1) NULL,
	[BWMA5] [nvarchar](1) NULL,
	[BWSF1] [nvarchar](1) NULL,
	[BWSF2] [nvarchar](1) NULL,
	[BWSF3] [nvarchar](1) NULL,
	[BWSV1] [nvarchar](1) NULL,
	[BWSV2] [nvarchar](1) NULL,
	[BWSV3] [nvarchar](1) NULL,
	[BWSFH] [nvarchar](1) NULL,
	[KALSM] [nvarchar](6) NULL,
	[KALSM_RAW] [nvarchar](6) NULL,
	[ZUART] [nvarchar](1) NULL,
	[PLISQUT] [nvarchar](1) NULL,
	[LOBEZUS] [nvarchar](1) NULL,
	[PERTARIF] [nvarchar](1) NULL,
	[VERSN] [nvarchar](3) NULL,
	[CON_FIN_MPL1] [nvarchar](3) NULL,
	[CON_FIN_MPL2] [nvarchar](3) NULL,
	[CON_FIN_MPL3] [nvarchar](3) NULL,
	[CON_FIN_MPL4] [nvarchar](3) NULL,
	[CON_FIN_MPL5] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCK08]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCK08](
	[MANDT] [nvarchar](3) NOT NULL,
	[SELKZ] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCK14]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCK14](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWKEY] [nvarchar](4) NOT NULL,
	[KOSGR] [nvarchar](10) NOT NULL,
	[ZSCHL] [nvarchar](6) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCO43]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCO43](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[CO_PRODPRF] [nvarchar](6) NOT NULL,
	[FLG_REL_CR] [nvarchar](1) NOT NULL,
	[FLG_PR_REL] [nvarchar](1) NOT NULL,
	[FLG_TM_REL] [nvarchar](1) NOT NULL,
	[FLG_WM_REL] [nvarchar](1) NOT NULL,
	[PROFILE_ID] [nvarchar](10) NOT NULL,
	[AUART] [nvarchar](4) NOT NULL,
	[AUTYP] [nvarchar](2) NOT NULL,
	[FLG_CR_REL] [nvarchar](1) NOT NULL,
	[FLG_COM_QA] [nvarchar](1) NULL,
	[FLG_QUAN_P] [nvarchar](1) NULL,
	[FLG_QUAN_M] [nvarchar](1) NULL,
	[FLG_QUAN_A] [nvarchar](1) NULL,
	[FLG_KAP_TM] [nvarchar](1) NULL,
	[FLG_KAP_TB] [nvarchar](1) NULL,
	[FLG_BOM_EX] [nvarchar](1) NULL,
	[KZCLA] [nvarchar](1) NULL,
	[XKCFC] [nvarchar](1) NULL,
	[KZBCR] [nvarchar](1) NULL,
	[AUTWE] [nvarchar](1) NULL,
	[AUART_KDE] [nvarchar](4) NULL,
	[AUART_PSP] [nvarchar](4) NULL,
	[AUART_NOM] [nvarchar](4) NULL,
	[WM_KZTBV] [nvarchar](1) NULL,
	[WM_KZBMG] [nvarchar](1) NULL,
	[WM_KZPGI] [nvarchar](1) NULL,
	[FLG_DLM_CR] [nvarchar](1) NULL,
	[FLG_DLM_REL] [nvarchar](1) NULL,
	[FLG_DLB_CR] [nvarchar](1) NULL,
	[FLG_DLB_REL] [nvarchar](1) NULL,
	[FLG_SPLIT_BATCH] [nvarchar](1) NULL,
	[MILL_AUART_UTA] [nvarchar](4) NULL,
	[WM_KZKTS] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCO48]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCO48](
	[MANDT] [nvarchar](3) NOT NULL,
	[GPROFILE] [nvarchar](6) NOT NULL,
	[CUST_PROFILE] [nvarchar](6) NULL,
	[MAST_PROFILE] [nvarchar](6) NULL,
	[ATO_PROFILE] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCSCP_COMP_LVL]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCSCP_COMP_LVL](
	[MANDT] [nvarchar](3) NOT NULL,
	[COMP_LEVEL] [nvarchar](2) NOT NULL,
	[HIERARCHY] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCSCP_CONV_TYPE]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCSCP_CONV_TYPE](
	[MANDT] [nvarchar](3) NOT NULL,
	[CONV_TYPE] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TCURC]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TCURC](
	[MANDT] [nvarchar](3) NOT NULL,
	[WAERS] [nvarchar](5) NOT NULL,
	[ISOCD] [nvarchar](3) NULL,
	[ALTWR] [nvarchar](3) NULL,
	[GDATU] [nvarchar](8) NULL,
	[XPRIMARY] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TDG41]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TDG41](
	[MANDT] [nvarchar](3) NOT NULL,
	[PROFL] [nvarchar](3) NOT NULL,
	[IDAGO] [nvarchar](1) NULL,
	[IDGCH] [nvarchar](1) NULL,
	[IDGPA] [nvarchar](1) NULL,
	[IDGTP] [nvarchar](1) NULL,
	[IDGSM] [nvarchar](1) NULL,
	[IDCL] [nvarchar](1) NULL,
	[IDCL7] [nvarchar](1) NULL,
	[IDCLREPL] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TDGC5]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TDGC5](
	[MANDT] [nvarchar](3) NOT NULL,
	[PROLI] [nvarchar](3) NOT NULL,
	[IRN1] [nvarchar](1) NULL,
	[IRN1F] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TFACD]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TFACD](
	[IDENT] [nvarchar](2) NOT NULL,
	[VJAHR] [nvarchar](4) NULL,
	[BJAHR] [nvarchar](4) NULL,
	[MOTAG] [nvarchar](1) NULL,
	[DITAG] [nvarchar](1) NULL,
	[MIWCH] [nvarchar](1) NULL,
	[DOTAG] [nvarchar](1) NULL,
	[FRTAG] [nvarchar](1) NULL,
	[SATAG] [nvarchar](1) NULL,
	[SOTAG] [nvarchar](1) NULL,
	[FETAG] [nvarchar](1) NULL,
	[HOCID] [nvarchar](2) NULL,
	[BASIS] [nvarchar](5) NULL,
	[ABBR] [nvarchar](1) NULL,
	[CRUSR] [nvarchar](12) NULL,
	[CRDAT] [nvarchar](8) NULL,
	[CRTIME] [nvarchar](6) NULL,
	[INTERV] [nvarchar](1) NULL,
	[AKTVJAHR] [nvarchar](4) NULL,
	[AKTBJAHR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TGSB]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TGSB](
	[MANDT] [nvarchar](3) NOT NULL,
	[GSBER] [nvarchar](4) NOT NULL,
	[GSBER_KONS] [nvarchar](4) NOT NULL,
	[GSBER_GLOB] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TINC]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TINC](
	[MANDT] [nvarchar](3) NOT NULL,
	[INCO1] [nvarchar](3) NOT NULL,
	[ORTOB] [nvarchar](1) NULL,
	[OITITLE] [nvarchar](1) NULL,
	[OIG_GLPOD] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TIUID_TYPE]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TIUID_TYPE](
	[IUID_TYPE] [nvarchar](10) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TKA01]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TKA01](
	[MANDT] [nvarchar](3) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[BEZEI] [nvarchar](25) NULL,
	[WAERS] [nvarchar](5) NULL,
	[KTOPL] [nvarchar](4) NULL,
	[LMONA] [nvarchar](2) NULL,
	[KOKFI] [nvarchar](1) NULL,
	[LOGSYSTEM] [nvarchar](10) NULL,
	[ALEMT] [nvarchar](2) NULL,
	[MD_LOGSYSTEM] [nvarchar](10) NULL,
	[KHINR] [nvarchar](12) NULL,
	[KOMP1] [nvarchar](1) NULL,
	[KOMP0] [nvarchar](1) NULL,
	[KOMP2] [nvarchar](1) NULL,
	[ERKRS] [nvarchar](4) NULL,
	[DPRCT] [nvarchar](10) NULL,
	[PHINR] [nvarchar](12) NULL,
	[PCLDG] [nvarchar](2) NULL,
	[PCBEL] [nvarchar](1) NULL,
	[XWBUK] [nvarchar](1) NULL,
	[BPHINR] [nvarchar](12) NULL,
	[XBPALE] [nvarchar](1) NULL,
	[KSTAR_FIN] [nvarchar](10) NULL,
	[KSTAR_FID] [nvarchar](10) NULL,
	[PCACUR] [nvarchar](5) NULL,
	[PCACURTP] [nvarchar](2) NULL,
	[PCATRCUR] [nvarchar](1) NULL,
	[CTYP] [nvarchar](2) NULL,
	[RCLAC] [nvarchar](1) NULL,
	[BLART] [nvarchar](2) NULL,
	[FIKRS] [nvarchar](4) NULL,
	[RCL_PRIMAC] [nvarchar](1) NULL,
	[PCA_ALEMT] [nvarchar](2) NULL,
	[PCA_VALU] [nvarchar](1) NULL,
	[CVPROF] [nvarchar](4) NULL,
	[CVACT] [nvarchar](1) NULL,
	[VNAME] [nvarchar](12) NULL,
	[PCA_ACC_DIFF] [nvarchar](1) NULL,
	[TP_VALOHB] [nvarchar](1) NULL,
	[DEFPRCTR] [nvarchar](10) NULL,
	[AUTH_USE_NO_STD] [nvarchar](1) NULL,
	[AUTH_USE_ADD1] [nvarchar](1) NULL,
	[AUTH_USE_ADD2] [nvarchar](1) NULL,
	[AUTH_KE_NO_STD] [nvarchar](1) NULL,
	[AUTH_KE_USE_ADD1] [nvarchar](1) NULL,
	[AUTH_KE_USE_ADD2] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TKKH1]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TKKH1](
	[MANDT] [nvarchar](3) NOT NULL,
	[KOKRS] [nvarchar](4) NOT NULL,
	[KOATY] [nvarchar](2) NOT NULL,
	[HRKFT] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TKV01]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TKV01](
	[MANDT] [nvarchar](3) NOT NULL,
	[AWOBA] [nvarchar](2) NOT NULL,
	[AWSLS] [nvarchar](6) NOT NULL,
	[AWKUM] [nvarchar](1) NOT NULL,
	[AWDEG] [nvarchar](1) NOT NULL,
	[AWEPS] [nvarchar](1) NOT NULL,
	[AWESO] [nvarchar](1) NOT NULL,
	[AWESP] [nvarchar](1) NOT NULL,
	[AWEAU] [nvarchar](1) NOT NULL,
	[AWEAB] [nvarchar](1) NOT NULL,
	[AWEWP] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TLGR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TLGR](
	[MANDT] [nvarchar](3) NOT NULL,
	[LADGR] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TLOG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TLOG](
	[MANDT] [nvarchar](3) NOT NULL,
	[LOGGR] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMABC]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMABC](
	[MANDT] [nvarchar](3) NOT NULL,
	[MAABC] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMAM]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMAM](
	[MANDT] [nvarchar](3) NULL,
	[AGMEM] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMBW1]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMBW1](
	[MANDT] [nvarchar](3) NOT NULL,
	[BWSCL] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMFG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMFG](
	[MANDT] [nvarchar](3) NOT NULL,
	[MFRGR] [nvarchar](8) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMFPF]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMFPF](
	[MANDT] [nvarchar](3) NOT NULL,
	[FPRFM] [nvarchar](3) NOT NULL,
	[BARTV] [nvarchar](1) NULL,
	[VERVF] [nvarchar](1) NULL,
	[ANPRF] [nvarchar](3) NULL,
	[SABST] [nvarchar](1) NULL,
	[APPRZ] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMP_SPEC]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMP_SPEC](
	[MANDT] [nvarchar](3) NOT NULL,
	[SPEC_NO] [nvarchar](10) NOT NULL,
	[DEL] [nvarchar](1) NULL,
	[BLOCK] [nvarchar](1) NULL,
	[WERKS] [nvarchar](4) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[MATKL] [nvarchar](9) NULL,
	[SORT1] [nvarchar](20) NULL,
	[TXZ01] [nvarchar](40) NULL,
	[PACKNO] [nvarchar](10) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[AENAM] [nvarchar](12) NULL,
	[BEGRU] [nvarchar](4) NULL,
	[MSTAE] [nvarchar](2) NULL,
	[MSTDE] [nvarchar](8) NULL,
	[WAERS] [nvarchar](5) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[NETWR] [decimal](15, 2) NULL,
	[FLIEF] [nvarchar](10) NULL,
	[KONNR] [nvarchar](10) NULL,
	[KTPNR] [nvarchar](5) NULL,
	[ASTYP] [nvarchar](4) NULL,
	[USE_KONF] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMQ2]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMQ2](
	[MANDT] [nvarchar](3) NULL,
	[USEQU] [nvarchar](1) NULL,
	[QBEST] [nvarchar](1) NULL,
	[QLPET] [nvarchar](1) NULL,
	[QPLAF] [nvarchar](1) NULL,
	[QBANF] [nvarchar](1) NULL,
	[QDISP] [nvarchar](1) NULL,
	[QFAUF] [nvarchar](1) NULL,
	[QFIR] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMRM007A]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMRM007A](
	[MANDT] [nvarchar](3) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[MWSKZ] [nvarchar](2) NOT NULL,
	[KOART] [nvarchar](1) NOT NULL,
	[XDFLT] [nvarchar](1) NOT NULL,
	[XREPR] [nvarchar](1) NOT NULL,
	[XACC] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMSI1]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMSI1](
	[MANDT] [nvarchar](3) NOT NULL,
	[UPTYP] [nvarchar](1) NOT NULL,
	[SIKGR] [nvarchar](3) NOT NULL,
	[UPREI] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMSI2]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMSI2](
	[MANDT] [nvarchar](3) NOT NULL,
	[SIKGR] [nvarchar](3) NOT NULL,
	[WEPOS] [nvarchar](1) NOT NULL,
	[WEUNB] [nvarchar](1) NOT NULL,
	[REPOS] [nvarchar](1) NOT NULL,
	[SIKON] [nvarchar](1) NOT NULL,
	[SIEIN] [nvarchar](1) NOT NULL,
	[SIKNT] [nvarchar](1) NOT NULL,
	[SIIMP] [nvarchar](1) NOT NULL,
	[SIANL] [nvarchar](1) NOT NULL,
	[SITXO] [nvarchar](1) NOT NULL,
	[SITXD] [nvarchar](1) NOT NULL,
	[STAFO] [nvarchar](6) NOT NULL,
	[SIDRU] [nvarchar](1) NOT NULL,
	[SIQUA] [nvarchar](1) NOT NULL,
	[STAPO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMSRM_EHTYP]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMSRM_EHTYP](
	[MANDT] [nvarchar](3) NOT NULL,
	[EHTYP] [nvarchar](4) NOT NULL,
	[FLREF] [nvarchar](20) NULL,
	[STAPO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TMVF]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TMVF](
	[MANDT] [nvarchar](3) NOT NULL,
	[MTVFP] [nvarchar](2) NOT NULL,
	[SUMAU] [nvarchar](1) NOT NULL,
	[SUMLF] [nvarchar](1) NOT NULL,
	[SWBZT] [decimal](3, 0) NOT NULL,
	[ACENQ] [nvarchar](1) NOT NULL,
	[VERPN] [nvarchar](1) NOT NULL,
	[ONVBA] [nvarchar](1) NOT NULL,
	[RELRE] [nvarchar](1) NOT NULL,
	[KZRVP] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TOBJ]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TOBJ](
	[OBJCT] [nvarchar](10) NOT NULL,
	[FIEL1] [nvarchar](10) NOT NULL,
	[FIEL2] [nvarchar](10) NOT NULL,
	[FIEL3] [nvarchar](10) NOT NULL,
	[FIEL4] [nvarchar](10) NOT NULL,
	[FIEL5] [nvarchar](10) NOT NULL,
	[FIEL6] [nvarchar](10) NOT NULL,
	[FIEL7] [nvarchar](10) NOT NULL,
	[FIEL8] [nvarchar](10) NOT NULL,
	[FIEL9] [nvarchar](10) NOT NULL,
	[FIEL0] [nvarchar](10) NOT NULL,
	[OCLSS] [nvarchar](4) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[FBLOCK] [nvarchar](8) NOT NULL,
	[CONVERSION] [nvarchar](1) NULL,
 CONSTRAINT [PK_SAP_TOBJ] PRIMARY KEY CLUSTERED 
(
	[OBJCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TOBJT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TOBJT](
	[LANGU] [nvarchar](1) NOT NULL,
	[OBJECT] [nvarchar](10) NOT NULL,
	[TTEXT] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_SAP_TOBJT] PRIMARY KEY CLUSTERED 
(
	[LANGU] ASC,
	[OBJECT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPAR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPAR](
	[MANDT] [nvarchar](3) NOT NULL,
	[PARVW] [nvarchar](2) NOT NULL,
	[STEIN] [nvarchar](1) NULL,
	[UPARV] [nvarchar](2) NULL,
	[FEHGR] [nvarchar](2) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[NRART] [nvarchar](2) NULL,
	[HITYP] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPK01]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPK01](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PKSTE] [nvarchar](4) NOT NULL,
	[PKSAE] [nvarchar](1) NOT NULL,
	[AUART] [nvarchar](4) NOT NULL,
	[AUSSP] [nvarchar](3) NOT NULL,
	[KZQUO] [nvarchar](1) NOT NULL,
	[BWAWE] [nvarchar](3) NOT NULL,
	[PKFRM] [nvarchar](16) NOT NULL,
	[PKWZW] [nvarchar](1) NULL,
	[CNSCC] [nvarchar](1) NULL,
	[BWACC] [nvarchar](3) NULL,
	[DRUFB] [nvarchar](30) NULL,
	[SDDKZ] [nvarchar](1) NULL,
	[REDST] [nvarchar](1) NULL,
	[REDHZ] [decimal](3, 0) NULL,
	[PLGEN] [nvarchar](1) NULL,
	[VPACK] [nvarchar](1) NULL,
	[RKFORM] [nvarchar](16) NULL,
	[RKDRUFB] [nvarchar](30) NULL,
	[ALERT] [nvarchar](1) NULL,
	[KANB_FORM_PDF] [nvarchar](30) NULL,
	[FORM_TYPE] [nvarchar](1) NULL,
	[CC_FORM_PDF] [nvarchar](30) NULL,
	[CC_FORM_TYPE] [nvarchar](1) NULL,
	[REUSEST] [nvarchar](1) NULL,
	[REUSEHZ] [decimal](3, 0) NULL,
	[ACT_CAPA] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPK02]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPK02](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PKSTF] [nvarchar](4) NOT NULL,
	[PKSAF] [nvarchar](1) NOT NULL,
	[MDUEA] [nvarchar](1) NOT NULL,
	[KZQUO] [nvarchar](1) NOT NULL,
	[KZORB] [nvarchar](1) NOT NULL,
	[BWAWE] [nvarchar](3) NOT NULL,
	[AUSSP] [nvarchar](3) NOT NULL,
	[PKFRM] [nvarchar](16) NOT NULL,
	[BSART] [nvarchar](4) NOT NULL,
	[CNSCC] [nvarchar](1) NULL,
	[BWACC] [nvarchar](3) NULL,
	[UTTRM] [nvarchar](1) NULL,
	[DRUFB] [nvarchar](30) NULL,
	[SDDKZ] [nvarchar](1) NULL,
	[RKFORM] [nvarchar](16) NULL,
	[RKDRUFB] [nvarchar](30) NULL,
	[VPACK] [nvarchar](1) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[ALERT] [nvarchar](1) NULL,
	[KANB_FORM_PDF] [nvarchar](30) NULL,
	[FORM_TYPE] [nvarchar](1) NULL,
	[CC_FORM_PDF] [nvarchar](30) NULL,
	[CC_FORM_TYPE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPK03]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPK03](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[PKSTU] [nvarchar](4) NOT NULL,
	[PKSAU] [nvarchar](1) NOT NULL,
	[BWART] [nvarchar](3) NOT NULL,
	[AUSSP] [nvarchar](3) NOT NULL,
	[PKFRM] [nvarchar](16) NOT NULL,
	[BWARK] [nvarchar](3) NULL,
	[RULES] [nvarchar](4) NULL,
	[KALSM] [nvarchar](6) NULL,
	[PKWZW] [nvarchar](1) NULL,
	[CNSCC] [nvarchar](1) NULL,
	[BWACC] [nvarchar](3) NULL,
	[PKDIRTA] [nvarchar](1) NULL,
	[PKKZDIF] [nvarchar](1) NULL,
	[DRUFB] [nvarchar](30) NULL,
	[SDDKZ] [nvarchar](1) NULL,
	[UTTRM] [nvarchar](1) NULL,
	[RKFORM] [nvarchar](16) NULL,
	[RKDRUFB] [nvarchar](30) NULL,
	[VPACK] [nvarchar](1) NULL,
	[ALERT] [nvarchar](1) NULL,
	[KANB_FORM_PDF] [nvarchar](30) NULL,
	[FORM_TYPE] [nvarchar](1) NULL,
	[CC_FORM_PDF] [nvarchar](30) NULL,
	[CC_FORM_TYPE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPKBP]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPKBP](
	[MANDT] [nvarchar](3) NOT NULL,
	[WERKS] [nvarchar](4) NOT NULL,
	[KCPRF] [nvarchar](4) NOT NULL,
	[KCART] [nvarchar](1) NULL,
	[KCSAF] [decimal](5, 3) NULL,
	[KCCON] [smallint] NULL,
	[KCGLA] [nvarchar](1) NULL,
	[VERTI] [nvarchar](4) NULL,
	[TSTRID] [nvarchar](10) NULL,
	[SCHGRUP] [nvarchar](2) NULL,
	[SPROG] [nvarchar](4) NULL,
	[FABKL] [nvarchar](2) NULL,
	[KWBZD] [decimal](3, 0) NULL,
	[KWBZM] [decimal](11, 0) NULL,
	[SCHGRUPV] [nvarchar](2) NULL,
	[SPROGV] [nvarchar](4) NULL,
	[FABKLV] [nvarchar](2) NULL,
	[PINTVD] [decimal](3, 0) NULL,
	[PINTVM] [decimal](11, 0) NULL,
	[KDMBUF] [decimal](3, 0) NULL,
	[KSPBUF] [decimal](3, 0) NULL,
	[KDMVOL] [nvarchar](1) NULL,
	[TSTRIDV] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPKSF]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPKSF](
	[MANDT] [nvarchar](3) NOT NULL,
	[PKSFG] [nvarchar](4) NOT NULL,
	[SFGS1] [nvarchar](1) NOT NULL,
	[SFGS2] [nvarchar](1) NOT NULL,
	[SFGS3] [nvarchar](1) NOT NULL,
	[SFGS4] [nvarchar](1) NOT NULL,
	[SFGS5] [nvarchar](1) NOT NULL,
	[SFGS6] [nvarchar](1) NOT NULL,
	[PKAKT] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPOOL]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPOOL](
	[MANDT] [nvarchar](3) NOT NULL,
	[MYKEY] [nvarchar](4) NOT NULL,
	[MYPOOL] [nvarchar](4) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[PEINH] [decimal](5, 0) NOT NULL,
	[XINDX] [nvarchar](1) NULL,
	[RANGE1] [decimal](4, 1) NULL,
	[RANGE2] [decimal](4, 1) NULL,
	[CHKPR] [decimal](11, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPRG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPRG](
	[MANDT] [nvarchar](3) NOT NULL,
	[SPRAS] [nvarchar](1) NOT NULL,
	[PRGBZ] [nvarchar](1) NOT NULL,
	[PRGRS] [nvarchar](1) NULL,
	[PRGTX] [nvarchar](20) NULL,
	[PRITX] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TPRIO]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TPRIO](
	[MANDT] [nvarchar](3) NOT NULL,
	[LPRIO] [nvarchar](2) NOT NULL,
	[APRIO] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TQ01B]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TQ01B](
	[MANDT] [nvarchar](3) NOT NULL,
	[QMATAUTH] [nvarchar](6) NOT NULL,
	[KZGENLOS] [nvarchar](1) NULL,
	[SIG_IL_RES] [nvarchar](1) NULL,
	[SIG_IL_USA] [nvarchar](1) NULL,
	[SIG_IL_SDR] [nvarchar](1) NULL,
	[SIGN_TYPE_RR] [nvarchar](1) NULL,
	[SIGN_TYPE_UD] [nvarchar](1) NULL,
	[SIGN_TYPE_SM] [nvarchar](1) NULL,
	[SIGNSTRAT_RR] [nvarchar](8) NULL,
	[SIGNSTRAT_UD] [nvarchar](8) NULL,
	[SIGNSTRAT_SM] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TQ02]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TQ02](
	[MANDT] [nvarchar](3) NOT NULL,
	[QSSYS] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TQ05]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TQ05](
	[MANDT] [nvarchar](3) NOT NULL,
	[ZGTYP] [nvarchar](4) NOT NULL,
	[WEPRF] [nvarchar](1) NOT NULL,
	[ZGLIEF] [nvarchar](1) NOT NULL,
	[ZGPRUEF] [nvarchar](1) NULL,
	[MSGART] [nvarchar](1) NOT NULL,
	[STSMA] [nvarchar](8) NOT NULL,
	[QCPRACT] [nvarchar](1) NULL,
	[QGRPOP] [nvarchar](1) NULL,
	[QREMIND] [nvarchar](4) NULL,
	[QESCAL] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TQ08]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TQ08](
	[MANDT] [nvarchar](3) NOT NULL,
	[QM_PUR] [nvarchar](8) NOT NULL,
	[TLERF] [nvarchar](1) NOT NULL,
	[QVERF] [nvarchar](1) NOT NULL,
	[LIEFFREI] [nvarchar](1) NOT NULL,
	[ZGERF] [nvarchar](1) NOT NULL,
	[DOKPFL] [nvarchar](1) NOT NULL,
	[MSGART] [nvarchar](1) NOT NULL,
	[SPERRINAKT] [nvarchar](1) NOT NULL,
	[RESPERRE] [nvarchar](1) NOT NULL,
	[SRCGR] [nvarchar](1) NULL,
	[SRCBTCH] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TQCOM]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TQCOM](
	[COMMN] [nvarchar](5) NOT NULL,
	[QUEID] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TSAB]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TSAB](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABTNR] [nvarchar](4) NOT NULL,
	[BU_ABTNR] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TSPA]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TSPA](
	[MANDT] [nvarchar](3) NOT NULL,
	[SPART] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TSTC]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_TSTC](
	[TCODE] [nvarchar](20) NOT NULL,
	[PGMNA] [nvarchar](40) NULL,
	[DYPNO] [nvarchar](4) NULL,
	[MENUE] [nvarchar](5) NULL,
	[CINFO] [varbinary](1) NULL,
	[ARBGB] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_TSTCT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TSTCT](
	[SPRSL] [nvarchar](1) NOT NULL,
	[TCODE] [nvarchar](20) NOT NULL,
	[TTEXT] [nvarchar](36) NULL,
 CONSTRAINT [PK_SAP_TSTCT] PRIMARY KEY CLUSTERED 
(
	[SPRSL] ASC,
	[TCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TTGR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TTGR](
	[MANDT] [nvarchar](3) NOT NULL,
	[TRAGR] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TTSG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TTSG](
	[MANDT] [nvarchar](3) NOT NULL,
	[TRSPG] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TTXJ]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TTXJ](
	[MANDT] [nvarchar](3) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[TXJCD] [nvarchar](15) NOT NULL,
	[XSKFN] [nvarchar](1) NULL,
	[XMWSN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVAK]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVAK](
	[MANDT] [nvarchar](3) NOT NULL,
	[AUART] [nvarchar](4) NOT NULL,
	[KOPGR] [nvarchar](4) NOT NULL,
	[LFARV] [nvarchar](4) NOT NULL,
	[FKARV] [nvarchar](4) NOT NULL,
	[FKARA] [nvarchar](4) NOT NULL,
	[NUMKI] [nvarchar](2) NOT NULL,
	[NUMKE] [nvarchar](2) NOT NULL,
	[INCPO] [nvarchar](6) NOT NULL,
	[UEVOR] [nvarchar](20) NOT NULL,
	[AUGRP] [nvarchar](2) NOT NULL,
	[UMFNG] [nvarchar](20) NOT NULL,
	[DABAR] [nvarchar](1) NOT NULL,
	[PARGR] [nvarchar](4) NOT NULL,
	[FAKSK] [nvarchar](2) NOT NULL,
	[LIFSK] [nvarchar](2) NOT NULL,
	[TRVOG] [nvarchar](1) NOT NULL,
	[SPAPO] [nvarchar](1) NOT NULL,
	[SPAPR] [nvarchar](1) NOT NULL,
	[VSTRM] [nvarchar](1) NOT NULL,
	[TRTRM] [nvarchar](1) NOT NULL,
	[TXN08] [nvarchar](8) NOT NULL,
	[DIAFE] [nvarchar](1) NOT NULL,
	[FELDK] [nvarchar](4) NOT NULL,
	[DATVO] [nvarchar](1) NOT NULL,
	[AWAHR] [nvarchar](3) NOT NULL,
	[VBTYP] [nvarchar](1) NOT NULL,
	[VSBED] [nvarchar](2) NOT NULL,
	[BEZOB] [nvarchar](1) NOT NULL,
	[TXTGR] [nvarchar](2) NOT NULL,
	[KALVG] [nvarchar](1) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[FEHGR] [nvarchar](2) NOT NULL,
	[INFLS] [nvarchar](1) NOT NULL,
	[KUNN0] [nvarchar](1) NOT NULL,
	[KLIMP] [nvarchar](1) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[KAPPL] [nvarchar](2) NOT NULL,
	[KSCHL] [nvarchar](4) NOT NULL,
	[SPERR] [nvarchar](1) NOT NULL,
	[STGAK] [nvarchar](2) NOT NULL,
	[KALSU] [nvarchar](6) NOT NULL,
	[KALLI] [nvarchar](6) NOT NULL,
	[KALAU] [nvarchar](6) NOT NULL,
	[FKAIV] [nvarchar](4) NOT NULL,
	[CMGRA] [nvarchar](2) NOT NULL,
	[OBJART_HIN] [nvarchar](10) NOT NULL,
	[OBJART_VER] [nvarchar](10) NOT NULL,
	[HITYP_PR] [nvarchar](1) NOT NULL,
	[ABRVW] [nvarchar](3) NOT NULL,
	[ABDIS] [nvarchar](1) NOT NULL,
	[KPRGBZ] [nvarchar](1) NOT NULL,
	[PRDATV] [nvarchar](1) NOT NULL,
	[VLAUF] [decimal](2, 0) NOT NULL,
	[GUEBGV] [nvarchar](1) NOT NULL,
	[VTERL] [nvarchar](1) NOT NULL,
	[HNWAG] [nvarchar](1) NOT NULL,
	[HNWKM] [nvarchar](1) NOT NULL,
	[STSMA] [nvarchar](8) NOT NULL,
	[LISOF] [nvarchar](1) NOT NULL,
	[AUARA] [nvarchar](4) NOT NULL,
	[KORLI] [nvarchar](4) NOT NULL,
	[VPROF] [nvarchar](4) NOT NULL,
	[AUFAK] [nvarchar](4) NOT NULL,
	[DIAPA] [nvarchar](1) NOT NULL,
	[FPART] [nvarchar](2) NOT NULL,
	[KSCHL_KO] [nvarchar](4) NOT NULL,
	[EXCOK] [nvarchar](1) NOT NULL,
	[EXMOD] [nvarchar](1) NOT NULL,
	[KSKPF] [nvarchar](6) NOT NULL,
	[KSPOS] [nvarchar](6) NOT NULL,
	[LIFSM] [nvarchar](2) NOT NULL,
	[FKTKT] [nvarchar](4) NOT NULL,
	[EXDIA] [nvarchar](1) NOT NULL,
	[ABGRU_IN] [nvarchar](2) NOT NULL,
	[PRBST] [nvarchar](1) NOT NULL,
	[SCHEME_GRP] [nvarchar](4) NULL,
	[HNWGK] [nvarchar](1) NULL,
	[PUSH_GRP] [nvarchar](1) NULL,
	[ABRUF_PART] [nvarchar](1) NULL,
	[RPART] [nvarchar](2) NULL,
	[AKTFI] [nvarchar](1) NULL,
	[VBKLT] [nvarchar](1) NULL,
	[J_1BNFTYPE] [nvarchar](2) NULL,
	[INCUP] [nvarchar](6) NULL,
	[BABSS] [nvarchar](2) NULL,
	[EMPFI] [nvarchar](1) NULL,
	[DELCF] [nvarchar](1) NULL,
	[CCPGR] [nvarchar](2) NULL,
	[EXCBC] [nvarchar](1) NULL,
	[EXCEM] [nvarchar](1) NULL,
	[EXCLG] [nvarchar](1) NULL,
	[HNWK2] [nvarchar](1) NULL,
	[EXTNR_RMA] [nvarchar](1) NULL,
	[TDID] [nvarchar](4) NULL,
	[AAUART1] [nvarchar](4) NULL,
	[AAUART2] [nvarchar](4) NULL,
	[RFPA_SW] [nvarchar](1) NULL,
	[VARIANT] [nvarchar](30) NULL,
	[ATPGM] [nvarchar](1) NULL,
	[VERLI] [nvarchar](1) NULL,
	[TENUR] [nvarchar](1) NULL,
	[J_1AFCTYPE] [nvarchar](2) NULL,
	[FAUPR] [nvarchar](14) NULL,
	[PVBSM] [nvarchar](2) NULL,
	[BPROC] [nvarchar](4) NULL,
	[ERMAT] [nvarchar](1) NULL,
	[BSTVO] [nvarchar](1) NULL,
	[EXTCONT] [nvarchar](1) NULL,
	[KSCHL_BUDGET] [nvarchar](4) NULL,
	[KSCHL_CAPS] [nvarchar](4) NULL,
	[MSR_ACTIVE] [nvarchar](1) NULL,
	[MSR_NEXT_NUMBER] [nvarchar](1) NULL,
	[MSR_AUARA] [nvarchar](4) NULL,
	[MSR_BILLING_BLK] [nvarchar](2) NULL,
	[MSR_CM_IMMEDIATE] [nvarchar](1) NULL,
	[MSR_LFART] [nvarchar](4) NULL,
	[FCS_ACTIVE] [nvarchar](1) NULL,
	[VCLASSIFIC] [nvarchar](1) NULL,
	[KALPG] [nvarchar](6) NULL,
	[KALVL] [nvarchar](6) NULL,
	[/SAPMP/PDACT] [nvarchar](1) NULL,
	[/SAPMP/PPROT] [nvarchar](1) NULL,
	[/SAPMP/PUSER] [nvarchar](1) NULL,
	[/SAPMP/PAUSW] [nvarchar](1) NULL,
	[/SAPMP/GAUF] [nvarchar](1) NULL,
	[AD01AURET] [nvarchar](4) NULL,
	[AD04NUMFLG] [nvarchar](1) NULL,
	[KALGT] [nvarchar](6) NULL,
	[UNITSALE] [nvarchar](1) NULL,
	[CPFREE] [nvarchar](1) NULL,
	[NO_BUTTON] [nvarchar](1) NULL,
	[XZEROORDER] [nvarchar](1) NULL,
	[XASSORTMENT] [nvarchar](1) NULL,
	[ISM_CONTRACT] [nvarchar](2) NULL,
	[ISM_WERKSDET] [nvarchar](1) NULL,
	[J_3GKBAUL] [nvarchar](1) NULL,
	[MILL_SE_ATNAM] [nvarchar](30) NULL,
	[OIPIPEVAL] [nvarchar](1) NULL,
	[OIISOILPD] [nvarchar](1) NULL,
	[OICSEGI] [nvarchar](1) NULL,
	[OIMSG_PRD] [nvarchar](1) NULL,
	[OIMSG_SHP] [nvarchar](1) NULL,
	[OIMSG_QTY] [nvarchar](1) NULL,
	[OIMSG_TRM] [nvarchar](1) NULL,
	[OIMSG_DAT] [nvarchar](1) NULL,
	[OIMSG_UOM] [nvarchar](1) NULL,
	[OIPRTFNC] [nvarchar](2) NULL,
	[OIFCONTI] [nvarchar](1) NULL,
	[OICFKARTDI] [nvarchar](4) NULL,
	[OIPARVW1] [nvarchar](2) NULL,
	[OIPARVW2] [nvarchar](2) NULL,
	[OIPARVW3] [nvarchar](2) NULL,
	[OIPARVW4] [nvarchar](2) NULL,
	[OIPARVW5] [nvarchar](2) NULL,
	[OIPARVW6] [nvarchar](2) NULL,
	[OIPARVW7] [nvarchar](2) NULL,
	[OIPARVW8] [nvarchar](2) NULL,
	[OIPARVW9] [nvarchar](2) NULL,
	[OISUBHEAD] [nvarchar](4) NULL,
	[OISUBITEM] [nvarchar](4) NULL,
	[OIUSEREXIT] [nvarchar](3) NULL,
	[OIU_FKARA] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVBUR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVBUR](
	[MANDT] [nvarchar](3) NOT NULL,
	[VKBUR] [nvarchar](4) NOT NULL,
	[ADRNR] [nvarchar](10) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[TXNAM_ADR] [nvarchar](16) NULL,
	[TXNAM_KOP] [nvarchar](16) NULL,
	[TXNAM_FUS] [nvarchar](16) NULL,
	[TXNAM_GRU] [nvarchar](16) NULL,
	[TXNAM_SDB] [nvarchar](16) NULL,
	[ISPVKBURUE] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVEGR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVEGR](
	[MANDT] [nvarchar](3) NOT NULL,
	[MAGRV] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVFK]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVFK](
	[MANDT] [nvarchar](3) NOT NULL,
	[FKART] [nvarchar](4) NOT NULL,
	[KOPGR] [nvarchar](4) NOT NULL,
	[NUMKI] [nvarchar](2) NOT NULL,
	[NUMKE] [nvarchar](2) NOT NULL,
	[INCPO] [nvarchar](6) NOT NULL,
	[KUNN0] [nvarchar](1) NOT NULL,
	[UEVOR] [nvarchar](4) NOT NULL,
	[UMFNG] [nvarchar](20) NOT NULL,
	[RFBFK] [nvarchar](1) NOT NULL,
	[TRVOG] [nvarchar](1) NOT NULL,
	[TXN08] [nvarchar](8) NOT NULL,
	[VBTYP] [nvarchar](1) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[PARGK] [nvarchar](4) NOT NULL,
	[PARGP] [nvarchar](4) NOT NULL,
	[KALSMC] [nvarchar](6) NOT NULL,
	[FKARTS] [nvarchar](4) NOT NULL,
	[TXTGR] [nvarchar](2) NOT NULL,
	[KAPPL] [nvarchar](2) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[KSCHL] [nvarchar](4) NOT NULL,
	[STAFO] [nvarchar](6) NOT NULL,
	[KVSLV] [nvarchar](3) NOT NULL,
	[KALVG] [nvarchar](1) NOT NULL,
	[TXTGR_P] [nvarchar](2) NOT NULL,
	[STATI] [nvarchar](1) NOT NULL,
	[KALSMBP] [nvarchar](6) NOT NULL,
	[BORVF] [nvarchar](1) NOT NULL,
	[FKART_RL] [nvarchar](4) NOT NULL,
	[RELEP] [nvarchar](1) NOT NULL,
	[TXTLF] [nvarchar](1) NOT NULL,
	[HITYP_PR] [nvarchar](1) NOT NULL,
	[FKART_AB] [nvarchar](4) NOT NULL,
	[GRBED_S] [nvarchar](3) NULL,
	[ORDNR_FI_S] [nvarchar](1) NULL,
	[XBLNR_FI_S] [nvarchar](1) NULL,
	[J_1BNFREL] [nvarchar](1) NULL,
	[J_1BMAINPA] [nvarchar](2) NULL,
	[J_1BTDIDH] [nvarchar](4) NULL,
	[J_1BTDCOH] [nvarchar](1) NULL,
	[J_1BTDIDL] [nvarchar](4) NULL,
	[J_1BTDCOL] [nvarchar](1) NULL,
	[FKTYP] [nvarchar](1) NULL,
	[XNEGP] [nvarchar](1) NULL,
	[BLART] [nvarchar](2) NULL,
	[XFILKD] [nvarchar](1) NULL,
	[XVALGS] [nvarchar](1) NULL,
	[KALSMCA] [nvarchar](6) NULL,
	[KALSMCB] [nvarchar](6) NULL,
	[KALSMCC] [nvarchar](6) NULL,
	[KALSMCD] [nvarchar](6) NULL,
	[XKOIV] [nvarchar](1) NULL,
	[J_1AINVREF] [nvarchar](1) NULL,
	[J_1ACPDEL] [nvarchar](1) NULL,
	[UVEIB] [nvarchar](3) NULL,
	[ISM_XKRVO] [nvarchar](1) NULL,
	[OICINPD] [nvarchar](1) NULL,
	[OIFEEPD] [nvarchar](1) NULL,
	[OIINVCYC1] [nvarchar](1) NULL,
	[OIINVCYC2] [nvarchar](1) NULL,
	[OIINVCYC3] [nvarchar](1) NULL,
	[OIINVCYC4] [nvarchar](1) NULL,
	[OIINVCYC5] [nvarchar](1) NULL,
	[OIINVCYC6] [nvarchar](1) NULL,
	[OIINVCYC7] [nvarchar](1) NULL,
	[OIINVCYC8] [nvarchar](1) NULL,
	[OIINVCYC9] [nvarchar](1) NULL,
	[OINETEXIT] [nvarchar](3) NULL,
	[OIPTRMEX] [nvarchar](3) NULL,
	[OIC_DIFFIN] [nvarchar](1) NULL,
	[OIC_DICNTR] [nvarchar](1) NULL,
	[OIC_ACCVAL] [nvarchar](3) NULL,
	[OIC_ERRHA] [nvarchar](3) NULL,
	[OIC_FKART] [nvarchar](4) NULL,
	[OISELEXIT] [nvarchar](3) NULL,
	[OIFINEXIT] [nvarchar](3) NULL,
	[OINETRPT] [nvarchar](40) NULL,
	[OIBTCEXIT] [nvarchar](3) NULL,
	[OIAMWOFI] [nvarchar](1) NULL,
	[OIABALAN] [nvarchar](1) NULL,
	[OIINVAPP] [nvarchar](1) NULL,
	[OIINDCM] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVFM]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVFM](
	[MANDT] [nvarchar](3) NOT NULL,
	[MTVER] [nvarchar](4) NOT NULL,
	[STAZO] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVFS]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVFS](
	[MANDT] [nvarchar](3) NOT NULL,
	[FAKSP] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVKGR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVKGR](
	[MANDT] [nvarchar](3) NOT NULL,
	[VKGRP] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVKO]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVKO](
	[MANDT] [nvarchar](3) NOT NULL,
	[VKORG] [nvarchar](4) NOT NULL,
	[WAERS] [nvarchar](5) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[TXNAM_ADR] [nvarchar](16) NULL,
	[TXNAM_KOP] [nvarchar](16) NULL,
	[TXNAM_FUS] [nvarchar](16) NULL,
	[TXNAM_GRU] [nvarchar](16) NULL,
	[VKOAU] [nvarchar](4) NULL,
	[KUNNR] [nvarchar](10) NULL,
	[BOAVO] [nvarchar](1) NULL,
	[VKOKL] [nvarchar](2) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[LIFNR] [nvarchar](10) NULL,
	[WERKS] [nvarchar](4) NULL,
	[BSART] [nvarchar](4) NULL,
	[BSTYP] [nvarchar](1) NULL,
	[BWART] [nvarchar](3) NULL,
	[LGORT] [nvarchar](4) NULL,
	[TXNAM_SDB] [nvarchar](16) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[XSTCEG] [nvarchar](1) NULL,
	[J_1ANUTIME] [nvarchar](1) NULL,
	[MAXBI] [nvarchar](3) NULL,
	[PLAUFZ] [nvarchar](3) NULL,
	[PLAUEZ] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVLA]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVLA](
	[MANDT] [nvarchar](3) NOT NULL,
	[VSTEL] [nvarchar](4) NOT NULL,
	[LSTEL] [nvarchar](2) NOT NULL,
	[VERAN] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVLG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVLG](
	[MANDT] [nvarchar](3) NOT NULL,
	[GRULG] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVLK]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVLK](
	[MANDT] [nvarchar](3) NOT NULL,
	[LFART] [nvarchar](4) NOT NULL,
	[KOPGR] [nvarchar](4) NOT NULL,
	[UEVOR] [nvarchar](4) NOT NULL,
	[TXN08] [nvarchar](8) NOT NULL,
	[UMFNG] [nvarchar](20) NOT NULL,
	[NUMKI] [nvarchar](2) NOT NULL,
	[NUMKE] [nvarchar](2) NOT NULL,
	[NUMKIRULE] [nvarchar](1) NULL,
	[INCPO] [nvarchar](6) NOT NULL,
	[PARGR] [nvarchar](4) NOT NULL,
	[AUFER] [nvarchar](1) NOT NULL,
	[DAART] [nvarchar](4) NOT NULL,
	[POBED] [nvarchar](3) NOT NULL,
	[REGGR] [nvarchar](3) NOT NULL,
	[REGLG] [nvarchar](4) NOT NULL,
	[WAAUS] [nvarchar](1) NOT NULL,
	[ROUTF] [nvarchar](1) NOT NULL,
	[VBTYP] [nvarchar](1) NOT NULL,
	[TXTGR] [nvarchar](2) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[KAPPL] [nvarchar](2) NOT NULL,
	[KALSM] [nvarchar](6) NOT NULL,
	[KSCHL] [nvarchar](4) NOT NULL,
	[STGAK] [nvarchar](2) NOT NULL,
	[CMGRL] [nvarchar](2) NOT NULL,
	[CMGRK] [nvarchar](2) NOT NULL,
	[CMGRW] [nvarchar](2) NOT NULL,
	[QHERK] [nvarchar](2) NOT NULL,
	[TRSPG] [nvarchar](2) NOT NULL,
	[TDIIX] [nvarchar](1) NOT NULL,
	[PROFIDNETZ] [nvarchar](7) NOT NULL,
	[EXCOK] [nvarchar](1) NOT NULL,
	[NEUTE] [nvarchar](1) NOT NULL,
	[KALSP] [nvarchar](6) NOT NULL,
	[FEHGR] [nvarchar](2) NULL,
	[LNSPL] [nvarchar](1) NULL,
	[AVERP] [nvarchar](1) NULL,
	[PM_ITEM_GEN] [nvarchar](1) NULL,
	[REGTB] [nvarchar](4) NULL,
	[BZOPS] [nvarchar](1) NULL,
	[EXCBC] [nvarchar](1) NULL,
	[EXCEM] [nvarchar](1) NULL,
	[EXCLG] [nvarchar](1) NULL,
	[J_1ADOCCLS] [nvarchar](1) NULL,
	[RFPL_SW] [nvarchar](1) NULL,
	[TSEGTP] [nvarchar](10) NULL,
	[UVEIB] [nvarchar](3) NULL,
	[DBTCH] [nvarchar](1) NULL,
	[DSFAD] [nvarchar](1) NULL,
	[SPOFI] [nvarchar](1) NULL,
	[OIDELDCM] [nvarchar](1) NULL,
	[SPE_NUMKT] [nvarchar](2) NULL,
	[SPE_NR_RECYCLING] [nvarchar](1) NULL,
	[BORGR_LIFEX_MUST] [nvarchar](1) NULL,
	[BORGR_LIFEX_UNQ] [nvarchar](1) NULL,
	[BORGR_LIFEX_EEDI] [nvarchar](1) NULL,
	[BORGR_LIFEX_EDIA] [nvarchar](1) NULL,
	[BORGR_SODET] [nvarchar](1) NULL,
	[HOLD_DATA] [nvarchar](1) NULL,
	[TDID] [nvarchar](4) NULL,
	[TDSPRAS] [nvarchar](1) NULL,
	[EDI_WEIGHTVOL] [nvarchar](1) NULL,
	[SPE_ENABLE_VALID] [nvarchar](1) NULL,
	[MSR_FKARA] [nvarchar](4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVLS]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVLS](
	[MANDT] [nvarchar](3) NOT NULL,
	[LIFSP] [nvarchar](2) NOT NULL,
	[SPELF] [nvarchar](1) NOT NULL,
	[SPEKO] [nvarchar](1) NOT NULL,
	[SPEWA] [nvarchar](1) NOT NULL,
	[SPEFT] [nvarchar](1) NOT NULL,
	[SPEBE] [nvarchar](1) NOT NULL,
	[SPEAU] [nvarchar](1) NOT NULL,
	[SPEDR] [nvarchar](1) NOT NULL,
	[SPEVI] [nvarchar](1) NOT NULL,
	[MBDIF] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVLV]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVLV](
	[MANDT] [nvarchar](3) NOT NULL,
	[ABRVW] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVM1]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVM1](
	[MANDT] [nvarchar](3) NOT NULL,
	[MVGR1] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVM2]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVM2](
	[MANDT] [nvarchar](3) NOT NULL,
	[MVGR2] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVM3]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVM3](
	[MANDT] [nvarchar](3) NOT NULL,
	[MVGR3] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVM4]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVM4](
	[MANDT] [nvarchar](3) NOT NULL,
	[MVGR4] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVM5]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVM5](
	[MANDT] [nvarchar](3) NOT NULL,
	[MVGR5] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVPT]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVPT](
	[MANDT] [nvarchar](3) NOT NULL,
	[PSTYV] [nvarchar](4) NOT NULL,
	[PSTYO] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVRO]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVRO](
	[MANDT] [nvarchar](3) NOT NULL,
	[ROUTE] [nvarchar](6) NOT NULL,
	[TRAZT] [decimal](5, 2) NOT NULL,
	[TRAZTD] [decimal](11, 0) NULL,
	[TDVZT] [decimal](5, 2) NOT NULL,
	[TDVZTD] [decimal](11, 0) NULL,
	[TDVZND] [decimal](11, 0) NULL,
	[SPFBK] [nvarchar](2) NOT NULL,
	[EXPVZ] [nvarchar](1) NOT NULL,
	[TDIIX] [nvarchar](1) NOT NULL,
	[SPZST] [nvarchar](10) NULL,
	[FAHZTD] [decimal](11, 0) NULL,
	[DISTZ] [decimal](13, 3) NULL,
	[MEDST] [nvarchar](3) NULL,
	[VSART] [nvarchar](2) NULL,
	[VSAVL] [nvarchar](2) NULL,
	[VSANL] [nvarchar](2) NULL,
	[TDLNR] [nvarchar](10) NULL,
	[ROUTID] [nvarchar](100) NULL,
	[TCTAB] [nvarchar](1) NULL,
	[ALLOWED_TWGT] [decimal](8, 0) NULL,
	[ALLOWED_UOM] [nvarchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVSAK]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVSAK](
	[MANDT] [nvarchar](3) NOT NULL,
	[SDABW] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVSB]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVSB](
	[MANDT] [nvarchar](3) NOT NULL,
	[VSBED] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVST]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVST](
	[MANDT] [nvarchar](3) NOT NULL,
	[VSTEL] [nvarchar](4) NOT NULL,
	[FABKL] [nvarchar](2) NULL,
	[VTRZT] [decimal](5, 2) NULL,
	[ADRNR] [nvarchar](10) NULL,
	[ALAND] [nvarchar](3) NULL,
	[AZONE] [nvarchar](10) NULL,
	[TXNAM_ADR] [nvarchar](16) NULL,
	[TXNAM_KOP] [nvarchar](16) NULL,
	[TXNAM_FUS] [nvarchar](16) NULL,
	[TXNAM_GRU] [nvarchar](16) NULL,
	[KSCHL] [nvarchar](4) NULL,
	[SPRAS] [nvarchar](1) NULL,
	[ANZAL] [decimal](2, 0) NULL,
	[VSZTP] [nvarchar](1) NULL,
	[NACHA] [nvarchar](1) NULL,
	[LAZBS] [nvarchar](1) NULL,
	[RIZBS] [nvarchar](1) NULL,
	[LAZZT] [decimal](5, 2) NULL,
	[RIZZT] [decimal](5, 2) NULL,
	[KOQUI] [nvarchar](1) NULL,
	[KOMSU] [nvarchar](10) NULL,
	[IMESS] [nvarchar](1) NULL,
	[TXNAM_SDB] [nvarchar](16) NULL,
	[ALW_SW] [nvarchar](1) NULL,
	[LOADTG] [decimal](11, 0) NULL,
	[LOADTN] [decimal](11, 0) NULL,
	[PIPATG] [decimal](11, 0) NULL,
	[PIPATN] [decimal](11, 0) NULL,
	[TSTRID] [nvarchar](10) NULL,
	[ROUNDG] [decimal](11, 0) NULL,
	[ROUNDN] [decimal](11, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVTW]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVTW](
	[MANDT] [nvarchar](3) NOT NULL,
	[VTWEG] [nvarchar](2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVTY]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVTY](
	[MANDT] [nvarchar](3) NOT NULL,
	[TRATY] [nvarchar](4) NOT NULL,
	[KAPPL] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[KSCHL] [nvarchar](4) NULL,
	[SORTF] [nvarchar](4) NULL,
	[WERFD] [nvarchar](1) NULL,
	[VELTP] [nvarchar](1) NULL,
	[GRUVS] [nvarchar](3) NULL,
	[NRVERG] [nvarchar](1) NULL,
	[SSCC18] [nvarchar](1) NULL,
	[INT_NKR] [nvarchar](2) NULL,
	[EXT_NKR] [nvarchar](2) NULL,
	[TARAVAR] [nvarchar](1) NULL,
	[STSMA] [nvarchar](8) NULL,
	[KZPGN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVV1]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVV1](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVGR1] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVV2]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVV2](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVGR2] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVV3]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVV3](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVGR3] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVV4]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVV4](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVGR4] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TVV5]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TVV5](
	[MANDT] [nvarchar](3) NOT NULL,
	[KVGR5] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TWMEG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TWMEG](
	[MANDT] [nvarchar](3) NOT NULL,
	[MEGRU] [nvarchar](4) NOT NULL,
	[MEINS] [nvarchar](3) NOT NULL,
	[WITHOUT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TWPR]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TWPR](
	[MANDT] [nvarchar](3) NOT NULL,
	[WBPRO] [nvarchar](4) NOT NULL,
	[RT23W] [nvarchar](1) NULL,
	[RT23X] [nvarchar](1) NULL,
	[KEWAR] [nvarchar](1) NULL,
	[WGHST] [nvarchar](2) NULL,
	[FWERT] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TWSG]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TWSG](
	[MANDT] [nvarchar](3) NOT NULL,
	[SERVG] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_TWUP]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_TWUP](
	[MANDT] [nvarchar](3) NOT NULL,
	[UPROF] [nvarchar](4) NOT NULL,
	[STOCKC] [nvarchar](1) NULL,
	[AKTBW] [nvarchar](1) NULL,
	[LOKAB] [nvarchar](1) NULL,
	[SPANN] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USGRP]    Script Date: 10/15/2014 5:40:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USGRP](
	[MANDT] [nvarchar](3) NOT NULL,
	[USERGROUP] [nvarchar](12) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USGRPT]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USGRPT](
	[MANDT] [nvarchar](3) NOT NULL,
	[SPRSL] [nvarchar](1) NOT NULL,
	[USERGROUP] [nvarchar](12) NOT NULL,
	[TEXT] [nvarchar](60) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USOBT]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USOBT](
	[NAME] [nvarchar](30) NOT NULL,
	[TYPE] [nvarchar](2) NULL,
	[OBJECT] [nvarchar](10) NOT NULL,
	[FIELD] [nvarchar](10) NOT NULL,
	[LOW] [nvarchar](40) NOT NULL,
	[HIGH] [nvarchar](40) NOT NULL,
	[MODIFIER] [nvarchar](12) NULL,
	[MODDATE] [nvarchar](8) NULL,
	[MODTIME] [nvarchar](6) NULL,
	[MODIFIED] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USOBT_C]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USOBT_C](
	[NAME] [nvarchar](30) NOT NULL,
	[TYPE] [nvarchar](2) NULL,
	[OBJECT] [nvarchar](10) NOT NULL,
	[FIELD] [nvarchar](10) NOT NULL,
	[LOW] [nvarchar](40) NOT NULL,
	[HIGH] [nvarchar](40) NOT NULL,
	[MODIFIER] [nvarchar](12) NULL,
	[MODDATE] [nvarchar](8) NULL,
	[MODTIME] [nvarchar](6) NULL,
	[MODIFIED] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USOBX]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USOBX](
	[NAME] [nvarchar](30) NOT NULL,
	[TYPE] [nvarchar](2) NOT NULL,
	[OBJECT] [nvarchar](10) NOT NULL,
	[MODIFIER] [nvarchar](12) NULL,
	[MODDATE] [nvarchar](8) NULL,
	[MODTIME] [nvarchar](6) NULL,
	[OKFLAG] [nvarchar](1) NOT NULL,
	[MODIFIED] [nvarchar](1) NULL,
	[ORGNAME] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USOBX_C]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USOBX_C](
	[NAME] [nvarchar](30) NOT NULL,
	[TYPE] [nvarchar](2) NOT NULL,
	[OBJECT] [nvarchar](10) NOT NULL,
	[MODIFIER] [nvarchar](12) NULL,
	[MODDATE] [nvarchar](8) NULL,
	[MODTIME] [nvarchar](6) NULL,
	[OKFLAG] [nvarchar](1) NOT NULL,
	[MODIFIED] [nvarchar](1) NULL,
	[ORGNAME] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR02]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR02](
	[MANDT] [nvarchar](3) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[BCODE] [nvarchar](255) NULL,
	[GLTGV] [nvarchar](8) NOT NULL,
	[GLTGB] [nvarchar](8) NOT NULL,
	[USTYP] [nvarchar](1) NOT NULL,
	[CLASS] [nvarchar](12) NOT NULL,
	[LOCNT] [smallint] NOT NULL,
	[UFLAG] [smallint] NOT NULL,
	[ACCNT] [nvarchar](12) NOT NULL,
	[ANAME] [nvarchar](12) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[TRDAT] [nvarchar](8) NOT NULL,
	[LTIME] [nvarchar](6) NOT NULL,
	[OCOD1] [nvarchar](255) NULL,
	[BCDA1] [nvarchar](8) NULL,
	[CODV1] [nvarchar](1) NULL,
	[OCOD2] [nvarchar](255) NULL,
	[BCDA2] [nvarchar](8) NULL,
	[CODV2] [nvarchar](1) NULL,
	[OCOD3] [nvarchar](255) NULL,
	[BCDA3] [nvarchar](8) NULL,
	[CODV3] [nvarchar](1) NULL,
	[OCOD4] [nvarchar](255) NULL,
	[BCDA4] [nvarchar](8) NULL,
	[CODV4] [nvarchar](1) NULL,
	[OCOD5] [nvarchar](255) NULL,
	[BCDA5] [nvarchar](8) NULL,
	[CODV5] [nvarchar](1) NULL,
	[VERSN] [nvarchar](3) NULL,
	[CODVN] [nvarchar](1) NULL,
	[TZONE] [nvarchar](6) NULL,
	[ZBVMASTER] [nvarchar](1) NULL,
	[PASSCODE] [nvarchar](255) NULL,
	[PWDCHGDATE] [nvarchar](8) NULL,
	[PWDSTATE] [smallint] NULL,
	[RESERVED] [smallint] NULL,
	[PWDHISTORY] [smallint] NULL,
	[PWDLGNDATE] [nvarchar](8) NULL,
	[PWDSETDATE] [nvarchar](8) NULL,
	[PWDINITIAL] [smallint] NULL,
	[PWDLOCKDATE] [nvarchar](8) NULL,
	[PWDSALTEDHASH] [nvarchar](255) NULL,
 CONSTRAINT [PK_SAP_USR02] PRIMARY KEY CLUSTERED 
(
	[BNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR04]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR04](
	[MANDT] [nvarchar](3) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[MODDA] [nvarchar](8) NOT NULL,
	[MODTI] [nvarchar](6) NOT NULL,
	[MODBE] [nvarchar](12) NOT NULL,
	[NRPRO] [nvarchar](5) NULL,
	[PROFS] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR06]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR06](
	[MANDT] [nvarchar](3) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[LIC_TYPE] [nvarchar](2) NOT NULL,
	[VONDAT] [nvarchar](8) NOT NULL,
	[BISDAT] [nvarchar](8) NOT NULL,
	[MANDT2] [nvarchar](3) NOT NULL,
	[SYSID] [nvarchar](8) NOT NULL,
	[ANAME] [nvarchar](12) NOT NULL,
	[EASLPFL] [nvarchar](1) NOT NULL,
	[SPRAS] [nvarchar](2) NOT NULL,
	[SURCHARGE] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR10]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR10](
	[MANDT] [nvarchar](3) NOT NULL,
	[PROFN] [nvarchar](12) NOT NULL,
	[AKTPS] [nvarchar](1) NOT NULL,
	[MODDA] [nvarchar](8) NULL,
	[MODTI] [nvarchar](6) NULL,
	[MODBE] [nvarchar](12) NULL,
	[DIVIS] [nvarchar](10) NULL,
	[TYP] [nvarchar](1) NULL,
	[NRAUT] [smallint] NULL,
	[AUTHS] [nvarchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR12]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR12](
	[MANDT] [nvarchar](3) NOT NULL,
	[OBJCT] [nvarchar](10) NOT NULL,
	[AUTH] [nvarchar](12) NOT NULL,
	[AKTPS] [nvarchar](1) NOT NULL,
	[MODDA] [nvarchar](8) NULL,
	[MODTI] [nvarchar](6) NULL,
	[MODBE] [nvarchar](12) NULL,
	[TYP] [nvarchar](1) NULL,
	[LNG] [smallint] NULL,
	[VALS] [nvarchar](3750) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_USR21]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_USR21](
	[MANDT] [nvarchar](3) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[PERSNUMBER] [nvarchar](10) NULL,
	[ADDRNUMBER] [nvarchar](10) NULL,
	[KOSTL] [nvarchar](8) NULL,
	[START_MENU] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_UST04]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_UST04](
	[MANDT] [nvarchar](3) NOT NULL,
	[BNAME] [nvarchar](12) NOT NULL,
	[PROFILE] [nvarchar](12) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_UST10C]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_UST10C](
	[MANDT] [nvarchar](3) NOT NULL,
	[PROFN] [nvarchar](12) NOT NULL,
	[AKTPS] [nvarchar](1) NOT NULL,
	[SUBPROF] [nvarchar](12) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_UST10S]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_UST10S](
	[MANDT] [nvarchar](3) NOT NULL,
	[PROFN] [nvarchar](12) NOT NULL,
	[AKTPS] [nvarchar](1) NOT NULL,
	[OBJCT] [nvarchar](10) NOT NULL,
	[AUTH] [nvarchar](12) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_UST12]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_UST12](
	[MANDT] [nvarchar](3) NOT NULL,
	[OBJCT] [nvarchar](10) NOT NULL,
	[AUTH] [nvarchar](12) NOT NULL,
	[AKTPS] [nvarchar](1) NOT NULL,
	[FIELD] [nvarchar](10) NOT NULL,
	[VON] [nvarchar](40) NOT NULL,
	[BIS] [nvarchar](40) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VALW]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VALW](
	[MANDT] [nvarchar](3) NOT NULL,
	[AULWE] [nvarchar](10) NOT NULL,
	[ROUTE] [nvarchar](6) NULL,
	[PRIOA] [nvarchar](3) NULL,
	[PERI_AUSPR] [nvarchar](3) NULL,
	[W_ZEIT] [nvarchar](6) NULL,
	[V_TAGE] [nvarchar](5) NULL,
	[V_STUNDE] [nvarchar](2) NULL,
	[V_MINUTEN] [nvarchar](2) NULL,
	[AV_TAGE] [nvarchar](5) NULL,
	[AV_STUNDEN] [nvarchar](2) NULL,
	[AV_MINUTEN] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VBEP]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VBEP](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[POSNR] [nvarchar](6) NOT NULL,
	[ETENR] [nvarchar](4) NOT NULL,
	[ETTYP] [nvarchar](2) NULL,
	[LFREL] [nvarchar](1) NULL,
	[EDATU] [nvarchar](8) NULL,
	[EZEIT] [nvarchar](6) NULL,
	[WMENG] [decimal](13, 3) NULL,
	[BMENG] [decimal](13, 3) NULL,
	[VRKME] [nvarchar](3) NULL,
	[LMENG] [decimal](13, 3) NULL,
	[MEINS] [nvarchar](3) NULL,
	[BDDAT] [nvarchar](8) NULL,
	[BDART] [nvarchar](2) NULL,
	[PLART] [nvarchar](1) NULL,
	[VBELE] [nvarchar](10) NULL,
	[POSNE] [nvarchar](6) NULL,
	[ETENE] [nvarchar](4) NULL,
	[RSDAT] [nvarchar](8) NULL,
	[IDNNR] [nvarchar](10) NULL,
	[BANFN] [nvarchar](10) NULL,
	[BSART] [nvarchar](4) NULL,
	[BSTYP] [nvarchar](1) NULL,
	[WEPOS] [nvarchar](1) NULL,
	[REPOS] [nvarchar](1) NULL,
	[LRGDT] [nvarchar](8) NULL,
	[PRGRS] [nvarchar](1) NULL,
	[TDDAT] [nvarchar](8) NULL,
	[MBDAT] [nvarchar](8) NULL,
	[LDDAT] [nvarchar](8) NULL,
	[WADAT] [nvarchar](8) NULL,
	[CMENG] [decimal](13, 3) NULL,
	[LIFSP] [nvarchar](2) NULL,
	[GRSTR] [nvarchar](3) NULL,
	[ABART] [nvarchar](1) NULL,
	[ABRUF] [nvarchar](10) NULL,
	[ROMS1] [decimal](13, 3) NULL,
	[ROMS2] [decimal](13, 3) NULL,
	[ROMS3] [decimal](13, 3) NULL,
	[ROMEI] [nvarchar](3) NULL,
	[RFORM] [nvarchar](2) NULL,
	[UMVKZ] [decimal](5, 0) NULL,
	[UMVKN] [decimal](5, 0) NULL,
	[VERFP] [nvarchar](1) NULL,
	[BWART] [nvarchar](3) NULL,
	[BNFPO] [nvarchar](5) NULL,
	[ETART] [nvarchar](1) NULL,
	[AUFNR] [nvarchar](12) NULL,
	[PLNUM] [nvarchar](10) NULL,
	[SERNR] [nvarchar](8) NULL,
	[AESKD] [nvarchar](17) NULL,
	[ABGES] [float] NULL,
	[MBUHR] [nvarchar](6) NULL,
	[TDUHR] [nvarchar](6) NULL,
	[LDUHR] [nvarchar](6) NULL,
	[WAUHR] [nvarchar](6) NULL,
	[AULWE] [nvarchar](10) NULL,
	[MBDAT_DRS] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VBLB]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VBLB](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[POSNR] [nvarchar](6) NOT NULL,
	[ABRLI] [nvarchar](4) NOT NULL,
	[ABART] [nvarchar](1) NOT NULL,
	[DOCNUM] [nvarchar](16) NOT NULL,
	[ABEFZ] [decimal](15, 3) NOT NULL,
	[ABRAB] [nvarchar](8) NOT NULL,
	[ABRBI] [nvarchar](8) NOT NULL,
	[LABNK] [nvarchar](17) NOT NULL,
	[ABRDT] [nvarchar](8) NOT NULL,
	[TERSL] [nvarchar](1) NOT NULL,
	[LFDKD] [nvarchar](8) NOT NULL,
	[LFNKD] [nvarchar](10) NOT NULL,
	[ABFDA] [nvarchar](8) NOT NULL,
	[ABFDE] [nvarchar](8) NOT NULL,
	[ABMDA] [nvarchar](8) NOT NULL,
	[ABMDE] [nvarchar](8) NOT NULL,
	[ABLLI] [nvarchar](4) NOT NULL,
	[HIFFZ] [decimal](15, 3) NOT NULL,
	[HIFFZLI] [nvarchar](4) NOT NULL,
	[HIMFZ] [decimal](15, 3) NOT NULL,
	[HIMFZLI] [nvarchar](4) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[ERZEI] [nvarchar](6) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[HILFZ] [decimal](15, 3) NOT NULL,
	[HILFZLI] [nvarchar](4) NOT NULL,
	[ABHOR] [nvarchar](8) NOT NULL,
	[GJKUN] [nvarchar](4) NOT NULL,
	[VJKUN] [nvarchar](4) NOT NULL,
	[AKMFZ] [decimal](15, 3) NOT NULL,
	[AKFFZ] [decimal](15, 3) NOT NULL,
	[AKLFZ] [decimal](15, 3) NOT NULL,
	[KRITB] [nvarchar](1) NOT NULL,
	[LABKY] [nvarchar](1) NOT NULL,
	[VBRST] [nvarchar](14) NOT NULL,
	[EDLLS] [nvarchar](20) NOT NULL,
	[EDLDT] [nvarchar](8) NOT NULL,
	[LFMKD] [decimal](13, 3) NOT NULL,
	[UMVKZ] [decimal](5, 0) NOT NULL,
	[UMVKN] [decimal](5, 0) NOT NULL,
	[USR01] [nvarchar](35) NOT NULL,
	[USR02] [nvarchar](35) NOT NULL,
	[USR03] [nvarchar](35) NOT NULL,
	[USR04] [nvarchar](10) NOT NULL,
	[USR05] [nvarchar](10) NOT NULL,
	[CYEFZ] [decimal](15, 3) NULL,
	[CYDAT] [nvarchar](8) NULL,
	[MFLAUF] [nvarchar](3) NULL,
	[MFEIN] [nvarchar](1) NULL,
	[FFLAUF] [nvarchar](3) NULL,
	[FFEIN] [nvarchar](1) NULL,
	[ABRDT_ORG] [nvarchar](8) NULL,
	[LFMAIS] [nvarchar](20) NULL,
	[MAIDT] [nvarchar](8) NULL,
	[AEDAT] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VBUK]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VBUK](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[RFSTK] [nvarchar](1) NULL,
	[RFGSK] [nvarchar](1) NULL,
	[BESTK] [nvarchar](1) NULL,
	[LFSTK] [nvarchar](1) NULL,
	[LFGSK] [nvarchar](1) NULL,
	[WBSTK] [nvarchar](1) NULL,
	[FKSTK] [nvarchar](1) NULL,
	[FKSAK] [nvarchar](1) NULL,
	[BUCHK] [nvarchar](1) NULL,
	[ABSTK] [nvarchar](1) NULL,
	[GBSTK] [nvarchar](1) NULL,
	[KOSTK] [nvarchar](1) NULL,
	[LVSTK] [nvarchar](1) NULL,
	[UVALS] [nvarchar](1) NULL,
	[UVVLS] [nvarchar](1) NULL,
	[UVFAS] [nvarchar](1) NULL,
	[UVALL] [nvarchar](1) NULL,
	[UVVLK] [nvarchar](1) NULL,
	[UVFAK] [nvarchar](1) NULL,
	[UVPRS] [nvarchar](1) NULL,
	[VBTYP] [nvarchar](1) NULL,
	[VBOBJ] [nvarchar](1) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[FKIVK] [nvarchar](1) NULL,
	[RELIK] [nvarchar](1) NULL,
	[UVK01] [nvarchar](1) NULL,
	[UVK02] [nvarchar](1) NULL,
	[UVK03] [nvarchar](1) NULL,
	[UVK04] [nvarchar](1) NULL,
	[UVK05] [nvarchar](1) NULL,
	[UVS01] [nvarchar](1) NULL,
	[UVS02] [nvarchar](1) NULL,
	[UVS03] [nvarchar](1) NULL,
	[UVS04] [nvarchar](1) NULL,
	[UVS05] [nvarchar](1) NULL,
	[PKSTK] [nvarchar](1) NULL,
	[CMPSA] [nvarchar](1) NULL,
	[CMPSB] [nvarchar](1) NULL,
	[CMPSC] [nvarchar](1) NULL,
	[CMPSD] [nvarchar](1) NULL,
	[CMPSE] [nvarchar](1) NULL,
	[CMPSF] [nvarchar](1) NULL,
	[CMPSG] [nvarchar](1) NULL,
	[CMPSH] [nvarchar](1) NULL,
	[CMPSI] [nvarchar](1) NULL,
	[CMPSJ] [nvarchar](1) NULL,
	[CMPSK] [nvarchar](1) NULL,
	[CMPSL] [nvarchar](1) NULL,
	[CMPS0] [nvarchar](1) NULL,
	[CMPS1] [nvarchar](1) NULL,
	[CMPS2] [nvarchar](1) NULL,
	[CMGST] [nvarchar](1) NULL,
	[TRSTA] [nvarchar](1) NULL,
	[KOQUK] [nvarchar](1) NULL,
	[COSTA] [nvarchar](1) NULL,
	[SAPRL] [nvarchar](4) NULL,
	[UVPAS] [nvarchar](1) NULL,
	[UVPIS] [nvarchar](1) NULL,
	[UVWAS] [nvarchar](1) NULL,
	[UVPAK] [nvarchar](1) NULL,
	[UVPIK] [nvarchar](1) NULL,
	[UVWAK] [nvarchar](1) NULL,
	[UVGEK] [nvarchar](1) NULL,
	[CMPSM] [nvarchar](1) NULL,
	[DCSTK] [nvarchar](1) NULL,
	[VESTK] [nvarchar](1) NULL,
	[VLSTK] [nvarchar](1) NULL,
	[RRSTA] [nvarchar](1) NULL,
	[BLOCK] [nvarchar](1) NULL,
	[FSSTK] [nvarchar](1) NULL,
	[LSSTK] [nvarchar](1) NULL,
	[SPSTG] [nvarchar](1) NULL,
	[PDSTK] [nvarchar](1) NULL,
	[FMSTK] [nvarchar](1) NULL,
	[MANEK] [nvarchar](1) NULL,
	[SPE_TMPID] [nvarchar](1) NULL,
	[HDALL] [nvarchar](1) NULL,
	[HDALS] [nvarchar](1) NULL,
	[CMPS_CM] [nvarchar](1) NULL,
	[CMPS_TE] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VBUP]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VBUP](
	[MANDT] [nvarchar](3) NOT NULL,
	[VBELN] [nvarchar](10) NOT NULL,
	[POSNR] [nvarchar](6) NOT NULL,
	[RFSTA] [nvarchar](1) NULL,
	[RFGSA] [nvarchar](1) NULL,
	[BESTA] [nvarchar](1) NULL,
	[LFSTA] [nvarchar](1) NULL,
	[LFGSA] [nvarchar](1) NULL,
	[WBSTA] [nvarchar](1) NULL,
	[FKSTA] [nvarchar](1) NULL,
	[FKSAA] [nvarchar](1) NULL,
	[ABSTA] [nvarchar](1) NULL,
	[GBSTA] [nvarchar](1) NULL,
	[KOSTA] [nvarchar](1) NULL,
	[LVSTA] [nvarchar](1) NULL,
	[UVALL] [nvarchar](1) NULL,
	[UVVLK] [nvarchar](1) NULL,
	[UVFAK] [nvarchar](1) NULL,
	[UVPRS] [nvarchar](1) NULL,
	[FKIVP] [nvarchar](1) NULL,
	[UVP01] [nvarchar](1) NULL,
	[UVP02] [nvarchar](1) NULL,
	[UVP03] [nvarchar](1) NULL,
	[UVP04] [nvarchar](1) NULL,
	[UVP05] [nvarchar](1) NULL,
	[PKSTA] [nvarchar](1) NULL,
	[KOQUA] [nvarchar](1) NULL,
	[COSTA] [nvarchar](1) NULL,
	[CMPPI] [nvarchar](1) NULL,
	[CMPPJ] [nvarchar](1) NULL,
	[UVPIK] [nvarchar](1) NULL,
	[UVPAK] [nvarchar](1) NULL,
	[UVWAK] [nvarchar](1) NULL,
	[DCSTA] [nvarchar](1) NULL,
	[RRSTA] [nvarchar](1) NULL,
	[VLSTP] [nvarchar](1) NULL,
	[FSSTA] [nvarchar](1) NULL,
	[LSSTA] [nvarchar](1) NULL,
	[PDSTA] [nvarchar](1) NULL,
	[MANEK] [nvarchar](1) NULL,
	[HDALL] [nvarchar](1) NULL,
	[LTSPS] [nvarchar](1) NULL,
	[MILL_VS_VSSTA] [nvarchar](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VFKK]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VFKK](
	[MANDT] [nvarchar](3) NOT NULL,
	[FKNUM] [nvarchar](10) NOT NULL,
	[VBTYP] [nvarchar](1) NULL,
	[FKART] [nvarchar](4) NULL,
	[STERM] [nvarchar](1) NULL,
	[PRSDT] [nvarchar](8) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[EXTI1] [nvarchar](20) NULL,
	[EXTI2] [nvarchar](20) NULL,
	[STBER] [nvarchar](1) NULL,
	[STFRE] [nvarchar](1) NULL,
	[STABR] [nvarchar](1) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERZET] [nvarchar](6) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[AEZET] [nvarchar](6) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_VFKP]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_VFKP](
	[MANDT] [nvarchar](3) NOT NULL,
	[FKNUM] [nvarchar](10) NOT NULL,
	[FKPOS] [nvarchar](6) NOT NULL,
	[FKPTY] [nvarchar](4) NULL,
	[BUKRS] [nvarchar](4) NULL,
	[NETWR] [decimal](15, 2) NULL,
	[MWSBP] [decimal](13, 2) NULL,
	[WAERS] [nvarchar](5) NULL,
	[MWSKZ] [nvarchar](2) NULL,
	[PRSDT] [nvarchar](8) NULL,
	[BUDAT] [nvarchar](8) NULL,
	[EXTI1] [nvarchar](20) NULL,
	[EXTI2] [nvarchar](20) NULL,
	[TPLST] [nvarchar](4) NULL,
	[VSART] [nvarchar](2) NULL,
	[KALSM] [nvarchar](6) NULL,
	[KNUMV] [nvarchar](10) NULL,
	[WERKS] [nvarchar](4) NULL,
	[EKORG] [nvarchar](4) NULL,
	[EKGRP] [nvarchar](3) NULL,
	[EBELN] [nvarchar](10) NULL,
	[EBELP] [nvarchar](5) NULL,
	[LBLNI] [nvarchar](10) NULL,
	[PARVW] [nvarchar](2) NULL,
	[TDLNR] [nvarchar](10) NULL,
	[RECHS] [nvarchar](10) NULL,
	[KURST] [nvarchar](4) NULL,
	[KOSTY] [nvarchar](1) NULL,
	[REFTY] [nvarchar](1) NULL,
	[REBEL] [nvarchar](10) NULL,
	[REPOS] [nvarchar](6) NULL,
	[POSTX] [nvarchar](40) NULL,
	[KNTTP] [nvarchar](1) NULL,
	[BKLAS] [nvarchar](4) NULL,
	[STBER] [nvarchar](1) NULL,
	[DTBER] [nvarchar](8) NULL,
	[UZBER] [nvarchar](6) NULL,
	[STFRE] [nvarchar](1) NULL,
	[DTFRE] [nvarchar](8) NULL,
	[UZFRE] [nvarchar](6) NULL,
	[STABR] [nvarchar](1) NULL,
	[DTABR] [nvarchar](8) NULL,
	[UZABR] [nvarchar](6) NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL,
	[ERZET] [nvarchar](6) NULL,
	[AENAM] [nvarchar](12) NULL,
	[AEDAT] [nvarchar](8) NULL,
	[AEZET] [nvarchar](6) NULL,
	[LOGSYS] [nvarchar](10) NULL,
	[KSTAU] [nvarchar](1) NULL,
	[TRFZNA] [nvarchar](10) NULL,
	[TRFZNZ] [nvarchar](10) NULL,
	[TXJCD] [nvarchar](15) NULL,
	[BASWR] [decimal](15, 2) NULL,
	[SLAND1_A] [nvarchar](3) NULL,
	[SLAND1_Z] [nvarchar](3) NULL,
	[FKSTO] [nvarchar](1) NULL,
	[KZWI1] [decimal](13, 2) NULL,
	[KZWI2] [decimal](13, 2) NULL,
	[KZWI3] [decimal](13, 2) NULL,
	[KZWI4] [decimal](13, 2) NULL,
	[KZWI5] [decimal](13, 2) NULL,
	[KZWI6] [decimal](13, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_WAKH]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_WAKH](
	[MANDT] [nvarchar](3) NOT NULL,
	[AKTNR] [nvarchar](10) NOT NULL,
	[AKTYP] [nvarchar](4) NOT NULL,
	[AKART] [nvarchar](4) NOT NULL,
	[WAELA] [nvarchar](5) NOT NULL,
	[WAERA] [nvarchar](5) NOT NULL,
	[VGLAK] [nvarchar](10) NOT NULL,
	[LISRE] [nvarchar](2) NULL,
	[AUFAR] [nvarchar](4) NULL,
	[BEKTY] [nvarchar](4) NULL,
	[KSBEK] [nvarchar](6) NULL,
	[AKVST] [nvarchar](1) NOT NULL,
	[AKAST] [nvarchar](1) NOT NULL,
	[AKBST] [nvarchar](1) NOT NULL,
	[VKGST] [nvarchar](1) NULL,
	[EKGST] [nvarchar](1) NULL,
	[BEKST] [nvarchar](1) NULL,
	[AKNBS] [smallint] NOT NULL,
	[AKNFG] [smallint] NOT NULL,
	[AKNBF] [smallint] NOT NULL,
	[AKNTH] [smallint] NOT NULL,
	[AKNPO] [smallint] NOT NULL,
	[AKNWM] [smallint] NOT NULL,
	[AKNTX] [smallint] NOT NULL,
	[NEKKO] [smallint] NOT NULL,
	[NVKKO] [smallint] NOT NULL,
	[NARTS] [smallint] NOT NULL,
	[ATNPO] [smallint] NOT NULL,
	[VTART] [nvarchar](1) NOT NULL,
	[EKDAB] [nvarchar](8) NOT NULL,
	[EKDBI] [nvarchar](8) NOT NULL,
	[VKDAB] [nvarchar](8) NOT NULL,
	[VKDBI] [nvarchar](8) NOT NULL,
	[ALIVO] [nvarchar](8) NOT NULL,
	[ALIBI] [nvarchar](8) NOT NULL,
	[SPDAB] [nvarchar](8) NOT NULL,
	[SPGRU] [nvarchar](1) NOT NULL,
	[EKKON] [nvarchar](1) NULL,
	[VKKON] [nvarchar](1) NULL,
	[KOBOG] [nvarchar](4) NULL,
	[EKORG] [nvarchar](4) NOT NULL,
	[EKGRP] [nvarchar](3) NOT NULL,
	[VKORG] [nvarchar](4) NOT NULL,
	[VTWEG] [nvarchar](2) NOT NULL,
	[PLUEP] [decimal](13, 2) NOT NULL,
	[PLUEN] [decimal](13, 2) NULL,
	[PLUVP] [decimal](13, 2) NOT NULL,
	[PLMGE] [decimal](13, 3) NOT NULL,
	[PLANZ] [nvarchar](6) NOT NULL,
	[MELAK] [nvarchar](3) NOT NULL,
	[MELRA] [nvarchar](3) NOT NULL,
	[PDUEP] [decimal](13, 2) NOT NULL,
	[PDUEN] [decimal](13, 2) NULL,
	[PDUVP] [decimal](13, 2) NOT NULL,
	[PDMGE] [decimal](13, 3) NOT NULL,
	[PDANZ] [nvarchar](6) NOT NULL,
	[VAUEP] [decimal](13, 2) NOT NULL,
	[VAUEN] [decimal](13, 2) NULL,
	[VAUVP] [decimal](13, 2) NOT NULL,
	[VAMGE] [decimal](13, 3) NOT NULL,
	[RFIND] [nvarchar](20) NOT NULL,
	[VAANZ] [nvarchar](6) NOT NULL,
	[ERNAM] [nvarchar](12) NOT NULL,
	[ERDAT] [nvarchar](8) NOT NULL,
	[AENAM] [nvarchar](12) NOT NULL,
	[AEDAT] [nvarchar](8) NOT NULL,
	[KOBVK] [nvarchar](4) NULL,
	[FADAT] [nvarchar](8) NULL,
	[SADAT] [nvarchar](8) NULL,
	[FLDAT] [nvarchar](8) NULL,
	[SLDAT] [nvarchar](8) NULL,
	[ADDIBELNR] [nvarchar](10) NULL,
	[VZKON] [nvarchar](1) NULL,
	[KALKE] [nvarchar](1) NULL,
	[PLTYP] [nvarchar](2) NULL,
	[NO_KALK] [nvarchar](1) NULL,
	[EKERV] [nvarchar](2) NULL,
	[RFCDEST] [nvarchar](32) NULL,
	[ERAPPL] [nvarchar](1) NULL,
	[KSCHL_PERC] [nvarchar](4) NULL,
	[KSCHL_VAL] [nvarchar](4) NULL,
	[PLUNP] [decimal](13, 2) NULL,
	[PLURE] [decimal](13, 2) NULL,
	[PLULO] [decimal](13, 2) NULL,
	[MEDIA_TYPE] [nvarchar](4) NULL,
	[CUSTOMER_TYPE] [nvarchar](4) NULL,
	[ALLOW_PMAT_IGNO] [nvarchar](1) NULL,
	[ITEMS_4_BBY] [nvarchar](1) NULL,
	[ALLOW_DISP_MAT] [nvarchar](1) NULL,
	[INIT_SLS_PRICE] [nvarchar](1) NULL,
	[REF_PROMO] [nvarchar](10) NULL,
	[CGPL_GUID] [varbinary](16) NULL,
	[EXTERNAL_ID] [nvarchar](24) NULL,
	[IS_REF_PROMO] [nvarchar](1) NULL,
	[BEKST2] [nvarchar](1) NULL,
	[ERDOCN] [nvarchar](10) NULL,
	[HIER_ID] [nvarchar](2) NULL,
	[BPROF] [nvarchar](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAP_WRF_REF_RFS]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_WRF_REF_RFS](
	[MANDT] [nvarchar](3) NOT NULL,
	[REF_SCHEMA] [nvarchar](2) NOT NULL,
	[REF_FIND_TYPE] [nvarchar](2) NULL,
	[TREE_LEVEL] [nvarchar](2) NULL,
	[FACTOR] [decimal](4, 2) NULL,
	[VALIDITY_RANGE] [nvarchar](3) NULL,
	[HIST_BASE_FILTER] [nvarchar](1) NULL,
	[EXCLUSION_RANGE] [nvarchar](3) NULL,
	[INACTIVITY_RANGE] [nvarchar](3) NULL,
	[NEW_COMP_RANGE] [nvarchar](3) NULL,
	[CHECK_RELEVANCE] [nvarchar](1) NULL,
	[RANGE] [smallint] NULL,
	[THRESHOLD] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_WRFT_CONS_PROCG]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_WRFT_CONS_PROCG](
	[MANDT] [nvarchar](3) NOT NULL,
	[WRF_CONS_PROCG] [nvarchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_WRFT_POHF_SOURCE]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_WRFT_POHF_SOURCE](
	[MANDT] [nvarchar](3) NOT NULL,
	[SOURCE_ID] [nvarchar](3) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAP_WYT1]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_WYT1](
	[MANDT] [nvarchar](3) NOT NULL,
	[LIFNR] [nvarchar](10) NOT NULL,
	[LTSNR] [nvarchar](6) NOT NULL,
	[ERNAM] [nvarchar](12) NULL,
	[ERDAT] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VW_MENU_MASTER]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_MENU_MASTER] AS
WITH CTECompany
AS
(
    SELECT 
        ID, 
        PARENT_ID, 
        DISPLAYNAME , 
		URL,
        0 AS HLevel,
        CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),ID),20) AS VARCHAR(MAX)) AS OrderByField
    FROM INGRC_MENU_MASTER
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT 
        C.ID, 
        C.PARENT_ID, 
        C.DISPLAYNAME , 
        C.URL,
		(CTE.HLevel + 1) AS HLevel,
        CTE.OrderByField + CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),C.ID),20) AS VARCHAR(MAX)) AS OrderByField
    FROM INGRC_MENU_MASTER C
    INNER JOIN CTECompany CTE ON CTE.ID = C.PARENT_ID
    WHERE C.PARENT_ID IS NOT NULL
)
SELECT 
    ID
    , PARENT_ID
    , HLEVEL
    , DISPLAYNAME
	, URL
	, ORDERBYFIELD
    , (REPLICATE( '----' , HLevel ) + DISPLAYNAME) AS DISPLAY
FROM CTECompany X
--ORDER BY OrderByField,DISPLAYNAME;
GO
/****** Object:  View [dbo].[VW_MENU_MASTER_GENERATOR]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_MENU_MASTER_GENERATOR] AS
select CAST((
	SELECT 'nav navbar-nav navbar-left' as [class],
		( 
		SELECT
			(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then
				'dropdown' 
			end  
			) as [@class],
			O.URL AS [a/@href],
			(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then
				'dropdown-toggle' 
			end  
			) as [a/@class],
			(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then
				'dropdown' 
			end  
			) as [a/@data-toggle],
			(O.DISPLAYNAME) AS [a],
			(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then
				'caret' 
			end  
			) as [a/b/@class],
			(case when (select count(*) from vw_menu_master c where c.parent_id=o.id) > 0 then
				'dropdown-menu' 
			end  
			) as [ul/@class],
			(
				   SELECT 
						I.URL AS [a/@href],
						  I.DISPLAYNAME AS [a]
				   FROM   VW_MENU_MASTER I
				   WHERE  I.PARENT_ID = O.ID
				   ORDER BY I.ORDERBYFIELD
				   FOR XML PATH('li'), TYPE
				 ) AS [ul]
		  FROM   VW_MENU_MASTER O
		  WHERE O.PARENT_ID IS NULL
		  ORDER BY O.ORDERBYFIELD
		  FOR XML PATH ('li'), TYPE
	) FOR XML RAW('ul')
) as VARCHAR(MAX)) AS XMLSTRING
GO
/****** Object:  View [dbo].[VW_MENU_MASTER_LEFT]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_MENU_MASTER_LEFT] AS
WITH CTECompany
AS
(
    SELECT 
        ID, 
        PARENT_ID, 
        DISPLAYNAME , 
		URL,
		MENU_MASTER_ID,
        0 AS HLevel,
        CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),ID),20) AS VARCHAR(MAX)) AS OrderByField
    FROM INGRC_MENU_MASTER_LEFT
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT 
        C.ID, 
        C.PARENT_ID, 
        C.DISPLAYNAME , 
        C.URL,
		C.MENU_MASTER_ID,
		(CTE.HLevel + 1) AS HLevel,
        CTE.OrderByField + CAST(RIGHT(REPLICATE('_',5) +  CONVERT(VARCHAR(20),C.ID),20) AS VARCHAR(MAX)) AS OrderByField
    FROM INGRC_MENU_MASTER_LEFT C
    INNER JOIN CTECompany CTE ON CTE.ID = C.PARENT_ID AND CTE.MENU_MASTER_ID = C.MENU_MASTER_ID
    WHERE C.PARENT_ID IS NOT NULL
)
SELECT 
    ID
    , PARENT_ID
    , HLevel as HLEVEL
    , DISPLAYNAME
	, URL
	, MENU_MASTER_ID
	, OrderByField as ORDERBYFIELD
    , (REPLICATE( '----' , HLevel ) + DISPLAYNAME) AS DISPLAY
FROM CTECompany X
--WHERE MENU_MASTER_ID=4
--ORDER BY OrderByField,DISPLAYNAME;


GO
/****** Object:  View [dbo].[VW_MENU_MASTER_LEFT_GENERATOR]    Script Date: 10/15/2014 5:40:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VW_MENU_MASTER_LEFT_GENERATOR] AS
select CAST((
	SELECT 
		'pages-app' AS [id],
		'nav nav-pills nav-stacked' as [class],
		( 
		SELECT
			('#' + O.DISPLAYNAME) AS [a/@href],
			'collapse' AS [a/@class],
			'collapse' AS [a/@data-toggle],
			'pages-app' AS [a/@data-parent],
			(O.DISPLAYNAME) AS [a],
			'fa fa-angle-down pull-right' as [a/i/@class],
			'panel-collapse collapse  list-unstyled' AS [ul/@class],
			'menu' AS [ul/@role],
			O.DISPLAYNAME AS [ul/@id],
			(
				   SELECT 
						I.URL AS [a/@href],
						  I.DISPLAYNAME AS [a]
				   FROM   VW_MENU_MASTER_LEFT I
				   WHERE  I.PARENT_ID = O.ID AND I.MENU_MASTER_ID = O.MENU_MASTER_ID
				   ORDER BY I.ORDERBYFIELD
				   FOR XML PATH('li'), TYPE
				 ) AS [ul]
		  FROM   VW_MENU_MASTER_LEFT O
		  WHERE O.MENU_MASTER_ID=1 and O.PARENT_ID IS NULL
		  ORDER BY O.ORDERBYFIELD
		  FOR XML PATH ('li'), --ROOT('ul')
			TYPE
	) FOR XML RAW('ul')
) as VARCHAR(MAX)) AS XMLSTRING
GO
/****** Object:  Index [IX_INGRC_ATTCH]    Script Date: 10/15/2014 5:40:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_INGRC_ATTCH] ON [dbo].[INGRC_ATTCH]
(
	[ATCHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[INGRC_TOWNT] ADD  CONSTRAINT [DF_INGRC_TOWNT_LANG]  DEFAULT ('EN') FOR [LANG]
GO
ALTER TABLE [dbo].[INGRC_MENU_MASTER_LEFT]  WITH CHECK ADD  CONSTRAINT [FK_INGRC_MENU_MASTER_LEFT_INGRC_MENU_MASTER] FOREIGN KEY([MENU_MASTER_ID])
REFERENCES [dbo].[INGRC_MENU_MASTER] ([ID])
GO
ALTER TABLE [dbo].[INGRC_MENU_MASTER_LEFT] CHECK CONSTRAINT [FK_INGRC_MENU_MASTER_LEFT_INGRC_MENU_MASTER]
GO
ALTER TABLE [dbo].[SAP_USR02]  WITH CHECK ADD  CONSTRAINT [FK_SAP_USR02_SAP_USR021] FOREIGN KEY([BNAME])
REFERENCES [dbo].[SAP_USR02] ([BNAME])
GO
ALTER TABLE [dbo].[SAP_USR02] CHECK CONSTRAINT [FK_SAP_USR02_SAP_USR021]
GO
USE [master]
GO
ALTER DATABASE [PERFORMA] SET  READ_WRITE 
GO
