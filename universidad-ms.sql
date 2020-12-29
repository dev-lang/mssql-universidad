USE [master]
GO
/****** Object:  Database [Universidad]    Script Date: 28/12/2020 23:50:11 ******/
CREATE DATABASE [Universidad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universidad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Universidad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Universidad_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Universidad] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universidad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universidad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universidad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universidad] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universidad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universidad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universidad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universidad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universidad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universidad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universidad] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Universidad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universidad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universidad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universidad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universidad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universidad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universidad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universidad] SET RECOVERY FULL 
GO
ALTER DATABASE [Universidad] SET  MULTI_USER 
GO
ALTER DATABASE [Universidad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universidad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universidad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universidad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Universidad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Universidad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universidad', N'ON'
GO
ALTER DATABASE [Universidad] SET QUERY_STORE = OFF
GO
USE [Universidad]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[IdentidadAlumno] [varchar](20) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Genero] [varchar](12) NULL,
	[EstadoCivil] [varchar](20) NULL,
	[Fecha_Nacimiento] [varchar](15) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [text] NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[IdentidadAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[IdAsignatura] [int] IDENTITY(1,1) NOT NULL,
	[CodAsignatura] [varchar](12) NOT NULL,
	[NombreAsignatura] [varchar](50) NULL,
	[Unidades] [int] NULL,
	[CodCarrera] [varchar](15) NULL,
 CONSTRAINT [PK_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[CodAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[idCarreras] [int] IDENTITY(1,1) NOT NULL,
	[CodCarrera] [varchar](15) NOT NULL,
	[NombreCarrera] [varchar](100) NULL,
 CONSTRAINT [PK_Carreras] PRIMARY KEY CLUSTERED 
(
	[CodCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatriculaAlumnos]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatriculaAlumnos](
	[IdMatricula] [int] IDENTITY(1,1) NOT NULL,
	[IdPeriodoAcademico] [int] NULL,
	[CodCarrera] [varchar](15) NULL,
	[IdentidadAlumno] [varchar](20) NULL,
	[Fecha_Matricula] [date] NULL,
 CONSTRAINT [PK_MatriculaAlumnos] PRIMARY KEY CLUSTERED 
(
	[IdMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[IdNota] [int] IDENTITY(1,1) NOT NULL,
	[IdMatricula] [int] NOT NULL,
	[CodAsignatura] [varchar](12) NOT NULL,
	[Nota] [numeric](3, 1) NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[IdNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodosAcademicos]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodosAcademicos](
	[IdPeriodoAcademico] [int] IDENTITY(1,1) NOT NULL,
	[NombreP] [varchar](20) NULL,
	[FechaInicio] [date] NULL,
	[FechaFinal] [date] NULL,
 CONSTRAINT [PK_PeriodosAcademicos] PRIMARY KEY CLUSTERED 
(
	[IdPeriodoAcademico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[IdProfesor] [int] IDENTITY(1,1) NOT NULL,
	[IdentidadProfesor] [varchar](20) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Varchar] [varchar](50) NULL,
	[Genero] [varchar](12) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
	[EstadoCivil] [varchar](20) NULL,
	[Profesion] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Fecha_Ingreso] [date] NULL,
 CONSTRAINT [PK_Profesores] PRIMARY KEY CLUSTERED 
(
	[IdentidadProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores_Asignaturas]    Script Date: 28/12/2020 23:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores_Asignaturas](
	[IdProfesorAsignatura] [int] IDENTITY(1,1) NOT NULL,
	[IdentidadProfesor] [varchar](20) NULL,
	[CodAsignatura] [varchar](12) NULL,
	[IdPeriodoAcademico] [int] NULL,
 CONSTRAINT [PK_Profesores_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[IdProfesorAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Asignaturas_Carreras] FOREIGN KEY([CodCarrera])
REFERENCES [dbo].[Carreras] ([CodCarrera])
GO
ALTER TABLE [dbo].[Asignaturas] CHECK CONSTRAINT [FK_Asignaturas_Carreras]
GO
ALTER TABLE [dbo].[MatriculaAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAlumnos_Alumnos] FOREIGN KEY([IdentidadAlumno])
REFERENCES [dbo].[Alumnos] ([IdentidadAlumno])
GO
ALTER TABLE [dbo].[MatriculaAlumnos] CHECK CONSTRAINT [FK_MatriculaAlumnos_Alumnos]
GO
ALTER TABLE [dbo].[MatriculaAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAlumnos_Carreras] FOREIGN KEY([CodCarrera])
REFERENCES [dbo].[Carreras] ([CodCarrera])
GO
ALTER TABLE [dbo].[MatriculaAlumnos] CHECK CONSTRAINT [FK_MatriculaAlumnos_Carreras]
GO
ALTER TABLE [dbo].[MatriculaAlumnos]  WITH CHECK ADD  CONSTRAINT [FK_MatriculaAlumnos_PeriodosAcademicos] FOREIGN KEY([IdPeriodoAcademico])
REFERENCES [dbo].[PeriodosAcademicos] ([IdPeriodoAcademico])
GO
ALTER TABLE [dbo].[MatriculaAlumnos] CHECK CONSTRAINT [FK_MatriculaAlumnos_PeriodosAcademicos]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Asignaturas] FOREIGN KEY([CodAsignatura])
REFERENCES [dbo].[Asignaturas] ([CodAsignatura])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_Asignaturas]
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD  CONSTRAINT [FK_Notas_MatriculaAlumnos] FOREIGN KEY([IdMatricula])
REFERENCES [dbo].[MatriculaAlumnos] ([IdMatricula])
GO
ALTER TABLE [dbo].[Notas] CHECK CONSTRAINT [FK_Notas_MatriculaAlumnos]
GO
ALTER TABLE [dbo].[Profesores_Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Profesores_Asignaturas_Asignaturas] FOREIGN KEY([CodAsignatura])
REFERENCES [dbo].[Asignaturas] ([CodAsignatura])
GO
ALTER TABLE [dbo].[Profesores_Asignaturas] CHECK CONSTRAINT [FK_Profesores_Asignaturas_Asignaturas]
GO
ALTER TABLE [dbo].[Profesores_Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Profesores_Asignaturas_PeriodosAcademicos] FOREIGN KEY([IdPeriodoAcademico])
REFERENCES [dbo].[PeriodosAcademicos] ([IdPeriodoAcademico])
GO
ALTER TABLE [dbo].[Profesores_Asignaturas] CHECK CONSTRAINT [FK_Profesores_Asignaturas_PeriodosAcademicos]
GO
ALTER TABLE [dbo].[Profesores_Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Profesores_Asignaturas_Profesores] FOREIGN KEY([IdentidadProfesor])
REFERENCES [dbo].[Profesores] ([IdentidadProfesor])
GO
ALTER TABLE [dbo].[Profesores_Asignaturas] CHECK CONSTRAINT [FK_Profesores_Asignaturas_Profesores]
GO
USE [master]
GO
ALTER DATABASE [Universidad] SET  READ_WRITE 
GO
