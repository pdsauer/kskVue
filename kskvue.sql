USE [master]
GO
/****** Object:  Database [kskVue]    Script Date: 12.03.2020 11:20:55 ******/
CREATE DATABASE [kskVue]
 CONTAINMENT = NONE
GO
ALTER DATABASE [kskVue] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kskVue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kskVue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kskVue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kskVue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kskVue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kskVue] SET ARITHABORT OFF 
GO
ALTER DATABASE [kskVue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kskVue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kskVue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kskVue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kskVue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kskVue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kskVue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kskVue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kskVue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kskVue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kskVue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kskVue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kskVue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kskVue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kskVue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kskVue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kskVue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kskVue] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kskVue] SET  MULTI_USER 
GO
ALTER DATABASE [kskVue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kskVue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kskVue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kskVue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [kskVue] SET DELAYED_DURABILITY = DISABLED 
GO
USE [kskVue]
GO
/****** Object:  Table [dbo].[löschen_tblGesamt]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[löschen_tblGesamt](
	[Std_ID] [int] NULL,
	[Gesamt] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[migrations]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[migration] [nvarchar](255) NOT NULL,
	[batch] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Berufsgruppen]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Berufsgruppen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Berufsgruppen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_UT_Mitarbeiter]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UT_Mitarbeiter](
	[ID_UT_MA] [int] IDENTITY(1,1) NOT NULL,
	[Personalnummer] [int] NOT NULL,
	[Von] [datetime] NULL,
	[Bis] [datetime] NULL,
	[Am] [datetime] NULL,
	[Berufsgruppe] [int] NULL,
	[Mit_Std_Anzahl] [decimal](18, 2) NULL,
	[Stundensatz] [smallmoney] NULL,
	[Bemerkung] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_UT_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[ID_UT_MA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblADRESSEN]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblADRESSEN](
	[Nummer] [int] IDENTITY(1,1) NOT NULL,
	[Anrede_Büro] [nvarchar](50) NULL,
	[Büroart] [nvarchar](50) NULL,
	[Titel_Vorname] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Suchfeld] [nvarchar](50) NULL,
	[Abteilung2] [nvarchar](60) NULL,
	[Abteilung] [nvarchar](60) NULL,
	[Straße] [nvarchar](50) NULL,
	[Ortsteil] [nvarchar](50) NULL,
	[Postleitzahl] [nvarchar](7) NULL,
	[Ort] [nvarchar](50) NULL,
	[Kreis] [nvarchar](50) NULL,
	[Info] [nvarchar](max) NULL,
	[Datum] [datetime] NULL,
	[Fax] [nvarchar](20) NULL,
	[Telefon] [nvarchar](20) NULL,
	[Handy] [nvarchar](20) NULL,
	[Email] [nvarchar](max) NULL,
	[Web_Seite] [nvarchar](max) NULL,
	[Land] [nvarchar](50) NULL,
	[Architekt] [bit] NULL,
	[Bauherr] [bit] NULL,
	[Auftraggeber] [bit] NULL,
	[Aufsteller] [bit] NULL,
	[Eutin] [bit] NULL,
	[Ascheberg] [bit] NULL,
	[Norderstedt] [bit] NULL,
	[Inaktiv] [bit] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_ADRESSEN] PRIMARY KEY CLUSTERED 
(
	[Nummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAnforderungen]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnforderungen](
	[lfdNr] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime] NULL,
	[Mitarbeiter] [nvarchar](255) NULL,
	[Idee] [nvarchar](max) NULL,
	[Menüpunkt] [nvarchar](255) NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Fragen] [nvarchar](max) NULL,
	[Schlagwort] [nvarchar](255) NULL,
	[ID_Status] [int] NULL,
	[Status] [nvarchar](255) NULL,
	[MitarbeiterNr] [int] NULL,
	[DatumProgramm] [datetime] NULL,
	[Getestetam] [datetime] NULL,
	[LinkWord] [nvarchar](255) NULL,
	[Priorität] [decimal](18, 0) NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_tblAnforderungen] PRIMARY KEY CLUSTERED 
(
	[lfdNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAnsprechpartner]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnsprechpartner](
	[AP_Nr] [int] IDENTITY(1,1) NOT NULL,
	[Nummer] [int] NULL,
	[Titel] [nvarchar](50) NULL,
	[Anrede] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Telefon1] [nvarchar](50) NULL,
	[Telefon2] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Handy_Auto] [nvarchar](50) NULL,
	[Privat] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Info] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Weihnachten] [bit] NULL,
	[Feier] [bit] NULL,
	[Geschenk] [bit] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblAnsprechpartner] PRIMARY KEY CLUSTERED 
(
	[AP_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAnsprechpartnerlEvent]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnsprechpartnerlEvent](
	[EventNr] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](50) NULL,
	[AP_Nr] [int] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblAnsprechpartnerlEvent] PRIMARY KEY CLUSTERED 
(
	[EventNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAufträge]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAufträge](
	[Auftrags_ID] [int] IDENTITY(1,1) NOT NULL,
	[P_K] [nvarchar](1) NOT NULL,
	[Büro_Nr] [nvarchar](1) NOT NULL,
	[lfdNr] [int] NULL,
	[JahrAuftrag] [int] NULL,
	[Auftrags_Nr] [nvarchar](50) NOT NULL,
	[Auftrags_Nr_Alt] [nvarchar](6) NULL,
	[Bauort] [nvarchar](50) NULL,
	[Straße] [nvarchar](50) NULL,
	[Aktenzeichen] [nvarchar](50) NULL,
	[Auftragg_KdNr] [int] NULL,
	[Auftraggeber] [nvarchar](255) NULL,
	[Auftragg_KdNr_An] [nvarchar](5) NULL,
	[Auftragg_AP] [int] NULL,
	[Auftragg_AP_An] [nvarchar](5) NULL,
	[AuftragAnsprechpartner] [nvarchar](255) NULL,
	[Kreis] [nvarchar](50) NULL,
	[Kreis_KdNr] [nchar](10) NULL,
	[Kreis_An] [nvarchar](5) NULL,
	[Bauherr_KdNr_Neu] [int] NULL,
	[Bauherr] [nvarchar](255) NULL,
	[Bauherr_KdNr_Neu_An] [nvarchar](5) NULL,
	[Architekt_KdNr] [int] NULL,
	[Architekt] [nvarchar](255) NULL,
	[Architekt_KdNr_Ueber] [nvarchar](5) NULL,
	[Aufsteller_KdNr] [int] NULL,
	[Aufsteller] [nvarchar](255) NULL,
	[Aufsteller_KdNr_Ueber] [nvarchar](5) NULL,
	[Bezeichnung_kurz] [nvarchar](50) NOT NULL,
	[Bezeichnung_lang] [nvarchar](255) NULL,
	[Bauartkennzahl] [nvarchar](50) NULL,
	[Bauwerkskl] [int] NULL,
	[Gebaeudeart] [nvarchar](20) NULL,
	[Anr_Kosten] [money] NULL,
	[Nach_Zeitaufwand] [bit] NULL,
	[Auftrags_Datum] [datetime] NULL,
	[Termin] [datetime] NULL,
	[Enddatum] [datetime] NULL,
	[Schallschutz] [nvarchar](4) NULL,
	[Wärmeschutz] [nvarchar](4) NULL,
	[FWD] [nvarchar](4) NULL,
	[Konstr_Überwachung] [nvarchar](4) NULL,
	[Realisiert] [bit] NULL,
	[Schlußbericht] [nvarchar](max) NULL,
	[SKP] [bit] NULL,
	[Link] [nvarchar](255) NULL,
	[Nummer] [int] NULL,
	[TS] [timestamp] NULL,
	[Stundensatz] [smallmoney] NULL,
	[Indexzahl] [decimal](18, 3) NULL,
	[PersNr] [int] NULL,
 CONSTRAINT [PK_Aufträge] PRIMARY KEY CLUSTERED 
(
	[Auftrags_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAusw_Aktion]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAusw_Aktion](
	[Aktion] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblAusw_Aktion] PRIMARY KEY CLUSTERED 
(
	[Aktion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAusw_Büro]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAusw_Büro](
	[Büro_Nr] [nvarchar](1) NOT NULL,
	[Büro] [nvarchar](50) NULL,
	[Chef] [nvarchar](100) NULL,
	[AdressNr] [int] NULL,
	[Ergänzung] [nvarchar](50) NULL,
	[PfadBüro] [nvarchar](255) NULL,
	[KürzelBüro] [nvarchar](10) NULL,
	[Aktiv] [bit] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblAusw_Büro] PRIMARY KEY CLUSTERED 
(
	[Büro_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBauprüfRechnung]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBauprüfRechnung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Bauwert] [decimal](18, 2) NULL,
	[BW1] [decimal](18, 2) NULL,
	[BW2] [decimal](18, 2) NULL,
	[BW3] [decimal](18, 2) NULL,
	[BW4] [decimal](18, 2) NULL,
	[BW5] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblBauprüfRechnung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEvent]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEvent](
	[EventNr] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nvarchar](50) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblEvent] PRIMARY KEY CLUSTERED 
(
	[EventNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGruppe]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGruppe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gruppe] [nvarchar](50) NULL,
	[Start] [int] NULL,
	[Ende] [int] NULL,
	[BüroNr] [nvarchar](1) NULL,
	[P_K] [nvarchar](1) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblGruppe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHilfe]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHilfe](
	[ID] [int] NOT NULL,
	[Pfad] [nvarchar](255) NULL,
	[DokumentenName] [nvarchar](255) NULL,
	[Formular] [nvarchar](255) NULL,
	[Menüpunkt] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblHilfe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHilfe_Form]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHilfe_Form](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Hilfe] [int] NULL,
	[Name_Form] [nvarchar](255) NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Aufruf] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblHilfe_Form] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHilfe_Modul]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHilfe_Modul](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Hilfe] [int] NULL,
	[Name_Modul] [nvarchar](255) NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Aufruf] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblHilfe_Modul] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHilfe_Report]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHilfe_Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Hilfe] [int] NULL,
	[Name_Report] [nvarchar](255) NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Aufruf] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblHilfe_Report] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHilfe_View]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHilfe_View](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Hilfe] [int] NULL,
	[Name_View] [nvarchar](255) NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Aufruf] [nvarchar](255) NULL,
	[Link] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblHilfe_View] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKommunikationsverlauf]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKommunikationsverlauf](
	[KoV_Nr] [int] IDENTITY(1,1) NOT NULL,
	[Auftrags_ID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Adressat] [nvarchar](100) NULL,
	[Adressat_Liste] [int] NULL,
	[Adressat_Liste_Text] [nvarchar](255) NULL,
	[Eingang] [bit] NULL,
	[Ausgang] [bit] NULL,
	[Rechnung] [bit] NULL,
	[Rechnungbezahlt] [bit] NULL,
	[Rechnungsbetrag] [numeric](18, 2) NULL,
	[Inhalt] [nvarchar](255) NULL,
	[Wiedervorlage] [datetime] NULL,
	[WVerledigt] [bit] NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_Kommunikationsverlauf] PRIMARY KEY CLUSTERED 
(
	[KoV_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMeldungsDatum]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeldungsDatum](
	[frm_ID] [nchar](10) NOT NULL,
	[Formular] [nvarchar](50) NOT NULL,
	[LetzteMeldung] [date] NOT NULL,
	[NächsteMeldung] [date] NOT NULL,
	[AnzeigeDatum] [date] NULL,
	[Büro] [int] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblMeldungsDatum] PRIMARY KEY CLUSTERED 
(
	[frm_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMitarbeiter]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMitarbeiter](
	[Kürzel] [nvarchar](3) NOT NULL,
	[Anrede] [nvarchar](10) NULL,
	[Titel] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Durchwahl] [nvarchar](5) NULL,
	[PersNr] [int] NOT NULL,
	[Std_Satz] [money] NOT NULL,
	[Büro_Nr] [nvarchar](50) NOT NULL,
	[Gruppe] [decimal](18, 2) NULL,
	[Soll_Std_Tag] [decimal](18, 2) NOT NULL,
	[AlteÜberStd] [decimal](18, 2) NULL,
	[Letzte] [datetime] NULL,
	[Soll_U_Tage] [decimal](18, 1) NULL,
	[Resturlaubstage] [int] NULL,
	[AusgezahlteUrlaubstage] [int] NULL,
	[Akt_U_Tage] [int] NULL,
	[Vj_Abschluss_Urlaubstage] [int] NULL,
	[Vj_Tarif_Tage] [decimal](18, 1) NULL,
	[Vj_Resttage] [decimal](18, 1) NULL,
	[Vj_Verbrauchte_Urlaubstage] [decimal](18, 1) NULL,
	[Speicherung_Akt_U_Tage] [datetime] NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
	[Eintrittsdatum] [datetime] NULL,
	[Austrittsdatum] [datetime] NULL,
	[Deaktiv] [bit] NOT NULL,
	[letzteAktualisierung] [datetime] NULL,
	[Stichtag_ÜStdBerechnung] [datetime] NULL,
	[ÜStd_am_Stichtag] [decimal](18, 2) NULL,
	[Benutzer] [nvarchar](50) NULL,
	[ZugriffRechte] [int] NULL CONSTRAINT [DF_tblMitarbeiter_ZugriffRechte]  DEFAULT ((1)),
	[TS] [timestamp] NULL,
	[Email] [nvarchar](max) NULL,
	[Erinnerung] [datetime] NULL,
	[ErinnerungJa] [bit] NULL,
	[password] [nvarchar](255) NULL,
	[remember_token] [nvarchar](100) NULL,
	[updated_at] [date] NULL,
	[created_at] [date] NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[PersNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMitarbeiter2312]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMitarbeiter2312](
	[Kürzel] [nvarchar](3) NOT NULL,
	[Soll_U_Tage] [int] NULL,
	[Resturlaubstage] [int] NULL,
	[AusgezahlteUrlaubstage] [int] NULL,
	[Akt_U_Tage] [int] NULL,
	[Speicherung_Akt_U_Tage] [datetime] NULL,
 CONSTRAINT [PK_tblMitarbeiter2312] PRIMARY KEY CLUSTERED 
(
	[Kürzel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMonatsStunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonatsStunden](
	[Büro_Nr] [nvarchar](1) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[P_K] [nvarchar](1) NULL,
	[UStd_ID] [int] IDENTITY(1,1) NOT NULL,
	[Std] [decimal](18, 2) NULL,
	[Kosten] [decimal](18, 2) NULL,
	[Datum] [datetime] NULL,
	[Km] [decimal](18, 2) NULL,
	[KmGeld] [decimal](18, 2) NULL,
	[Nachname] [nvarchar](50) NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_Monats Stunden] PRIMARY KEY CLUSTERED 
(
	[UStd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMonatsStundenExcel]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonatsStundenExcel](
	[Büro_Nr] [nvarchar](1) NULL,
	[P_K] [nvarchar](1) NULL,
	[Std] [decimal](18, 2) NULL,
	[Kosten] [money] NULL,
	[Km] [decimal](18, 3) NULL,
	[Km_Kosten] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMonatsStundenExcelMitarbeiter]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonatsStundenExcelMitarbeiter](
	[Nachname] [nvarchar](50) NULL,
	[Büro_Nr] [nvarchar](1) NULL,
	[P_K] [nvarchar](1) NULL,
	[Std] [decimal](18, 2) NULL,
	[Kosten] [money] NULL,
	[Km] [decimal](18, 3) NULL,
	[Km_Kosten] [money] NULL,
	[PersNr] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNettoAbTage]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNettoAbTage](
	[lfdnr] [int] IDENTITY(1,1) NOT NULL,
	[NettoAbTage] [int] NULL,
	[Büro_Nr] [nvarchar](50) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblNettoAbTage] PRIMARY KEY CLUSTERED 
(
	[lfdnr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNettoAbTageNeu]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNettoAbTageNeu](
	[AnzahlvonBüro_Nr] [int] NULL,
	[PersNr] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblP_K]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblP_K](
	[P_K] [nvarchar](1) NOT NULL,
	[P_K_Bezeichjnung] [nvarchar](12) NULL,
	[P_K_Neu] [nvarchar](3) NULL,
	[Aktiv] [bit] NULL,
	[Sort] [int] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblP_K] PRIMARY KEY CLUSTERED 
(
	[P_K] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPosts]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[inhalt] [nvarchar](max) NOT NULL,
	[author] [int] NOT NULL,
	[Für_büro] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProfil]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfil](
	[ProfilNr] [int] NOT NULL,
	[PfadAscheberg] [nvarchar](255) NULL,
	[PfadEutin] [nvarchar](255) NULL,
	[PfadNorderstedt] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
	[DatumArchiv] [datetime] NULL,
	[Stundensatz] [smallmoney] NULL,
	[IndexZahl] [decimal](18, 3) NULL,
 CONSTRAINT [PK_tblProfil] PRIMARY KEY CLUSTERED 
(
	[ProfilNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblResturlaub]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblResturlaub](
	[RestNeu] [int] NULL,
	[DatumRestNeu] [datetime] NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_tblResturlaub] PRIMARY KEY CLUSTERED 
(
	[PersNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSchreiben]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSchreiben](
	[lfdNr] [int] IDENTITY(1,1) NOT NULL,
	[Nummer] [int] NULL,
	[Auftrags_ID] [int] NULL,
	[Text1] [nvarchar](255) NULL,
	[Text2] [nvarchar](255) NULL,
	[Text3] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblSchreiben] PRIMARY KEY CLUSTERED 
(
	[lfdNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSpeicherort]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpeicherort](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DokumentName] [nvarchar](255) NULL,
	[Speicherort] [nvarchar](255) NULL,
	[Büro_Nr] [int] NULL,
	[Kategorie] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblPfadSpeicher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KurzText] [nvarchar](20) NULL,
	[LangText] [nvarchar](50) NULL,
	[Löschen] [bit] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStunden](
	[Std_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dat_Kuerz] [nvarchar](50) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Von] [decimal](18, 2) NULL,
	[Bis] [decimal](18, 2) NULL,
	[Pause] [decimal](18, 2) NULL,
	[Std_gesamt] [decimal](18, 2) NULL,
	[Vonalt] [decimal](18, 2) NULL,
	[Bisalt] [decimal](18, 2) NULL,
	[Pausealt] [decimal](18, 2) NULL,
	[Schlüssel] [nvarchar](14) NULL,
	[Username] [nvarchar](255) NULL,
	[Eingabedatum] [datetime] NULL CONSTRAINT [DF_tblStunden_Eingabedatum]  DEFAULT (getdate()),
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_tblStunden] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStundenKopieOhneDecimal]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStundenKopieOhneDecimal](
	[Std_ID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime] NULL,
	[Vonalt] [decimal](18, 2) NULL,
	[Bisalt] [decimal](18, 2) NULL,
	[Pausealt] [decimal](18, 2) NULL,
	[Std_gesamt] [decimal](18, 2) NULL,
	[Dat_Kuerz] [nvarchar](50) NULL,
	[Schlüssel] [nvarchar](14) NULL,
	[Von] [decimal](18, 2) NULL,
	[Bis] [decimal](18, 2) NULL,
	[Pause] [decimal](18, 2) NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStundenUF]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStundenUF](
	[UStd_ID] [int] IDENTITY(1,1) NOT NULL,
	[Std_Id] [int] NOT NULL,
	[Auftrags_ID] [int] NOT NULL,
	[Tkurz] [nvarchar](6) NOT NULL,
	[Std] [decimal](18, 2) NULL,
	[Km] [decimal](18, 2) NULL,
	[Bemerkungen] [nvarchar](max) NULL,
	[Bauherr] [nvarchar](255) NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_UF_Stunden] PRIMARY KEY CLUSTERED 
(
	[UStd_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTätigkeiten]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTätigkeiten](
	[T_kurz] [nvarchar](6) NOT NULL,
	[Tätigkeit] [nvarchar](50) NULL,
	[alte_Nr] [int] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_Tätigkeiten] PRIMARY KEY CLUSTERED 
(
	[T_kurz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUT_Überstunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUT_Überstunden](
	[Kürz_Dat] [nvarchar](15) NOT NULL,
	[LetztesDatum] [datetime] NULL,
	[VonDatum] [datetime] NULL,
	[BisDatum] [datetime] NULL,
	[ÜberStd] [decimal](18, 2) NULL,
	[Ausgezahlte_Std] [decimal](18, 2) NULL,
	[Rest_Std] [decimal](18, 2) NULL,
	[TS] [datetime] NULL,
	[PersNr] [int] NULL,
 CONSTRAINT [PK_UT_Überstunden] PRIMARY KEY CLUSTERED 
(
	[Kürz_Dat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVerbrauchteUrlaubstageKJ]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVerbrauchteUrlaubstageKJ](
	[VerbrauchteTage] [int] NULL,
	[bisDatum] [datetime] NULL,
	[Kalenderjahr] [int] NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_tblVerbrauchteUrlaubstageKJ] PRIMARY KEY CLUSTERED 
(
	[PersNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVerbrauchteUrlaubstageKJNEU]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVerbrauchteUrlaubstageKJNEU](
	[VerbrauchteTage] [int] NULL,
	[bisDatum] [datetime] NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL,
 CONSTRAINT [PK_tblVerbrauchteUrlaubstageKJNEU] PRIMARY KEY CLUSTERED 
(
	[PersNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVerbrauchteUrlaubstageKJTest]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVerbrauchteUrlaubstageKJTest](
	[UrlaubsTage] [int] NULL,
	[bisDatum] [varchar](10) NOT NULL,
	[Kalenderjahr] [int] NULL,
	[TS] [timestamp] NULL,
	[PersNr] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVersion]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVersion](
	[ID] [int] NOT NULL,
	[Version] [nvarchar](50) NULL,
	[Datum] [datetime] NULL,
 CONSTRAINT [PK_tblVersion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVorlagen]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVorlagen](
	[lfdNr] [int] IDENTITY(1,1) NOT NULL,
	[NameModul] [nvarchar](50) NULL,
	[NameFunktion] [nvarchar](50) NULL,
	[VorlageName] [nvarchar](255) NULL,
	[PfadAblage] [nvarchar](255) NULL,
	[P_K] [nvarchar](1) NULL,
 CONSTRAINT [PK_tblVorlagen] PRIMARY KEY CLUSTERED 
(
	[lfdNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWochendatum]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWochendatum](
	[Woche] [int] NULL,
	[W_Datum] [datetime] NULL,
	[TS] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWordAblage]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWordAblage](
	[lfdNr] [int] IDENTITY(1,1) NOT NULL,
	[Auftrags_ID] [int] NULL,
	[Nummer] [int] NULL,
	[Link] [nvarchar](255) NULL,
	[DokumentenName] [nvarchar](255) NULL,
	[TS] [nchar](10) NULL,
 CONSTRAINT [PK_tblWordAblage] PRIMARY KEY CLUSTERED 
(
	[lfdNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblZwischentabelle_CH]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblZwischentabelle_CH](
	[Datum] [datetime] NULL,
	[KW] [int] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[Bezeichnung_kurz] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Tätigkeit] [nvarchar](50) NULL,
	[Std] [int] NULL,
	[Km] [int] NULL,
	[Std_Satz] [money] NULL,
	[Kosten] [decimal](18, 2) NULL,
	[Bemerkungen] [nvarchar](max) NULL,
	[TS] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblZwischentabelle_EG]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblZwischentabelle_EG](
	[Jahr_KW] [nvarchar](255) NULL,
	[Datum] [datetime] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[Bezeichnung_kurz] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Tätigkeit] [nvarchar](50) NULL,
	[Std] [int] NULL,
	[Km] [decimal](18, 2) NULL,
	[Bemerkungen] [nvarchar](max) NULL,
	[TS] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblZwischentabelle_RG]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblZwischentabelle_RG](
	[Büro] [nvarchar](50) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[P_K] [nvarchar](1) NULL,
	[Bauherr] [nvarchar](100) NULL,
	[Postleitzahl] [nvarchar](7) NULL,
	[Ort] [nvarchar](50) NULL,
	[Bauort] [nvarchar](50) NULL,
	[Straße] [nvarchar](50) NULL,
	[Bezeichnung_kurz] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Auftrags_Datum] [datetime] NULL,
	[Realisiert] [bit] NULL,
	[Enddatum] [datetime] NULL,
	[Inhalt] [nvarchar](255) NULL,
	[Anr_Kosten] [int] NULL,
	[Nach_Zeitaufwand] [bit] NULL,
	[Rechnung] [bit] NULL,
	[Rechnung bezahlt] [bit] NULL,
	[Rechnungsbetrag] [decimal](18, 2) NULL,
	[Datum] [datetime] NULL,
	[TS] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMonatsStunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMonatsStunden](
	[Dat_Kuerz] [nvarchar](50) NOT NULL,
	[Büro_Nr] [nvarchar](1) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[P_K] [nvarchar](1) NULL,
	[UStd_ID] [int] NULL,
	[Std] [decimal](18, 2) NULL,
	[Kosten] [money] NULL,
	[Km] [decimal](18, 2) NULL,
	[KmGeld] [money] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Nachname] [nvarchar](50) NULL,
	[Datum] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMonatsStundenalt]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMonatsStundenalt](
	[Büro_Nr] [nvarchar](1) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[P_K] [nvarchar](1) NULL,
	[UStd_ID] [int] NOT NULL,
	[Std] [decimal](18, 2) NULL,
	[Kosten] [money] NULL,
	[Datum] [datetime] NULL,
	[Km] [decimal](18, 2) NULL,
	[KmGeld] [money] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Nachname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMonatStundenExcel]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMonatStundenExcel](
	[Büro_Nr] [nvarchar](1) NULL,
	[P_K] [nvarchar](1) NULL,
	[SummeStd] [float] NULL,
	[SummeKosten] [money] NULL,
	[SummeKm] [float] NULL,
	[SummeKMGeld] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMonatStundenExcelMA]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMonatStundenExcelMA](
	[Kürzel] [nvarchar](3) NULL,
	[Nachname] [nvarchar](50) NULL,
	[Büro_Nr] [nvarchar](1) NULL,
	[P_K] [nvarchar](1) NULL,
	[SummeStd] [float] NULL,
	[SummeKosten] [money] NULL,
	[SummeKm] [float] NULL,
	[SummeKMGeld] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpStundenauswahlExcel_1]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpStundenauswahlExcel_1](
	[Datum] [datetime] NULL,
	[KW] [int] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[Bezeichnung_kurz] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Büro] [nvarchar](50) NULL,
	[Tätigkeit] [nvarchar](50) NULL,
	[Std] [decimal](18, 2) NULL,
	[Km] [decimal](18, 2) NULL,
	[Std_Satz] [money] NULL,
	[Kosten] [money] NULL,
	[Bemerkungen] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpStundenauswahlExcel_2]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpStundenauswahlExcel_2](
	[Jahr] [int] NULL,
	[KW] [int] NULL,
	[Datum] [datetime] NOT NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[Tätigkeit] [nvarchar](50) NULL,
	[Std] [decimal](18, 2) NULL,
	[Bemerkungen] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_OLD]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_OLD](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[email_verified_at] [date] NULL,
	[password] [nvarchar](255) NOT NULL,
	[remember_token] [nvarchar](100) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[z20131209Resturlaub]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z20131209Resturlaub](
	[Kürzel] [nvarchar](255) NULL,
	[RestNeu] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_Adressen]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_Adressen](
	[Nummer] [int] IDENTITY(1,1) NOT NULL,
	[Anrede_Büro] [nvarchar](50) NULL,
	[Büroart] [nvarchar](50) NULL,
	[Titel_Vorname] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Firma] [nvarchar](100) NULL,
	[Suchfeld] [nvarchar](50) NULL,
	[Abteilung] [nvarchar](60) NULL,
	[Straße] [nvarchar](50) NULL,
	[Ortsteil] [nvarchar](50) NULL,
	[Postleitzahl] [nvarchar](7) NULL,
	[Ort] [nvarchar](50) NULL,
	[Info] [ntext] NULL,
	[Datum] [datetime] NULL,
	[Fax] [nvarchar](20) NULL,
	[Telefon] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Web_Seite] [nvarchar](50) NULL,
	[Land] [nvarchar](50) NULL,
	[Architekt] [bit] NULL,
	[Bauherr] [bit] NULL,
	[Auftraggeber] [bit] NULL,
	[Aufsteller] [bit] NULL,
	[Eutin] [bit] NULL,
	[Ascheberg] [bit] NULL,
	[Norderstedt] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_ANSPRECHPARTNER]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_ANSPRECHPARTNER](
	[AP_Nr] [int] IDENTITY(1,1) NOT NULL,
	[Nummer] [int] NULL,
	[Titel] [nvarchar](50) NULL,
	[Anrede] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Telefon1] [nvarchar](50) NULL,
	[Telefon2] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Handy_Auto] [nvarchar](50) NULL,
	[Privat] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Info] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Weihnachten] [bit] NULL,
	[Feier] [bit] NULL,
	[Messe Allg] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_Aufträge]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_Aufträge](
	[Auftrags_ID] [int] IDENTITY(1,1) NOT NULL,
	[Büro_Nr] [nvarchar](1) NULL,
	[Auftrags_Nr] [nvarchar](50) NULL,
	[Auftrags_Nr_Alt] [nvarchar](6) NULL,
	[P_K] [nvarchar](1) NULL,
	[Bauort] [nvarchar](50) NULL,
	[Straße] [nvarchar](50) NULL,
	[Auftragg_KdNr] [int] NULL,
	[Auftragg_AP] [int] NULL,
	[Aktenzeichen] [nvarchar](50) NULL,
	[Bauherr_KdNr_Neu] [int] NULL,
	[Architekt_KdNr] [int] NULL,
	[Aufsteller_KdNr] [int] NULL,
	[Bezeichnung_kurz] [nvarchar](50) NULL,
	[Bezeichnung_lang] [nvarchar](255) NULL,
	[Bauartkennzahl] [nvarchar](50) NULL,
	[Bauwerkskl] [int] NULL,
	[Gebaeudeart] [nvarchar](5) NULL,
	[Anr_Kosten] [int] NULL,
	[Nach_Zeitaufwand] [bit] NULL,
	[Auftrags_Datum] [datetime] NULL,
	[Termin] [datetime] NULL,
	[Enddatum] [datetime] NULL,
	[Schallschutz] [nvarchar](4) NULL,
	[Wärmeschutz] [nvarchar](4) NULL,
	[FWD] [nvarchar](4) NULL,
	[Konstr_Überwachung] [nvarchar](4) NULL,
	[Realisiert] [bit] NULL,
	[Sachbearbeiter] [nvarchar](3) NULL,
	[Schlußbericht] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_Kommunikationsverlauf]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_Kommunikationsverlauf](
	[KoV_Nr] [int] IDENTITY(1,1) NOT NULL,
	[Auftrags_ID] [int] NULL,
	[Datum] [datetime] NULL,
	[Adressat] [nvarchar](100) NULL,
	[Adressat_Liste] [int] NULL,
	[Bearbeiter] [nvarchar](3) NULL,
	[Eingang] [bit] NULL,
	[Ausgang] [bit] NULL,
	[Rechnung] [bit] NULL,
	[Rechnung bezahlt] [bit] NULL,
	[Rechnungsbetrag] [float] NULL,
	[Inhalt] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_Mitarbeiter]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_Mitarbeiter](
	[Nachname] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Kürzel] [nvarchar](3) NULL,
	[Std_Satz] [money] NULL,
	[Büro_Nr] [nvarchar](50) NULL,
	[Gruppe] [real] NULL,
	[Soll_Std_Tag] [real] NULL,
	[AlteÜberStd] [real] NULL,
	[Resturlaubstage] [int] NULL,
	[Ausgezahlte Urlaubstage] [int] NULL,
	[Soll_U_Tage] [int] NULL,
	[Berufsgruppe] [nvarchar](50) NULL,
	[Eintrittsdatum] [datetime] NULL,
	[Austrittsdatum] [datetime] NULL,
	[Deaktiv] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_Stunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_Stunden](
	[Std_ID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime] NULL,
	[M_Kürzel] [nvarchar](50) NULL,
	[Dat_Kuerz] [nvarchar](50) NOT NULL,
	[Beginn] [int] NULL,
	[Ende] [int] NULL,
	[Unterbrechung] [int] NULL,
	[Gesamt] [int] NULL,
 CONSTRAINT [PK_Stunden] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Dat_Kuerz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_UF_Stunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_UF_Stunden](
	[UStd_ID] [int] IDENTITY(1,1) NOT NULL,
	[Std_Id] [int] NULL,
	[Auftrags_ID] [int] NULL,
	[Tkurz] [nvarchar](6) NULL,
	[Std] [real] NULL,
	[Km] [real] NULL,
	[Bemerkungen] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zAlt_UT_Überstunden]    Script Date: 12.03.2020 11:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zAlt_UT_Überstunden](
	[Kürz_Dat] [nvarchar](15) NULL,
	[LetztesDatum] [datetime] NULL,
	[Kürzel] [nvarchar](3) NULL,
	[VonDatum] [datetime] NULL,
	[BisDatum] [datetime] NULL,
	[ÜberStd] [real] NULL,
	[Ausgezahlte_Std] [real] NULL,
	[Rest_Std] [real] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [users_email_unique]    Script Date: 12.03.2020 11:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_email_unique] ON [dbo].[users_OLD]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAnforderungen] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblAnsprechpartnerlEvent] ADD  CONSTRAINT [DF_tblAnsprechpartnerlEvent_AP_Nr]  DEFAULT ((0)) FOR [AP_Nr]
GO
ALTER TABLE [dbo].[tblAusw_Büro] ADD  CONSTRAINT [DF_tblAusw_Büro_Aktiv]  DEFAULT ((0)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_tblBauprüfRechnung_Bauwert]  DEFAULT ((0)) FOR [Bauwert]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_tblBauprüfRechnung_BW1]  DEFAULT ((0)) FOR [BW1]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_Table_1_BW11]  DEFAULT ((0)) FOR [BW2]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_Table_1_BW11_1]  DEFAULT ((0)) FOR [BW3]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_Table_1_BW11_2]  DEFAULT ((0)) FOR [BW4]
GO
ALTER TABLE [dbo].[tblBauprüfRechnung] ADD  CONSTRAINT [DF_Table_1_BW11_3]  DEFAULT ((0)) FOR [BW5]
GO
ALTER TABLE [dbo].[tblKommunikationsverlauf] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblMonatsStunden] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblNettoAbTageNeu] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblP_K] ADD  CONSTRAINT [DF_tblP_K_Aktiv]  DEFAULT ((0)) FOR [Aktiv]
GO
ALTER TABLE [dbo].[tblResturlaub] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblStundenKopieOhneDecimal] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblVerbrauchteUrlaubstageKJ] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblVerbrauchteUrlaubstageKJNEU] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblVerbrauchteUrlaubstageKJTest] ADD  DEFAULT ((0)) FOR [PersNr]
GO
ALTER TABLE [dbo].[tblAnsprechpartner]  WITH CHECK ADD  CONSTRAINT [FK_tblAnsprechpartner_tblADRESSEN] FOREIGN KEY([Nummer])
REFERENCES [dbo].[tblADRESSEN] ([Nummer])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAnsprechpartner] CHECK CONSTRAINT [FK_tblAnsprechpartner_tblADRESSEN]
GO
ALTER TABLE [dbo].[tblKommunikationsverlauf]  WITH CHECK ADD  CONSTRAINT [FK_tblKommunikationsverlauf_tblAufträge] FOREIGN KEY([Auftrags_ID])
REFERENCES [dbo].[tblAufträge] ([Auftrags_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblKommunikationsverlauf] CHECK CONSTRAINT [FK_tblKommunikationsverlauf_tblAufträge]
GO
ALTER TABLE [dbo].[tblStundenUF]  WITH CHECK ADD  CONSTRAINT [FK_tblStundenUF_tblStunden] FOREIGN KEY([Std_Id])
REFERENCES [dbo].[tblStunden] ([Std_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStundenUF] CHECK CONSTRAINT [FK_tblStundenUF_tblStunden]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Nummer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Anrede_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Büroart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Titel_Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Vorname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Firma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Suchfeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Abteilung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ortsteil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Postleitzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1575 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Telefon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Web_Seite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Land'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Architekt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Bauherr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Auftraggeber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Aufsteller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Eutin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Ascheberg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN', @level2type=N'COLUMN',@level2name=N'Norderstedt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblADRESSEN].[Ort], [tblADRESSEN].[Straße]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblADRESSEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'lfdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=3 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Idee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=4 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3060 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Menüpunkt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=14115 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Beschreibung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=6 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Fragen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=7 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Schlagwort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=8 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=10 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen', @level2type=N'COLUMN',@level2name=N'MitarbeiterNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowHeight', @value=615 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAnforderungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2010 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'SKP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'SKP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'SKP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Link'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Link'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge', @level2type=N'COLUMN',@level2name=N'Link'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblAufträge].[Büro_Nr]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3870 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Chef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'AdressNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3285 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro', @level2type=N'COLUMN',@level2name=N'Ergänzung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblAusw_Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Art, auf die ein Fornular aufgerufen wird.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHilfe_Form', @level2type=N'COLUMN',@level2name=N'Aufruf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'KoV_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Adressat_Liste'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Eingang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Ausgang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungbezahlt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Rechnungsbetrag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3465 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf', @level2type=N'COLUMN',@level2name=N'Inhalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblKommunikationsverlauf].[Inhalt], [tblKommunikationsverlauf].[Bearbeiter], [tblKommunikationsverlauf].[Datum], [tblKommunikationsverlauf].[Auftrags_ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblKommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'frm_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4170 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Formular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'LetzteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'NächsteMeldung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'AnzeigeDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'AnzeigeDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'AnzeigeDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum', @level2type=N'COLUMN',@level2name=N'Büro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMeldungsDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datum letzte Änderung für AlteÜberStd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMitarbeiter', @level2type=N'COLUMN',@level2name=N'Letzte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMitarbeiter', @level2type=N'COLUMN',@level2name=N'letzteAktualisierung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMitarbeiter', @level2type=N'COLUMN',@level2name=N'letzteAktualisierung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMitarbeiter', @level2type=N'COLUMN',@level2name=N'letzteAktualisierung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In diesem Feld nur für Geschäftsführer Datum letzte Riinnerung eintragen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMitarbeiter', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'KmGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMonatsStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblNettoAbTage', @level2type=N'COLUMN',@level2name=N'lfdnr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblNettoAbTage', @level2type=N'COLUMN',@level2name=N'lfdnr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblNettoAbTage', @level2type=N'COLUMN',@level2name=N'lfdnr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub', @level2type=N'COLUMN',@level2name=N'RestNeu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblResturlaub].[Kürzel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblResturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Dat_Kuerz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Von'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pause'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Std_gesamt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Vonalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Bisalt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Pausealt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden', @level2type=N'COLUMN',@level2name=N'Schlüssel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=1000000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'UStd_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Tkurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Km'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF', @level2type=N'COLUMN',@level2name=N'Bemerkungen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblStundenUF].[Tkurz], [tblStundenUF].[Auftrags_ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=500000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblStundenUF'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Kürz_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'LetztesDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'VonDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'BisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'ÜberStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Ausgezahlte_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden', @level2type=N'COLUMN',@level2name=N'Rest_Std'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=N'([tblUT_Überstunden].[Kürzel]="Bo")' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblUT_Überstunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2010 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'VerbrauchteTage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'bisDatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ', @level2type=N'COLUMN',@level2name=N'Kalenderjahr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblVerbrauchteUrlaubstageKJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2295 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Fixed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Fixed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Kürzel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Nachname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Fixed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeStd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Fixed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA', @level2type=N'COLUMN',@level2name=N'SummeKMGeld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tmpMonatStundenExcelMA].[Kürzel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpMonatStundenExcelMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpStundenauswahlExcel_1', @level2type=N'COLUMN',@level2name=N'Std_Satz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,##0.00 €;-#,##0.00 €' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpStundenauswahlExcel_1', @level2type=N'COLUMN',@level2name=N'Std_Satz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpStundenauswahlExcel_1', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'#,##0.00 €;-#,##0.00 €' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tmpStundenauswahlExcel_1', @level2type=N'COLUMN',@level2name=N'Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'z20131209Resturlaub'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Adressen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_ANSPRECHPARTNER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Büro_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Nr_Alt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'P_K'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Straße'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftragg_AP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aktenzeichen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauherr_KdNr_Neu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Architekt_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Aufsteller_KdNr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=4485 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_kurz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3075 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bezeichnung_lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauartkennzahl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Bauwerkskl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Gebaeudeart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Anr_Kosten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Nach_Zeitaufwand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Auftrags_Datum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Termin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Enddatum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schallschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Wärmeschutz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'FWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Konstr_Überwachung'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Realisiert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Sachbearbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_CurrencyLCID', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge', @level2type=N'COLUMN',@level2name=N'Schlußbericht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AlternateBackThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetForeThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DatasheetGridlinesThemeColorIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=100000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ThemeFontIndex', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Aufträge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Kommunikationsverlauf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Mitarbeiter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_Stunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_UF_Stunden'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zAlt_UT_Überstunden'
GO
USE [master]
GO
ALTER DATABASE [kskVue] SET  READ_WRITE 
GO
