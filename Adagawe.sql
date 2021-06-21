USE [master]
GO
/****** Object:  Database [Adagawe]    Script Date: 6/21/2021 8:45:56 PM ******/
CREATE DATABASE [Adagawe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Adagawe', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Adagawe_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Adagawe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Adagawe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Adagawe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Adagawe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Adagawe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Adagawe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Adagawe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Adagawe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Adagawe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Adagawe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Adagawe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Adagawe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Adagawe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Adagawe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Adagawe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Adagawe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Adagawe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Adagawe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Adagawe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Adagawe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Adagawe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Adagawe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Adagawe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Adagawe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Adagawe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Adagawe] SET  MULTI_USER 
GO
ALTER DATABASE [Adagawe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Adagawe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Adagawe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Adagawe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Adagawe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Adagawe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Adagawe] SET QUERY_STORE = OFF
GO
USE [Adagawe]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_admin] [varchar](100) NULL,
	[tanggal_lahir] [date] NULL,
	[jenis_kelamin] [char](1) NULL,
	[no_telepon] [varchar](13) NULL,
	[foto_profil] [varchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmationToken]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfirmationToken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[confirmation_token] [varchar](255) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_ConfirmationToken] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jabatan]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jabatan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_jabatan] [varchar](50) NULL,
	[deskripsi] [varchar](255) NULL,
 CONSTRAINT [PK_Jabatan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JenisPegawai]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JenisPegawai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jenis_pegawai] [varchar](100) NULL,
 CONSTRAINT [PK_JenisPegawai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jenjang]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jenjang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_jenjang] [varchar](10) NULL,
	[deskripsi] [varchar](50) NULL,
	[tingkatan_jenjang] [int] NULL,
 CONSTRAINT [PK_Jenjang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelamar]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelamar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_pelamar] [varchar](100) NULL,
	[tanggal_lahir] [date] NULL,
	[jenis_kelamin] [char](1) NULL,
	[no_telepon] [varchar](13) NULL,
	[dokumen_cv] [varchar](100) NULL,
	[id_user_login] [int] NULL,
	[foto_profil] [varchar](100) NULL,
 CONSTRAINT [PK_Pelamar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pendidikan]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pendidikan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelamar] [int] NULL,
	[id_jenjang] [int] NULL,
	[nama_jurusan] [varchar](50) NULL,
	[nama_universitas] [varchar](100) NULL,
	[tahun_mulai] [varchar](10) NULL,
	[tahun_selesai] [varchar](10) NULL,
 CONSTRAINT [PK_Pendidikan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pengalaman]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pengalaman](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelamar] [int] NOT NULL,
	[id_jabatan] [int] NOT NULL,
	[id_jenis_pegawai] [int] NOT NULL,
	[nama_perusahaan] [varchar](100) NOT NULL,
	[mulai_kerja] [date] NOT NULL,
	[terakhir_kerja] [date] NOT NULL,
	[deskripsi] [varchar](255) NULL,
	[file_attachment] [varchar](100) NULL,
 CONSTRAINT [PK_Pengalaman] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perusahaan]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perusahaan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_perusahaan] [varchar](100) NULL,
	[alamat_lengkap] [varchar](255) NULL,
	[provinsi] [varchar](50) NULL,
	[kota] [varchar](50) NULL,
	[telah_terverifikasi] [int] NULL,
	[foto_profil] [varchar](100) NULL,
	[bidang_perusahaan] [varchar](100) NULL,
 CONSTRAINT [PK_Perusahaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sertifikat]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sertifikat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelamar] [int] NULL,
	[no_sertifikat] [varchar](50) NULL,
	[berlaku_mulai] [date] NULL,
	[berlaku_sampai] [date] NULL,
	[file_attachment] [varchar](100) NULL,
 CONSTRAINT [PK_Sertifikat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_skill] [varchar](50) NULL,
	[deskripsi] [varchar](255) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 6/21/2021 8:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[user_role] [int] NULL,
	[locked] [int] NULL,
	[enabled] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pengalaman] ADD  CONSTRAINT [DF_Pengalaman_file_attachment]  DEFAULT ('default.jpg') FOR [file_attachment]
GO
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [DF_UserLogin_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[ConfirmationToken]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationToken_UserLogin] FOREIGN KEY([id_user])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[ConfirmationToken] CHECK CONSTRAINT [FK_ConfirmationToken_UserLogin]
GO
USE [master]
GO
ALTER DATABASE [Adagawe] SET  READ_WRITE 
GO
