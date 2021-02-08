USE [master]
GO
/****** Object:  Database [Project]    Script Date: 6/2/2021 4:46:42 pm ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[TblProject]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProject](
	[ProjectID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTask]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTask](
	[TaskID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[ProjectFK] [uniqueidentifier] NOT NULL,
	[Client] [varchar](50) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'941db3cb-eca1-4c68-8405-16672181568f', N'Project1', CAST(N'2021-02-04T22:26:44.977' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'e0f8e37b-2003-455e-9e85-3c8fb36d9bf7', N'Project2', CAST(N'2021-02-04T22:26:44.977' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'new proj', CAST(N'2021-02-06T01:59:27.487' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'f1d0a0ea-749e-49eb-ba20-95af0923be3c', N'abcd', CAST(N'2021-02-06T01:59:42.017' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'858b5038-94ab-4887-9dde-5a82887b0d88', N'new proj', CAST(N'2021-02-06T02:01:26.077' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'145d2011-780d-48de-b29f-6855a1ce3a3d', N'yoshi', CAST(N'2021-02-06T11:04:00.903' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'a183c47e-10a7-43ce-82c5-7b8e140d5992', N'np', CAST(N'2021-02-06T14:48:44.437' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'2306f3f9-ddb5-4d37-9deb-6bd9dd6fc192', N'abcde', CAST(N'2021-02-06T14:51:32.573' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'59265098-2c1e-419f-b0cf-fc6d691676e9', N'ha', CAST(N'2021-02-06T15:10:46.010' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'113bf292-2d8f-47a9-90d8-2f28e661cb13', N'test', CAST(N'2021-02-06T14:54:11.607' AS DateTime))
GO
INSERT [dbo].[TblProject] ([ProjectID], [Name], [CreateDate]) VALUES (N'c86066bb-447c-48a8-99ea-286a1f531871', N'tiara', CAST(N'2021-02-06T16:14:08.000' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'1141820b-6959-4ff9-9e76-0947e6161d47', N'Task1', N'An example task', N'e0f8e37b-2003-455e-9e85-3c8fb36d9bf7', N'company A', CAST(N'2021-02-03T08:00:00.000' AS DateTime), CAST(N'2021-02-03T10:00:00.000' AS DateTime), CAST(N'2021-02-04T22:31:47.227' AS DateTime), CAST(N'2021-02-04T22:31:47.227' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'a3f21d40-4e93-415e-8e83-c386122bc1ef', N'Task2', N'An example task', N'941db3cb-eca1-4c68-8405-16672181568f', N'company A', CAST(N'2021-02-03T11:00:00.000' AS DateTime), CAST(N'2021-02-03T12:00:00.000' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'e800ddc4-0e27-4028-9dfa-f1b710eefba9', N'Task3', N'An example task', N'941db3cb-eca1-4c68-8405-16672181568f', N'company A', CAST(N'2021-02-03T14:00:00.000' AS DateTime), CAST(N'2021-02-03T16:00:00.000' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'6e6d3208-5989-44a1-b229-5823ac98e879', N'Task4', N'An example task', N'941db3cb-eca1-4c68-8405-16672181568f', N'company A', CAST(N'2021-02-06T01:28:00.000' AS DateTime), CAST(N'2021-02-06T01:28:00.000' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime), CAST(N'2021-02-04T22:31:47.230' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'724be6b9-ef74-447c-bf44-e63516d91492', N'n', N'd', N'e0f8e37b-2003-455e-9e85-3c8fb36d9bf7', N'c', CAST(N'2021-02-05T12:10:00.000' AS DateTime), CAST(N'2021-02-05T14:10:00.000' AS DateTime), CAST(N'2021-02-05T00:10:02.553' AS DateTime), CAST(N'2021-02-05T00:10:02.553' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'549d0fee-7345-4ffd-8081-dfea5fb7dbce', N'n', N'd', N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'c', CAST(N'2021-02-05T09:12:00.000' AS DateTime), CAST(N'2021-02-05T11:12:00.000' AS DateTime), CAST(N'2021-02-05T09:12:51.187' AS DateTime), CAST(N'2021-02-05T09:12:51.187' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'd2c7f798-2dbf-4711-bc0f-b47c11e6e3f3', N'efsr', N'frxgtdsaewgtftre', N'e0f8e37b-2003-455e-9e85-3c8fb36d9bf7', N'wre', CAST(N'2021-02-06T00:11:00.000' AS DateTime), CAST(N'2021-02-06T00:11:00.000' AS DateTime), CAST(N'2021-02-06T00:12:04.677' AS DateTime), CAST(N'2021-02-06T00:12:04.677' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'037e0c44-bdae-4c99-a6aa-40129932d295', N'abc', N'dsdzs', N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'sdf', CAST(N'2021-02-19T00:39:00.000' AS DateTime), CAST(N'2021-02-19T01:39:00.000' AS DateTime), CAST(N'2021-02-06T01:39:08.137' AS DateTime), CAST(N'2021-02-06T01:39:08.137' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'3337d80c-fb95-4106-9239-7851d038d33c', N'abc', N'dsdzs', N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'sdf', CAST(N'2021-02-06T11:39:00.000' AS DateTime), CAST(N'2021-02-06T13:39:00.000' AS DateTime), CAST(N'2021-02-06T01:39:12.057' AS DateTime), CAST(N'2021-02-06T01:39:12.057' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'f8c9dcbe-da7c-4f98-8e73-eab6f00f409f', N'rgfe', N'aeswxerfd', N'f1d0a0ea-749e-49eb-ba20-95af0923be3c', N'efds', CAST(N'2021-02-06T06:40:00.000' AS DateTime), CAST(N'2021-02-06T09:40:00.000' AS DateTime), CAST(N'2021-02-06T01:40:48.717' AS DateTime), CAST(N'2021-02-06T01:40:48.717' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'fc11dceb-b055-482b-b90d-28598f06e2e4', N'nt', N'abc', N'2306f3f9-ddb5-4d37-9deb-6bd9dd6fc192', N'a', CAST(N'2021-02-06T14:43:00.000' AS DateTime), CAST(N'2021-02-06T16:43:00.000' AS DateTime), CAST(N'2021-02-06T14:47:16.673' AS DateTime), CAST(N'2021-02-06T14:47:16.673' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'9b0a8102-14f5-426f-ba65-b955cd84d1f0', N'abcd', N'rsefd', N'a183c47e-10a7-43ce-82c5-7b8e140d5992', N'sdz', CAST(N'2021-02-06T14:48:00.000' AS DateTime), CAST(N'2021-02-06T15:48:00.000' AS DateTime), CAST(N'2021-02-06T14:49:02.260' AS DateTime), CAST(N'2021-02-06T14:49:02.260' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'16a142a1-6014-4586-b533-44136e605133', N'taskk', N'sds', N'59265098-2c1e-419f-b0cf-fc6d691676e9', N's', CAST(N'2021-02-06T15:10:00.000' AS DateTime), CAST(N'2021-02-06T15:31:00.000' AS DateTime), CAST(N'2021-02-06T15:11:27.723' AS DateTime), CAST(N'2021-02-06T15:11:27.723' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'ca0e8b0e-0912-4c56-aeaf-714e67fd5128', N'retdgrerw', N'ewrdtgew3gewre', N'145d2011-780d-48de-b29f-6855a1ce3a3d', N'esrd', CAST(N'2021-02-06T00:12:00.000' AS DateTime), CAST(N'2021-02-06T00:12:00.000' AS DateTime), CAST(N'2021-02-06T00:12:35.093' AS DateTime), CAST(N'2021-02-06T00:12:35.093' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'e5b4a332-7970-4df6-a7f1-56e0bce22c55', N'zako', N'kusozako', N'941db3cb-eca1-4c68-8405-16672181568f', N'zakosen', CAST(N'2021-02-13T09:13:00.000' AS DateTime), CAST(N'2021-02-13T00:13:00.000' AS DateTime), CAST(N'2021-02-06T00:13:38.573' AS DateTime), CAST(N'2021-02-06T00:13:38.573' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'fa16856b-0d6f-43a6-98dc-434ea0745b93', N'this one', N'abcc', N'f1d0a0ea-749e-49eb-ba20-95af0923be3c', N'a', CAST(N'2021-03-23T11:13:00.000' AS DateTime), CAST(N'2021-03-23T00:13:00.000' AS DateTime), CAST(N'2021-02-06T11:13:59.870' AS DateTime), CAST(N'2021-02-06T11:13:59.870' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'ba1111d5-f4f4-4d08-bc56-101ab3dfad2f', N'kjhmn', N'abcdsa aesdgr wers', N'e0f8e37b-2003-455e-9e85-3c8fb36d9bf7', N'awgswar', CAST(N'2021-02-06T11:20:00.000' AS DateTime), CAST(N'2021-02-06T11:20:00.000' AS DateTime), CAST(N'2021-02-06T11:20:46.640' AS DateTime), CAST(N'2021-02-06T11:20:46.640' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'e2ff4c85-d179-4ca4-b75d-873d95252e53', N'me', N'abcdsa aesdgr wers', N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'awgswar', CAST(N'2021-02-06T11:23:00.000' AS DateTime), CAST(N'2021-02-06T13:23:00.000' AS DateTime), CAST(N'2021-02-06T11:23:22.290' AS DateTime), CAST(N'2021-02-06T11:23:22.290' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'04d989e1-7c34-4937-ae2a-9b37c00d6604', N'new task', N'abc', N'145d2011-780d-48de-b29f-6855a1ce3a3d', N'hjb', CAST(N'2021-02-06T12:10:00.000' AS DateTime), CAST(N'2021-02-06T14:10:00.000' AS DateTime), CAST(N'2021-02-06T12:10:29.827' AS DateTime), CAST(N'2021-02-06T12:10:29.827' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'1849f2c6-a23a-4102-91d0-2b5cfae64133', N'again', N'esrftr', N'79c0969a-421d-4fc2-8886-cbcc8d95a876', N'a', CAST(N'2021-02-06T12:11:00.000' AS DateTime), CAST(N'2021-02-06T14:11:00.000' AS DateTime), CAST(N'2021-02-06T12:11:57.323' AS DateTime), CAST(N'2021-02-06T12:11:57.323' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'50cb6798-dc04-442c-bb1c-caac28d0608f', N'', N'', N'941db3cb-eca1-4c68-8405-16672181568f', N'', CAST(N'2021-01-04T14:29:00.000' AS DateTime), CAST(N'2021-01-04T14:29:00.000' AS DateTime), CAST(N'2021-02-06T14:30:00.253' AS DateTime), CAST(N'2021-02-06T14:30:00.253' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'652ddae3-47fb-4ee6-a59f-85c7245e19d4', N'abc', N'serds]f', N'59265098-2c1e-419f-b0cf-fc6d691676e9', N'a', CAST(N'2021-02-06T14:30:00.000' AS DateTime), CAST(N'2021-02-06T14:30:00.000' AS DateTime), CAST(N'2021-02-06T14:30:34.817' AS DateTime), CAST(N'2021-02-06T14:30:34.817' AS DateTime))
GO
INSERT [dbo].[TblTask] ([TaskID], [Name], [Description], [ProjectFK], [Client], [StartTime], [EndTime], [CreateDate], [UpdateDate]) VALUES (N'26acccf9-b5a6-491f-9e79-3727982f20e0', N'tiara2', N'abc', N'c86066bb-447c-48a8-99ea-286a1f531871', N'a', CAST(N'2021-02-06T16:11:00.000' AS DateTime), CAST(N'2021-02-06T17:11:00.000' AS DateTime), CAST(N'2021-02-06T16:14:23.733' AS DateTime), CAST(N'2021-02-06T16:14:23.733' AS DateTime))
GO
/****** Object:  StoredProcedure [dbo].[LastWeekTasks_Sel]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LastWeekTasks_Sel]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ProjectID, TaskID, t.Name, Description, p.Name as Project, Client, StartTime,EndTime
	from dbo.TblTask as t
	inner join dbo.TblProject as p on ProjectFK = ProjectID
	where StartTime between dateadd(day, -6, convert(date, getdate())) and dateadd(day, 1, convert(date, getdate()))
	order by StartTime desc
END

GO
/****** Object:  StoredProcedure [dbo].[Project_Ins]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Project_Ins]
	-- Add the parameters for the stored procedure here
	@name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into dbo.TblProject values (newid(), @name, getdate())
END

GO
/****** Object:  StoredProcedure [dbo].[Project_Sel]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[Project_Sel]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from dbo.TblProject

	END
GO
/****** Object:  StoredProcedure [dbo].[Task_Ins]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Task_Ins]
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@description varchar(500),
	@project uniqueidentifier,
	@client varchar(50),
	@start datetime,
	@end datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into dbo.TblTask values(newid(), @name, @description, @project, @client, @start, @end, getdate(), getdate())
END
GO
/****** Object:  StoredProcedure [dbo].[Task_Upd]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Task_Upd]
	-- Add the parameters for the stored procedure here
	@taskID uniqueidentifier,
	@name varchar(50),
	@description varchar(500),
	@project uniqueidentifier,
	@client varchar(50),
	@start datetime,
	@end datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update dbo.TblTask set Name = @name, Description = @description, ProjectFK = @project, Client = @client, StartTime = @start, EndTime = @end
	where TaskID = @taskID

	END
GO
/****** Object:  StoredProcedure [dbo].[WeeklyProjectSummary_Sel]    Script Date: 6/2/2021 4:46:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[WeeklyProjectSummary_Sel]
	-- Add the parameters for the stored procedure here
	@day date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @dw int = datepart(dw, @day)
	if @dw = 1 begin set @dw = 8 end
	declare @startday datetime = dateadd(day, 2 - @dw, @day)
	declare @endday datetime = dateadd(day, 8 - @dw, @day)

	declare @res table (ProjectFK uniqueidentifier, ProjectName varchar(50), Mon int, Tue int, Wed int, Thu int, Fri int, Sat int, Sun int)
	insert into @res
	select ProjectID, Name, 0, 0, 0, 0, 0, 0, 0 from dbo.TblProject

	declare cur cursor fast_forward for
	select StartTime, EndTime, ProjectFK
	from dbo.TblTask
	where StartTime between @startday and dateadd(day, 1, @endday)

	declare @Start datetime
	declare @End datetime
	declare @Project uniqueidentifier
	open cur
	fetch next from cur into @Start, @End, @Project
	while @@fetch_status = 0
	begin
		declare @dayweek int = datepart(dw, @Start)
		declare @length int = datediff(minute, @Start, @End)
		if @dayweek = 2 begin update @res set Mon = Mon + @length where ProjectFK = @Project end
		if @dayweek = 3 begin update @res set Tue = Tue + @length where ProjectFK = @Project end
		if @dayweek = 4 begin update @res set Wed = Wed + @length where ProjectFK = @Project end
		if @dayweek = 5 begin update @res set Thu = Thu + @length where ProjectFK = @Project end
		if @dayweek = 6 begin update @res set Fri = Fri + @length where ProjectFK = @Project end
		if @dayweek = 7 begin update @res set Sat = Sat + @length where ProjectFK = @Project end
		if @dayweek = 1 begin update @res set Sun = Sun + @length where ProjectFK = @Project end
		fetch next from cur into @Start, @End, @Project
	end
	close cur
	deallocate cur

	select * from @res
END

GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
