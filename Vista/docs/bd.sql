USE [master]
GO
/****** Object:  Database [rvs]    Script Date: 10/12/2020 6:47:36 p. m. ******/
CREATE DATABASE [rvs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rvs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rvs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rvs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\rvs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [rvs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rvs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rvs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rvs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rvs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rvs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rvs] SET ARITHABORT OFF 
GO
ALTER DATABASE [rvs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rvs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rvs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rvs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rvs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rvs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rvs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rvs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rvs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rvs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rvs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rvs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rvs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rvs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rvs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rvs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rvs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rvs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rvs] SET  MULTI_USER 
GO
ALTER DATABASE [rvs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rvs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rvs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rvs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rvs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rvs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [rvs] SET QUERY_STORE = OFF
GO
USE [rvs]
GO
/****** Object:  Table [dbo].[recomendacion]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recomendacion](
	[id_recomendacion] [int] IDENTITY(1,1) NOT NULL,
	[recomendacion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_recomendacion] PRIMARY KEY CLUSTERED 
(
	[id_recomendacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sintoma]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sintoma](
	[id_sintoma] [int] IDENTITY(1,1) NOT NULL,
	[sintoma] [varchar](500) NOT NULL,
 CONSTRAINT [PK_sintoma] PRIMARY KEY CLUSTERED 
(
	[id_sintoma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enfermedad]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enfermedad](
	[id_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[id_sintoma] [int] NOT NULL,
	[id_recomendacion] [int] NOT NULL,
 CONSTRAINT [PK_enfermedad] PRIMARY KEY CLUSTERED 
(
	[id_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sintoma_enfermedad]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sintoma_enfermedad](
	[id_sintoma_enfermedad] [int] IDENTITY(1,1) NOT NULL,
	[id_sintoma] [int] NOT NULL,
	[id_enfermedad] [int] NOT NULL,
 CONSTRAINT [PK_sintoma_enfermedad] PRIMARY KEY CLUSTERED 
(
	[id_sintoma_enfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaEnfermedad]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEnfermedad]
AS
SELECT        dbo.enfermedad.nombre, dbo.enfermedad.descripcion, dbo.sintoma.sintoma, dbo.recomendacion.recomendacion
FROM            dbo.enfermedad INNER JOIN
                         dbo.recomendacion ON dbo.enfermedad.id_recomendacion = dbo.recomendacion.id_recomendacion INNER JOIN
                         dbo.sintoma ON dbo.enfermedad.id_sintoma = dbo.sintoma.id_sintoma INNER JOIN
                         dbo.sintoma_enfermedad ON dbo.enfermedad.id_enfermedad = dbo.sintoma_enfermedad.id_enfermedad AND dbo.sintoma.id_sintoma = dbo.sintoma_enfermedad.id_sintoma
GO
/****** Object:  Table [dbo].[especialista]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialista](
	[id_especialista] [int] IDENTITY(1,1) NOT NULL,
	[id_ente] [int] NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[id_especialidad] [int] NOT NULL,
	[id_ciudad] [int] NOT NULL,
	[num_licencia] [int] NOT NULL,
	[fech_expedicion_licen] [date] NOT NULL,
 CONSTRAINT [PK_especialista] PRIMARY KEY CLUSTERED 
(
	[id_especialista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudad]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudad](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ciudad] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[id_especialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_especialidad] PRIMARY KEY CLUSTERED 
(
	[id_especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ente_salud]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ente_salud](
	[id_ente] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NULL,
	[nit] [int] NOT NULL,
	[razon_social] [varchar](50) NOT NULL,
	[representante] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[sitio_web] [varchar](50) NOT NULL,
	[id_ciudad] [int] NOT NULL,
	[capacidad_pacientes] [int] NOT NULL,
 CONSTRAINT [PK_ente_salud_1] PRIMARY KEY CLUSTERED 
(
	[id_ente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaEspecialista]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEspecialista]
AS
SELECT        dbo.especialista.nombre, dbo.ciudad.ciudad, dbo.especialidad.especialidad, dbo.especialista.correo, dbo.especialista.celular, dbo.especialista.num_licencia, dbo.especialista.fech_expedicion_licen, 
                         dbo.especialista.id_especialista, dbo.ente_salud.razon_social
FROM            dbo.ciudad INNER JOIN
                         dbo.especialista ON dbo.ciudad.id_ciudad = dbo.especialista.id_ciudad INNER JOIN
                         dbo.especialidad ON dbo.especialista.id_especialidad = dbo.especialidad.id_especialidad INNER JOIN
                         dbo.ente_salud ON dbo.ciudad.id_ciudad = dbo.ente_salud.id_ciudad AND dbo.especialista.id_ente = dbo.ente_salud.id_ente
GO
/****** Object:  Table [dbo].[cita]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cita](
	[id_cita] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NOT NULL,
	[id_especialista] [int] NOT NULL,
	[fecha_cita] [date] NOT NULL,
	[id_hora] [int] NOT NULL,
	[calificacion] [int] NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cita] PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hora_cita]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hora_cita](
	[id_hora] [int] IDENTITY(1,1) NOT NULL,
	[hora] [time](7) NOT NULL,
 CONSTRAINT [PK_hora_cita] PRIMARY KEY CLUSTERED 
(
	[id_hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[correo] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[cedula] [int] NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cita] ON 

INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (10, 1011, 6, CAST(N'2020-12-22' AS Date), 21, 4, N'Atendido')
INSERT [dbo].[cita] ([id_cita], [id_persona], [id_especialista], [fecha_cita], [id_hora], [calificacion], [estado]) VALUES (11, 1011, 6, CAST(N'2020-12-23' AS Date), 15, 5, N'Atendido')
SET IDENTITY_INSERT [dbo].[cita] OFF
GO
SET IDENTITY_INSERT [dbo].[ciudad] ON 

INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (1, N'Cali')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (2, N'Buenaventura')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (3, N'Buga')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (4, N'Cartago')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (5, N'Tuluá')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (6, N'Palmira')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (7, N'Jamundí')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (8, N'Zarzal')
INSERT [dbo].[ciudad] ([id_ciudad], [ciudad]) VALUES (9, N'Calima')
SET IDENTITY_INSERT [dbo].[ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[enfermedad] ON 

INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_sintoma], [id_recomendacion]) VALUES (1, N'rinitis', N'mocos', 1, 1)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_sintoma], [id_recomendacion]) VALUES (2, N'extres', N'dolor del craneo', 2, 2)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_sintoma], [id_recomendacion]) VALUES (3, N'sueño', N'falta de descanso', 3, 3)
INSERT [dbo].[enfermedad] ([id_enfermedad], [nombre], [descripcion], [id_sintoma], [id_recomendacion]) VALUES (4, N'celulitis', N'manchas en la piel', 4, 4)
SET IDENTITY_INSERT [dbo].[enfermedad] OFF
GO
SET IDENTITY_INSERT [dbo].[ente_salud] ON 

INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (10, 1012, 1111, N'aaaa', N'aaaa', N'aaa@ggg.co', N'111', N'aaa', 1, 11)
INSERT [dbo].[ente_salud] ([id_ente], [id_persona], [nit], [razon_social], [representante], [correo], [telefono], [sitio_web], [id_ciudad], [capacidad_pacientes]) VALUES (11, NULL, 99999999, N'FFMM', N'Diego Marin', N'dgmarin@gmail.com', N'3123451231', N'fffmm.com', 1, 12)
SET IDENTITY_INSERT [dbo].[ente_salud] OFF
GO
SET IDENTITY_INSERT [dbo].[especialidad] ON 

INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (1, N'Cardiología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (2, N'Endocrinología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (3, N'Radiología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (4, N'Ortopedia y Traumatología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (5, N'Psiquiatría')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (6, N'Urología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (7, N'Ginecología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (8, N'Oftalmología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (9, N'Otorrinolaringología')
INSERT [dbo].[especialidad] ([id_especialidad], [especialidad]) VALUES (10, N'Geriatría')
SET IDENTITY_INSERT [dbo].[especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[especialista] ON 

INSERT [dbo].[especialista] ([id_especialista], [id_ente], [nombre], [correo], [celular], [id_especialidad], [id_ciudad], [num_licencia], [fech_expedicion_licen]) VALUES (6, 10, N'Jorge', N'Jorge@gmail.com', N'3123456723', 1, 1, 100093873, CAST(N'2020-12-10' AS Date))
SET IDENTITY_INSERT [dbo].[especialista] OFF
GO
SET IDENTITY_INSERT [dbo].[hora_cita] ON 

INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (2, CAST(N'00:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (3, CAST(N'01:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (4, CAST(N'01:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (5, CAST(N'02:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (6, CAST(N'02:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (7, CAST(N'03:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (8, CAST(N'03:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (9, CAST(N'04:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (10, CAST(N'04:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (11, CAST(N'05:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (12, CAST(N'05:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (13, CAST(N'06:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (14, CAST(N'06:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (15, CAST(N'07:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (16, CAST(N'07:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (17, CAST(N'08:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (18, CAST(N'08:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (19, CAST(N'09:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (20, CAST(N'09:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (21, CAST(N'10:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (22, CAST(N'10:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (23, CAST(N'11:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (24, CAST(N'11:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (25, CAST(N'12:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (26, CAST(N'12:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (27, CAST(N'13:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (28, CAST(N'13:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (29, CAST(N'14:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (30, CAST(N'14:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (31, CAST(N'15:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (32, CAST(N'15:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (33, CAST(N'16:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (34, CAST(N'16:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (35, CAST(N'17:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (36, CAST(N'17:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (37, CAST(N'18:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (38, CAST(N'18:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (39, CAST(N'19:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (40, CAST(N'19:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (41, CAST(N'20:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (42, CAST(N'20:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (43, CAST(N'21:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (44, CAST(N'21:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (45, CAST(N'22:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (46, CAST(N'22:30:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (47, CAST(N'23:00:00' AS Time))
INSERT [dbo].[hora_cita] ([id_hora], [hora]) VALUES (48, CAST(N'23:30:00' AS Time))
SET IDENTITY_INSERT [dbo].[hora_cita] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1009, 1, N'Luis', N'Huertas', N'ldhuertas56@misena.edu.co', N'3123139618', 1000941665, N'admin')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1010, 2, N'Sebastian', N'Avendaño', N'sebastian@misena.edu.co', N'3143364464', 1000941682, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1011, 3, N'Marco', N'Perez', N'marco@gmail.com', N'3123139618', 1098943275, N'123')
INSERT [dbo].[persona] ([id_persona], [id_rol], [nombre], [apellido], [correo], [celular], [cedula], [password]) VALUES (1012, 2, N'Mauricio', N'Cardenas', N'mau@hotmail.com', N'3336412318', 92277272, N'123')
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[recomendacion] ON 

INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (1, N'dolex forte')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (2, N'pax noche')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (3, N'pepino en los ojos')
INSERT [dbo].[recomendacion] ([id_recomendacion], [recomendacion]) VALUES (4, N'cicatricure')
SET IDENTITY_INSERT [dbo].[recomendacion] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (1, N'Administrador')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (2, N'Contenido')
INSERT [dbo].[rol] ([id_rol], [rol]) VALUES (3, N'Normal')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[sintoma] ON 

INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (1, N'dolor de cabeza')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (2, N'moquera')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (3, N'ojeras')
INSERT [dbo].[sintoma] ([id_sintoma], [sintoma]) VALUES (4, N'celulitis')
SET IDENTITY_INSERT [dbo].[sintoma] OFF
GO
SET IDENTITY_INSERT [dbo].[sintoma_enfermedad] ON 

INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (1, 1, 1)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (2, 2, 2)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (3, 3, 3)
INSERT [dbo].[sintoma_enfermedad] ([id_sintoma_enfermedad], [id_sintoma], [id_enfermedad]) VALUES (4, 4, 4)
SET IDENTITY_INSERT [dbo].[sintoma_enfermedad] OFF
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_especialista] FOREIGN KEY([id_especialista])
REFERENCES [dbo].[especialista] ([id_especialista])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_especialista]
GO
ALTER TABLE [dbo].[cita]  WITH CHECK ADD  CONSTRAINT [FK_cita_hora] FOREIGN KEY([id_hora])
REFERENCES [dbo].[hora_cita] ([id_hora])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cita] CHECK CONSTRAINT [FK_cita_hora]
GO
ALTER TABLE [dbo].[enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_enfermedad_recomendacion] FOREIGN KEY([id_recomendacion])
REFERENCES [dbo].[recomendacion] ([id_recomendacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enfermedad] CHECK CONSTRAINT [FK_enfermedad_recomendacion]
GO
ALTER TABLE [dbo].[ente_salud]  WITH CHECK ADD  CONSTRAINT [FK_ente_salud_ente_ciudad] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[ciudad] ([id_ciudad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ente_salud] CHECK CONSTRAINT [FK_ente_salud_ente_ciudad]
GO
ALTER TABLE [dbo].[ente_salud]  WITH CHECK ADD  CONSTRAINT [FK_ente_salud_persona] FOREIGN KEY([id_persona])
REFERENCES [dbo].[persona] ([id_persona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ente_salud] CHECK CONSTRAINT [FK_ente_salud_persona]
GO
ALTER TABLE [dbo].[especialista]  WITH CHECK ADD  CONSTRAINT [FK_especialista_ente] FOREIGN KEY([id_ente])
REFERENCES [dbo].[ente_salud] ([id_ente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[especialista] CHECK CONSTRAINT [FK_especialista_ente]
GO
ALTER TABLE [dbo].[especialista]  WITH CHECK ADD  CONSTRAINT [FK_especialista_especialidad] FOREIGN KEY([id_especialidad])
REFERENCES [dbo].[especialidad] ([id_especialidad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[especialista] CHECK CONSTRAINT [FK_especialista_especialidad]
GO
ALTER TABLE [dbo].[persona]  WITH CHECK ADD  CONSTRAINT [FK_persona_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [FK_persona_rol]
GO
ALTER TABLE [dbo].[sintoma_enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_sintoma_enfermedad_enfermedad] FOREIGN KEY([id_enfermedad])
REFERENCES [dbo].[enfermedad] ([id_enfermedad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sintoma_enfermedad] CHECK CONSTRAINT [FK_sintoma_enfermedad_enfermedad]
GO
ALTER TABLE [dbo].[sintoma_enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_sintoma_enfermedad_sintoma] FOREIGN KEY([id_sintoma])
REFERENCES [dbo].[sintoma] ([id_sintoma])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sintoma_enfermedad] CHECK CONSTRAINT [FK_sintoma_enfermedad_sintoma]
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 10/12/2020 6:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login]
	-- Add the parameters for the stored procedure here
	@cedula int, @contrasenia varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM persona WHERE persona.cedula=@cedula and persona.password=@contrasenia;

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[9] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "enfermedad"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "recomendacion"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 101
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sintoma"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 102
               Right = 658
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sintoma_enfermedad"
            Begin Extent = 
               Top = 6
               Left = 696
               Bottom = 119
               Right = 912
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1230
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEnfermedad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEnfermedad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEnfermedad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ciudad"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "especialidad"
            Begin Extent = 
               Top = 6
               Left = 489
               Bottom = 102
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ente_salud"
            Begin Extent = 
               Top = 125
               Left = 0
               Bottom = 255
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "especialista"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaEspecialista'
GO
USE [master]
GO
ALTER DATABASE [rvs] SET  READ_WRITE 
GO
