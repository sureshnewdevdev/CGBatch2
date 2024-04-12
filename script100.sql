USE [master]
GO
/****** Object:  Database [newdb81]    Script Date: 15-02-2024 17:38:58 ******/
CREATE DATABASE [newdb81]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'newdb81', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\newdb81.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'log2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\log2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB ), 
( NAME = N'newdb81_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\newdb81_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [newdb81] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [newdb81].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [newdb81] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [newdb81] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [newdb81] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [newdb81] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [newdb81] SET ARITHABORT OFF 
GO
ALTER DATABASE [newdb81] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [newdb81] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [newdb81] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [newdb81] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [newdb81] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [newdb81] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [newdb81] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [newdb81] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [newdb81] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [newdb81] SET  DISABLE_BROKER 
GO
ALTER DATABASE [newdb81] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [newdb81] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [newdb81] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [newdb81] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [newdb81] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [newdb81] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [newdb81] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [newdb81] SET RECOVERY FULL 
GO
ALTER DATABASE [newdb81] SET  MULTI_USER 
GO
ALTER DATABASE [newdb81] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [newdb81] SET DB_CHAINING OFF 
GO
ALTER DATABASE [newdb81] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [newdb81] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [newdb81] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [newdb81] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'newdb81', N'ON'
GO
ALTER DATABASE [newdb81] SET QUERY_STORE = ON
GO
ALTER DATABASE [newdb81] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [newdb81]
GO
/****** Object:  Table [dbo].[Dept]    Script Date: 15-02-2024 17:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dept](
	[deptid] [int] NOT NULL,
	[deptname] [varchar](250) NULL,
 CONSTRAINT [PK_Dept] PRIMARY KEY CLUSTERED 
(
	[deptid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 15-02-2024 17:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[empno] [int] NOT NULL,
	[empname] [varchar](50) NULL,
	[salary] [decimal](18, 2) NULL,
	[deptid] [int] NOT NULL,
 CONSTRAINT [PK_emp] PRIMARY KEY CLUSTERED 
(
	[empno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Dept] ([deptid], [deptname]) VALUES (1, N'Dep1')
INSERT [dbo].[Dept] ([deptid], [deptname]) VALUES (2, N'Dep2')
INSERT [dbo].[Dept] ([deptid], [deptname]) VALUES (3, N'Dep3')
INSERT [dbo].[Dept] ([deptid], [deptname]) VALUES (4, N'Dep4')
GO
INSERT [dbo].[emp] ([empno], [empname], [salary], [deptid]) VALUES (1, N'Arun', CAST(100000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[emp] ([empno], [empname], [salary], [deptid]) VALUES (2, N'Raja', CAST(200000.00 AS Decimal(18, 2)), 2)
GO
ALTER TABLE [dbo].[emp]  WITH CHECK ADD  CONSTRAINT [FK_emp_Dept] FOREIGN KEY([deptid])
REFERENCES [dbo].[Dept] ([deptid])
GO
ALTER TABLE [dbo].[emp] CHECK CONSTRAINT [FK_emp_Dept]
GO
USE [master]
GO
ALTER DATABASE [newdb81] SET  READ_WRITE 
GO
