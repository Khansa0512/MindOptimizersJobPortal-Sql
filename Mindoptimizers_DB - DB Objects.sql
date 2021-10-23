/****** Object:  Database [MindOptimizers_DB]    Script Date: 23-10-2021 16:32:12 ******/
CREATE DATABASE [MindOptimizers_DB]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [MindOptimizers_DB] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [MindOptimizers_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MindOptimizers_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MindOptimizers_DB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [MindOptimizers_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MindOptimizers_DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MindOptimizers_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MindOptimizers_DB] SET ENCRYPTION ON
GO
ALTER DATABASE [MindOptimizers_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MindOptimizers_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  User [VGorantla]    Script Date: 23-10-2021 16:32:13 ******/
CREATE USER [VGorantla] FOR LOGIN [VGorantla] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TVashist]    Script Date: 23-10-2021 16:32:13 ******/
CREATE USER [TVashist] FOR LOGIN [TVashist] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [KIqbal]    Script Date: 23-10-2021 16:32:13 ******/
CREATE USER [KIqbal] FOR LOGIN [KIqbal] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [HBansal]    Script Date: 23-10-2021 16:32:13 ******/
CREATE USER [HBansal] FOR LOGIN [HBansal] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'VGorantla'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'TVashist'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'KIqbal'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'HBansal'
GO
/****** Object:  Table [dbo].[CandidateProfile]    Script Date: 23-10-2021 16:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateProfile](
	[CP_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CR_ID] [smallint] NOT NULL,
	[CR_Skill] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CandidateProfile_CP_id] PRIMARY KEY CLUSTERED 
(
	[CP_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateResume]    Script Date: 23-10-2021 16:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateResume](
	[CR_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CR_Name] [nvarchar](200) NOT NULL,
	[JD_ID] [smallint] NOT NULL,
	[JP_CP_Match_Score] [smallint] NULL,
	[Feedback_Round1] [nvarchar](500) NULL,
	[Feedback_Round2] [nvarchar](500) NULL,
	[Feedback_Round3] [nvarchar](500) NULL,
	[Hiring_Status] [nvarchar](500) NULL,
 CONSTRAINT [PK_CandidateResume_CR_id] PRIMARY KEY CLUSTERED 
(
	[CR_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobDesciption]    Script Date: 23-10-2021 16:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobDesciption](
	[JD_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[JD_Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_JobDesciption_JD_id] PRIMARY KEY CLUSTERED 
(
	[JD_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobProfile]    Script Date: 23-10-2021 16:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobProfile](
	[JP_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[JD_ID] [smallint] NOT NULL,
	[JD_Skill] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_JobProfile_JP_id] PRIMARY KEY CLUSTERED 
(
	[JP_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill_Master]    Script Date: 23-10-2021 16:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill_Master](
	[Skill_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Skill_Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_skill_master_skill_id] PRIMARY KEY CLUSTERED 
(
	[Skill_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidateProfile]  WITH CHECK ADD  CONSTRAINT [FK_CandidateResume_CR_ID] FOREIGN KEY([CR_ID])
REFERENCES [dbo].[CandidateResume] ([CR_ID])
GO
ALTER TABLE [dbo].[CandidateProfile] CHECK CONSTRAINT [FK_CandidateResume_CR_ID]
GO
ALTER TABLE [dbo].[JobProfile]  WITH CHECK ADD  CONSTRAINT [FK_JobDesciption_JD_ID] FOREIGN KEY([JD_ID])
REFERENCES [dbo].[JobDesciption] ([JD_ID])
GO
ALTER TABLE [dbo].[JobProfile] CHECK CONSTRAINT [FK_JobDesciption_JD_ID]
GO
ALTER DATABASE [MindOptimizers_DB] SET  READ_WRITE 
GO
