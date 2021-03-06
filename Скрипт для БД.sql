USE [master]
GO
/****** Object:  Database [Учет и паспортизация данных]    Script Date: 25.04.2022 13:05:08 ******/
CREATE DATABASE [Учет и паспортизация данных]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Учет и паспортизация данных', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Учет и паспортизация данных.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Учет и паспортизация данных_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Учет и паспортизация данных_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Учет и паспортизация данных] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Учет и паспортизация данных].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Учет и паспортизация данных] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ARITHABORT OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Учет и паспортизация данных] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Учет и паспортизация данных] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Учет и паспортизация данных] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Учет и паспортизация данных] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Учет и паспортизация данных] SET  MULTI_USER 
GO
ALTER DATABASE [Учет и паспортизация данных] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Учет и паспортизация данных] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Учет и паспортизация данных] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Учет и паспортизация данных] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Учет и паспортизация данных] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Учет и паспортизация данных] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Учет и паспортизация данных] SET QUERY_STORE = OFF
GO
USE [Учет и паспортизация данных]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[код_заявки] [int] NOT NULL,
	[код_клиента] [int] NOT NULL,
	[код_офиса] [int] NOT NULL,
	[код_подключения] [int] NOT NULL,
	[описание_заявки] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Заявка] PRIMARY KEY CLUSTERED 
(
	[код_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[код_клиента] [int] NOT NULL,
	[фио] [nvarchar](50) NOT NULL,
	[роль] [int] NOT NULL,
	[оборудование] [int] NOT NULL,
	[дата_рождения] [date] NOT NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[код_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оборудование]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оборудование](
	[код_оборудования] [int] NOT NULL,
	[название] [nvarchar](50) NOT NULL,
	[тип_оборудования] [int] NOT NULL,
	[серийный_номер] [nvarchar](50) NOT NULL,
	[инвентарный_номер_ОС] [nvarchar](50) NOT NULL,
	[IP_адрес] [nvarchar](50) NOT NULL,
	[MAC_адреса] [nvarchar](50) NOT NULL,
	[тип_порта] [int] NOT NULL,
	[примечания] [nvarchar](200) NULL,
 CONSTRAINT [PK_Оборудование] PRIMARY KEY CLUSTERED 
(
	[код_оборудования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Офис]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Офис](
	[код_офиса] [int] NOT NULL,
	[местоположение] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Офис] PRIMARY KEY CLUSTERED 
(
	[код_офиса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подключенные\свободные порты]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подключенные\свободные порты](
	[код] [int] NOT NULL,
	[код_оборудования] [int] NOT NULL,
	[количество_портов] [nvarchar](50) NOT NULL,
	[подключенные_порты] [nvarchar](50) NOT NULL,
	[свободные_порты] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Подключенные\свободные порты] PRIMARY KEY CLUSTERED 
(
	[код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роль]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роль](
	[код_роли] [int] NOT NULL,
	[Название_роли] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Роль] PRIMARY KEY CLUSTERED 
(
	[код_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[код_сотрудника] [int] NOT NULL,
	[логин] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[фио] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[номер_офиса] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[код_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип оборудования]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип оборудования](
	[Код] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тип оборудования] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип порта]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип порта](
	[код] [int] NOT NULL,
	[название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тип порта] PRIMARY KEY CLUSTERED 
(
	[код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Точка]    Script Date: 25.04.2022 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Точка](
	[код] [int] NOT NULL,
	[местоположение_подключения] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Точка] PRIMARY KEY CLUSTERED 
(
	[код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Клиент] FOREIGN KEY([код_клиента])
REFERENCES [dbo].[Клиент] ([код_клиента])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Клиент]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Офис] FOREIGN KEY([код_офиса])
REFERENCES [dbo].[Офис] ([код_офиса])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Офис]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK_Заявка_Точка] FOREIGN KEY([код_подключения])
REFERENCES [dbo].[Точка] ([код])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK_Заявка_Точка]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Оборудование] FOREIGN KEY([оборудование])
REFERENCES [dbo].[Оборудование] ([код_оборудования])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Оборудование]
GO
ALTER TABLE [dbo].[Клиент]  WITH CHECK ADD  CONSTRAINT [FK_Клиент_Роль] FOREIGN KEY([роль])
REFERENCES [dbo].[Роль] ([код_роли])
GO
ALTER TABLE [dbo].[Клиент] CHECK CONSTRAINT [FK_Клиент_Роль]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_Тип оборудования] FOREIGN KEY([тип_оборудования])
REFERENCES [dbo].[Тип оборудования] ([Код])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_Тип оборудования]
GO
ALTER TABLE [dbo].[Оборудование]  WITH CHECK ADD  CONSTRAINT [FK_Оборудование_Тип порта] FOREIGN KEY([тип_порта])
REFERENCES [dbo].[Тип порта] ([код])
GO
ALTER TABLE [dbo].[Оборудование] CHECK CONSTRAINT [FK_Оборудование_Тип порта]
GO
ALTER TABLE [dbo].[Подключенные\свободные порты]  WITH CHECK ADD  CONSTRAINT [FK_Подключенные\свободные порты_Оборудование] FOREIGN KEY([код_оборудования])
REFERENCES [dbo].[Оборудование] ([код_оборудования])
GO
ALTER TABLE [dbo].[Подключенные\свободные порты] CHECK CONSTRAINT [FK_Подключенные\свободные порты_Оборудование]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Офис] FOREIGN KEY([номер_офиса])
REFERENCES [dbo].[Офис] ([код_офиса])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Офис]
GO
USE [master]
GO
ALTER DATABASE [Учет и паспортизация данных] SET  READ_WRITE 
GO
