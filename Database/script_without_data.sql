USE [master]
GO
/****** Object:  Database [Project]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  Table [dbo].[TblProject]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  Table [dbo].[TblTask]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[LastWeekTasks_Sel]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[Project_Ins]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[Project_Sel]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[Task_Ins]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[Task_Upd]    Script Date: 6/2/2021 4:48:32 pm ******/
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
/****** Object:  StoredProcedure [dbo].[WeeklyProjectSummary_Sel]    Script Date: 6/2/2021 4:48:32 pm ******/
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
