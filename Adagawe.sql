USE [master]
GO
/****** Object:  Database [Adagawe]    Script Date: 8/3/2021 1:01:10 PM ******/
CREATE DATABASE [Adagawe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Adagawe', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Adagawe_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Adagawe] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [Adagawe] SET QUERY_STORE = OFF
GO
USE [Adagawe]
GO
/****** Object:  Table [dbo].[Lamaran]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lamaran](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelamar] [int] NULL,
	[id_lowongan] [int] NULL,
	[tanggal_melamar] [date] NULL,
	[pesan_pelamar] [varchar](255) NULL,
	[resume] [varchar](50) NULL,
	[status_lamaran] [int] NULL,
	[nilai_uji_kompetensi] [float] NULL,
	[nilai_wawancara] [float] NULL,
 CONSTRAINT [PK_Lamaran] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perusahaan]    Script Date: 8/3/2021 1:01:10 PM ******/
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
	[row_status] [int] NULL,
	[id_user_login] [int] NULL,
 CONSTRAINT [PK_Perusahaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lowongan]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lowongan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_perusahaan] [int] NULL,
	[id_jenis_pegawai] [int] NULL,
	[judul_lowongan] [varchar](100) NULL,
	[keterangan] [varchar](max) NULL,
	[jenjang_minimal] [int] NULL,
	[gaji_minimal] [int] NULL,
	[gaji_maksimal] [int] NULL,
	[pengalaman_kerja] [varchar](50) NULL,
	[keahlian] [varchar](255) NULL,
	[sembunyikan_gaji] [int] NULL,
	[status] [int] NULL,
	[created_date] [date] NULL,
	[last_modified] [date] NULL,
 CONSTRAINT [PK_Lowongan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_LaporanDaerah]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_LaporanDaerah] AS
SELECT        lao.kota AS kota, lao.jumlah_lowongan, laa.jumlah_lamaran
FROM            
(SELECT        p.kota, COUNT(l.id) AS jumlah_lowongan
                          FROM            dbo.Lowongan AS l RIGHT OUTER JOIN
                                                    dbo.Perusahaan AS p ON l.id_perusahaan = p.id
                          GROUP BY p.kota) AS lao INNER JOIN
                             (SELECT        p.kota, COUNT(lo.id) AS jumlah_lowongan, COUNT(la.id) AS jumlah_lamaran
                               FROM            dbo.Lamaran AS la INNER JOIN
                                                         dbo.Lowongan AS lo ON la.id_lowongan = lo.id RIGHT OUTER JOIN
                                                         dbo.Perusahaan AS p ON lo.id_perusahaan = p.id
                               GROUP BY p.kota) AS laa ON lao.kota = laa.kota
GO
/****** Object:  Table [dbo].[Pendidikan]    Script Date: 8/3/2021 1:01:10 PM ******/
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
	[row_status] [int] NULL,
 CONSTRAINT [PK_Pendidikan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jenjang]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jenjang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_jenjang] [varchar](10) NULL,
	[deskripsi] [varchar](50) NULL,
	[tingkatan_jenjang] [float] NULL,
 CONSTRAINT [PK_Jenjang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](100) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[user_role] [int] NULL,
	[locked] [int] NULL,
	[enabled] [int] NULL,
	[row_status] [int] NULL,
	[foto_profil] [varchar](100) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelamar]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelamar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tanggal_lahir] [date] NULL,
	[jenis_kelamin] [char](1) NULL,
	[kota] [varchar](50) NULL,
	[alamat] [varchar](255) NULL,
	[no_telepon] [varchar](13) NULL,
	[headline] [varchar](max) NULL,
	[dokumen_cv] [varchar](100) NULL,
	[id_user_login] [int] NULL,
	[row_status] [int] NULL,
 CONSTRAINT [PK_Pelamar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_LamaranPelamar]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_LamaranPelamar] AS
SELECT        l.id AS id_lamaran, l.status_lamaran, l.id_lowongan, lo.jenjang_minimal, l.id_pelamar, ul.nama as nama_pelamar, ul.foto_profil as foto_profil, p.tanggal_lahir, p.jenis_kelamin, p.kota, p.alamat, p.no_telepon, p.headline, p.dokumen_cv, p.id_user_login, 
                         p.row_status, pt.pendidikan_terakhir, pt.tingkatan_jenjang, CAST(DATEDIFF(DD, p.tanggal_lahir, GETDATE()) / 365.25 AS INT) AS umur, l.nilai_uji_kompetensi, l.nilai_wawancara
FROM            dbo.Lamaran AS l INNER JOIN
                         dbo.Pelamar AS p ON l.id_pelamar = p.id INNER JOIN UserLogin ul ON p.id_user_login = ul.id INNER JOIN
                         dbo.Lowongan AS lo ON lo.id = l.id_lowongan LEFT OUTER JOIN
                             (SELECT        p.id_pelamar,
                                                             (SELECT        nama_jenjang
                                                               FROM            dbo.Jenjang AS js
                                                               WHERE        (tingkatan_jenjang = MAX(j.tingkatan_jenjang))) AS pendidikan_terakhir,
                                                             (SELECT        tingkatan_jenjang
                                                               FROM            dbo.Jenjang AS js
                                                               WHERE        (tingkatan_jenjang = MAX(j.tingkatan_jenjang))) AS tingkatan_jenjang
                               FROM            dbo.Pendidikan AS p INNER JOIN
                                                         dbo.Jenjang AS j ON j.id = p.id_jenjang
                               GROUP BY p.id_pelamar) AS pt ON pt.id_pelamar = p.id
GO
/****** Object:  View [dbo].[view_LowonganLamaran]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_LowonganLamaran] AS
SELECT lo.id, lo.id_perusahaan, COUNT(la.id) as jumlah_pelamar FROM Lowongan lo LEFT JOIN Lamaran la ON lo.id = la.id_lowongan GROUP BY lo.id, lo.id_perusahaan
GO
/****** Object:  View [dbo].[view_LaporanBidang]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_LaporanBidang]
AS
SELECT lao.bidang_perusahaan as nama_bidang, lao.jumlah_lowongan, laa.jumlah_lamaran FROM
(SELECT p.bidang_perusahaan, COUNT(l.id) as jumlah_lowongan 
FROM Lowongan l RIGHT JOIN Perusahaan p ON l.id_perusahaan = p.id GROUP BY p.bidang_perusahaan) lao
JOIN 
(SELECT p.bidang_perusahaan, COUNT(lo.id) as jumlah_lowongan, COUNT(la.id) as jumlah_lamaran 
FROM Lamaran la JOIN Lowongan lo ON la.id_lowongan = lo.id RIGHT JOIN Perusahaan p ON lo.id_perusahaan = p.id GROUP BY p.bidang_perusahaan) laa
ON lao.bidang_perusahaan = laa.bidang_perusahaan
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tanggal_lahir] [date] NULL,
	[jenis_kelamin] [char](1) NULL,
	[no_telepon] [varchar](13) NULL,
	[row_status] [int] NULL,
	[id_user_login] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmationToken]    Script Date: 8/3/2021 1:01:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jabatan]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jabatan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_jabatan] [varchar](50) NULL,
	[deskripsi] [varchar](255) NULL,
	[row_status] [int] NULL,
 CONSTRAINT [PK_Jabatan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JenisPegawai]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JenisPegawai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jenis_pegawai] [varchar](100) NULL,
	[row_status] [int] NULL,
 CONSTRAINT [PK_JenisPegawai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifikasi]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifikasi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_lamaran] [int] NULL,
	[tahap] [varchar](50) NULL,
	[hasil] [int] NULL,
	[tahap_selanjutnya] [varchar](50) NULL,
	[tanggal_tahapan] [datetime] NULL,
	[terkonfirmasi] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Notifikasi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pengalaman]    Script Date: 8/3/2021 1:01:10 PM ******/
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
	[row_status] [int] NULL,
 CONSTRAINT [PK_Pengalaman] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pesan]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pesan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pengirim_satu] [int] NULL,
	[pengirim_dua] [int] NULL,
	[pesan_terakhir] [varchar](255) NULL,
 CONSTRAINT [PK_Pesan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sertifikat]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sertifikat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pelamar] [int] NULL,
	[judul] [varchar](50) NULL,
	[no_sertifikat] [varchar](50) NULL,
	[berlaku_mulai] [date] NULL,
	[berlaku_sampai] [date] NULL,
	[file_attachment] [varchar](100) NULL,
	[row_status] [int] NULL,
 CONSTRAINT [PK_Sertifikat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerifikasiPerusahaan]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerifikasiPerusahaan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_perusahaan] [int] NULL,
	[npwp] [varchar](100) NULL,
	[tdp] [varchar](100) NULL,
	[siu] [varchar](100) NULL,
	[hasil] [int] NULL,
	[created_date] [date] NULL,
	[last_modified] [date] NULL,
	[diverifikasi_oleh] [varchar](50) NULL,
	[komentar] [varchar](100) NULL,
 CONSTRAINT [PK_VerifikasiPerusahaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [tanggal_lahir], [jenis_kelamin], [no_telepon], [row_status], [id_user_login]) VALUES (1, CAST(N'2001-06-20' AS Date), N'L', N'0861273', 1, 1)
INSERT [dbo].[Admin] ([id], [tanggal_lahir], [jenis_kelamin], [no_telepon], [row_status], [id_user_login]) VALUES (2, CAST(N'2021-06-24' AS Date), N'L', N'081245233455', 1, 2)
INSERT [dbo].[Admin] ([id], [tanggal_lahir], [jenis_kelamin], [no_telepon], [row_status], [id_user_login]) VALUES (3, CAST(N'2002-09-24' AS Date), N'L', N'082982387283', 1, 3)
INSERT [dbo].[Admin] ([id], [tanggal_lahir], [jenis_kelamin], [no_telepon], [row_status], [id_user_login]) VALUES (4, CAST(N'2000-12-30' AS Date), N'P', N'082987382733', 1, 4)
INSERT [dbo].[Admin] ([id], [tanggal_lahir], [jenis_kelamin], [no_telepon], [row_status], [id_user_login]) VALUES (5, CAST(N'2001-07-07' AS Date), N'P', N'083982392893', 1, 5)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[ConfirmationToken] ON 

INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (1, 1, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (2, 2, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (3, 3, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (4, 4, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-21T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (5, 5, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (6, 6, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-06-24T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (7, 7, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (8, 8, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (9, 9, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (10, 10, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (11, 11, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (12, 12, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (13, 13, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (14, 14, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (15, 15, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (16, 16, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (17, 17, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (18, 18, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (19, 19, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (20, 20, N'284c6358-3dd0-4f3b-b636-c34240be7b6f', CAST(N'2021-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (21, 21, N'654432d5-fc55-4133-9a37-a298d6dd582a', CAST(N'2021-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ConfirmationToken] ([id], [id_user], [confirmation_token], [created_date]) VALUES (26, 26, N'2bfa2a5a-3516-4b05-85bf-4f0cf84d9a63', CAST(N'2021-07-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConfirmationToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Jabatan] ON 

INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (1, N'Software Developer', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (2, N'Database Administrator', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (3, N'IT Support', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (4, N'Senior Programmer', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (5, N'System Analyst', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (6, N'Network Architect', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (7, N'Web Developer', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (8, N'UI/UX Designer', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (9, N'Data Scientist', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (10, N'Junior Programmer', NULL, 1)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (1001, N'Big data analyst', N'Bertanggung jawab dalam urusan data', 0)
INSERT [dbo].[Jabatan] ([id], [nama_jabatan], [deskripsi], [row_status]) VALUES (1002, N'Big Data Analyst', N'Bertanggung jawab dalam urusan data', 0)
SET IDENTITY_INSERT [dbo].[Jabatan] OFF
GO
SET IDENTITY_INSERT [dbo].[JenisPegawai] ON 

INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (1, N'Full-time', 1)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (2, N'Part-time', 1)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (3, N'Freelance', 1)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (4, N'Contract', 1)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (5, N'Magang', 1)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (6, N'poiouihjghgfh', 0)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (7, N'Probational', 0)
INSERT [dbo].[JenisPegawai] ([id], [jenis_pegawai], [row_status]) VALUES (8, N'Probational', 0)
SET IDENTITY_INSERT [dbo].[JenisPegawai] OFF
GO
SET IDENTITY_INSERT [dbo].[Jenjang] ON 

INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (1, N'SD', N'Sekolah Dasar', 1)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (2, N'SMP', N'Sekolah Menengah Pertama', 2)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (3, N'SMK', N'Sekolah Menengah Kejurusan', 3)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (4, N'SMA', N'Sekolah Menengah Atas', 3.5)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (5, N'D3', N'Diploma III', 4)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (6, N'D4', N'Diplova IV', 5)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (7, N'S1', N'Sarjana', 5.5)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (8, N'S2', N'Magister', 6)
INSERT [dbo].[Jenjang] ([id], [nama_jenjang], [deskripsi], [tingkatan_jenjang]) VALUES (9, N'S3', N'Doctor', 7)
SET IDENTITY_INSERT [dbo].[Jenjang] OFF
GO
SET IDENTITY_INSERT [dbo].[Lamaran] ON 

INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1, 1, 1, CAST(N'2021-07-13' AS Date), N'Saya berpenampilan baik dan pantang menyerah', NULL, 6, 90, 89)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (2, 1, 2, CAST(N'2021-07-21' AS Date), N'asd', N'210721-013139-080.sql', 6, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (3, 6, 1, CAST(N'2021-07-13' AS Date), N'Saya memiliki kemampuan kerjasama tim yang baik', NULL, 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (4, 4, 1, CAST(N'2021-07-13' AS Date), N'Saya berpenampilan baik dan pantang menyerah', NULL, 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (5, 7, 1, CAST(N'2021-07-13' AS Date), N'Saya memiliki kemampuan kerjasama tim yang baik', NULL, 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (6, 1, 2, CAST(N'2021-07-13' AS Date), N'Saya berpenampilan baik dan pantang menyerah', NULL, 5, 86, 65)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (7, 2, 2, CAST(N'2021-07-13' AS Date), N'Saya memiliki kemampuan kerjasama tim yang baik', NULL, 2, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (9, 4, 2, CAST(N'2021-07-13' AS Date), N'Saya berpenampilan baik dan pantang menyerah', NULL, 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (10, 5, 2, CAST(N'2021-07-13' AS Date), N'Saya memiliki kemampuan kerjasama tim yang baik', NULL, 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (11, 4, 11, CAST(N'2021-07-25' AS Date), N'', N'250721-101032-881.png', 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1011, 2, 11, CAST(N'2021-07-25' AS Date), N'', N'250721-102131-117.png', 6, 95, 100)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1012, 12, 1, CAST(N'2021-07-26' AS Date), N'', N'260721-031127-000.sql', 5, 89, 80)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1013, 3, 1, CAST(N'2021-07-26' AS Date), N'Saya memiliki kemampuan kerjasama tim yang baik', N'260721-031127-000.sql', 1, NULL, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1014, 13, 1, CAST(N'2021-07-27' AS Date), N'Saya ingin melamar', N'270721-013256-023.sql', 3, 88, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1015, 1, 14, CAST(N'2021-08-02' AS Date), N'asd', N'020821-044434-514.jpg', 6, 84, 89)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1016, 2, 14, CAST(N'2021-08-02' AS Date), N'asd', N'020821-044505-908.jpg', 3, 45, NULL)
INSERT [dbo].[Lamaran] ([id], [id_pelamar], [id_lowongan], [tanggal_melamar], [pesan_pelamar], [resume], [status_lamaran], [nilai_uji_kompetensi], [nilai_wawancara]) VALUES (1017, 1, 3, CAST(N'2021-08-02' AS Date), N'', N'020821-075755-525.jpg', 4, 90, NULL)
SET IDENTITY_INSERT [dbo].[Lamaran] OFF
GO
SET IDENTITY_INSERT [dbo].[Lowongan] ON 

INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (1, 1, 1, N'Front-End Developer', N'asdasd', 4, 5000000, 10000000, N'1 - 3 tahun', N'Spring, Laravel, React.js', 0, 0, CAST(N'2021-06-30' AS Date), CAST(N'2021-07-02' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (2, 2, 2, N'Back-End Developer', N'asdasd', 5, 6000000, 9000000, N'< 1 tahun', N'Node.js, Lumen', 0, 1, CAST(N'2021-06-30' AS Date), CAST(N'2021-07-02' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (3, 1, 3, N'Data Science', N'asdfghjkl', 4, 12000, 15000, N'3 tahun', N'SQL, R, Phyton', 0, 1, CAST(N'2021-07-07' AS Date), CAST(N'2021-07-02' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (4, 4, 1, N'Junior Programmer', N'minimal pendidikan D3', 4, 5000000, 4000000, N'1 - 5 tahun', N'React.js', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (5, 5, 2, N'System Analyst', N'pengalaman kerja min 2 tahun', 5, 4000000, 6000000, N'> 5 tahun', N'Vue.js', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (6, 6, 3, N'Junior Programmer', N'minimal pendidikan D3', 3, 3000000, 5000000, N'< 2 tahun', N'MongoDB, Node.js', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (7, 7, 4, N'System Analyst', N'fresh graduate', 5, 5000000, 4000000, N'> 1 tahun', N'Adobe Photoshop, Adobe Illustrator', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (8, 8, 5, N'Junior Programmer', N'minimal pendidikan D3', 5, 4000000, 5000000, N'1 - 5 tahun', N'Adobe XD', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (9, 9, 1, N'System Analyst', N'pengalaman kerja min 2 tahun', 6, 5000000, 6000000, N'1 - 3 tahun', N'Javascript, SCSS', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (10, 10, 2, N'System Analyst', N'pengalaman kerja min 2 tahun', 3, 3000000, 5000000, N'> 5', N'CSS, HTML', 0, 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (11, 2, 3, N'Oke Test', N'test', 4, 1000000, 2000000, N'1 tahun', N'Spring', 0, 1, CAST(N'2021-07-21' AS Date), NULL)
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (12, 2, 2, N'Test', N'asd', 3, 1000000, 2000000, N'1 tahun', N'Spring, Laravel', 0, 1, CAST(N'2021-07-21' AS Date), NULL)
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (13, 1, 1, N'.NET Developer', N'<div class="JobDescriptionsc__TitleContainer-sc-1jylha1-1 kKjIMx" style="margin-bottom: 16px; font-family: Poppins, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; letter-spacing: normal;"><h2 class="JobDescriptionsc__Title-sc-1jylha1-0 bxMkmR" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: bold; font-size: 16px; line-height: 1.58;">Deskripsi pekerjaan Graphic Designer Awal Mula (PT. Eling Janji Pertama)</h2></div><div class="JobDescriptionsc__DescriptionContainer-sc-1jylha1-2 gpAMiw" style="font-family: Poppins, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; letter-spacing: normal;"><div class="DraftEditorContainersc__DraftEditorContainer-sc-1x4uima-0 ciYPrs"><div class="DraftEditor-root" style="height: inherit; text-align: initial; position: relative;"><div class="DraftEditor-editorContainer" style="height: inherit; text-align: initial; background-color: rgba(255, 255, 255, 0); border-left: 0.1px solid transparent; position: relative; z-index: 1;"><div aria-describedby="placeholder-55h5f" class="public-DraftEditor-content" contenteditable="false" spellcheck="false" style="height: inherit; text-align: initial; outline: none; user-select: text; white-space: pre-wrap; overflow-wrap: break-word;"><div data-contents="true"><ul class="public-DraftStyleDefault-ul" data-offset-key="9vt08-0-0" style="margin: 16px 0px; padding: 0px;"><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-reset public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="9vt08-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em; counter-reset: ol0 0;"><div data-offset-key="9vt08-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="9vt08-0-0"><span data-text="true">Membuat visual untuk kepentingan social media dan marketing, dan/atau kebutuhan kantor lainnya</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="88m96-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="88m96-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="88m96-0-0"><span data-text="true">Mengimplementasikan konsep arahan dari Supervisor</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="2n8h9-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="2n8h9-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="2n8h9-0-0"><span data-text="true">Menyuarakan ide dan ikut dalam brainstorming untuk meningkatkan kualitas output</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="1f415-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="1f415-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="1f415-0-0"><span data-text="true">Membuat dan mensupervisi design serta hasil design yang berhubungan dengan vendor cetak</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="62dk1-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="62dk1-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="62dk1-0-0"><span data-text="true">Berkoordinasi dengan tim terkait untuk memenuhi deadline</span></span></div></li></ul><div class="" data-block="true" data-editor="55h5f" data-offset-key="31mtp-0-0"><div data-offset-key="31mtp-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="31mtp-0-0" style="font-weight: bold;"><span data-text="true">Requirements:</span></span></div></div><ul class="public-DraftStyleDefault-ul" data-offset-key="cric7-0-0" style="margin: 16px 0px; padding: 0px;"><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-reset public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="cric7-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em; counter-reset: ol0 0;"><div data-offset-key="cric7-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="cric7-0-0"><span data-text="true">Memiliki pengalaman sebagai Graphic Designer minimal 1 tahun</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="6o3eu-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="6o3eu-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="6o3eu-0-0"><span data-text="true">Lulusan dari jurusan DKV atau setara</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="1npv2-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="1npv2-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="1npv2-0-0"><span data-text="true">Memiliki tingkat kreativitas, artistik, selera estetika, typography, serta layouting yang tinggi</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="5g2ag-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="5g2ag-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="5g2ag-0-0"><span data-text="true">Mampu bekerja sesuai dengan deadline, disiplin dan teliti</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="674s5-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="674s5-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="674s5-0-0"><span data-text="true">Mahir dalam menggunakan Adobe Creative Suite</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="5fhmb-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="5fhmb-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="5fhmb-0-0"><span data-text="true">Memiliki nilai plus jika mahir dalam ilustrasi, motion graphic, dan/atau digital marketing</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="3fgs4-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="3fgs4-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="3fgs4-0-0"><span data-text="true">Nilai tambahan jika pernah bekerja di Agency</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="7m6ub-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="7m6ub-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="7m6ub-0-0"><span data-text="true">Memiliki skill interpersonal dan komunikasi yang baik</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="e4i95-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="e4i95-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="e4i95-0-0"><span data-text="true">Mampu bekerja secara team serta memiliki ketertarikan belajar yang tinggi</span></span></div></li><li class="public-DraftStyleDefault-unorderedListItem public-DraftStyleDefault-depth0 public-DraftStyleDefault-listLTR" data-block="true" data-editor="55h5f" data-offset-key="9gotu-0-0" style="direction: ltr; list-style-type: disc; position: relative; line-height: 0px; margin-left: 1.5em;"><div data-offset-key="9gotu-0-0" class="public-DraftStyleDefault-block public-DraftStyleDefault-ltr" style="line-height: 1.8; position: relative; direction: ltr; margin-top: 10px;"><span data-offset-key="9gotu-0-0"><span data-text="true">Bertanggungjawab, loyal dan positif</span></span></div></li></ul></div></div></div></div></div></div>', 3, 500, 1000, N'1 thn', N'C#', 1, 1, CAST(N'2021-07-24' AS Date), CAST(N'2021-07-24' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (14, 2, 4, N'Testset', N'<p><b>Deskripsi</b></p><ul><li>Sangat Butuh orang yang kompeten</li></ul>', 3, 1000000, 5000000, N'1 thn', N'spring,laravel', 0, 1, CAST(N'2021-07-24' AS Date), CAST(N'2021-07-24' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (15, 1011, 1, N'Senior Analyst', N'<p>Memiliki Pengalaman Kerja sebagai senior programmer</p>', 5, 5000000, 10000000, N'2 tahun', N'PHP,ASP.NET,C#', 0, 1, CAST(N'2021-07-26' AS Date), CAST(N'2021-07-26' AS Date))
INSERT [dbo].[Lowongan] ([id], [id_perusahaan], [id_jenis_pegawai], [judul_lowongan], [keterangan], [jenjang_minimal], [gaji_minimal], [gaji_maksimal], [pengalaman_kerja], [keahlian], [sembunyikan_gaji], [status], [created_date], [last_modified]) VALUES (16, 1012, 1, N'Senior Analyst', N'<p>Memiliki pengalaman kerja sebagai senior programmer</p>', 5, 5000000, 10000000, N'2 tahun', N'PHP,ASP.NET,C#', 0, 1, CAST(N'2021-07-27' AS Date), CAST(N'2021-07-27' AS Date))
SET IDENTITY_INSERT [dbo].[Lowongan] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifikasi] ON 

INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (30, 1, N'Kualifikasi', 1, N'Uji Kompetensi', CAST(N'2021-08-11T11:02:00.000' AS DateTime), 1, CAST(N'2021-08-03T11:02:16.233' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (31, 3, N'Kualifikasi', 0, N'Uji Kompetensi', NULL, 0, CAST(N'2021-08-03T11:02:16.443' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (32, 4, N'Kualifikasi', 0, N'Uji Kompetensi', NULL, 0, CAST(N'2021-08-03T11:02:16.453' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (33, 5, N'Kualifikasi', 0, N'Uji Kompetensi', NULL, 0, CAST(N'2021-08-03T11:02:16.460' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (34, 1012, N'Kualifikasi', 1, N'Uji Kompetensi', CAST(N'2021-08-05T11:02:00.000' AS DateTime), 1, CAST(N'2021-08-03T11:02:16.467' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (35, 1013, N'Kualifikasi', 0, N'Uji Kompetensi', NULL, 0, CAST(N'2021-08-03T11:02:16.477' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (36, 1014, N'Kualifikasi', 1, N'Uji Kompetensi', CAST(N'2021-08-28T11:02:00.000' AS DateTime), 1, CAST(N'2021-08-03T11:02:16.483' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (37, 1, N'Uji Kompetensi', 1, N'Wawancara', CAST(N'2021-08-04T11:05:00.000' AS DateTime), 1, CAST(N'2021-08-03T11:05:48.017' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (38, 1012, N'Uji Kompetensi', 1, N'Wawancara', CAST(N'2021-08-04T11:05:00.000' AS DateTime), 1, CAST(N'2021-08-03T11:06:01.133' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (39, 1014, N'Uji Kompetensi', 0, NULL, NULL, 0, CAST(N'2021-08-03T11:06:07.880' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (40, 1, N'Wawancara', 1, N'-', NULL, 0, CAST(N'2021-08-03T11:07:26.343' AS DateTime))
INSERT [dbo].[Notifikasi] ([id], [id_lamaran], [tahap], [hasil], [tahap_selanjutnya], [tanggal_tahapan], [terkonfirmasi], [created_date]) VALUES (41, 1012, N'Wawancara', 1, N'-', NULL, 0, CAST(N'2021-08-03T11:07:26.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notifikasi] OFF
GO
SET IDENTITY_INSERT [dbo].[Pelamar] ON 

INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (1, CAST(N'2000-06-25' AS Date), N'L', N'Ponorogo', N'Trisono', N'082380535032', NULL, NULL, 6, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (2, CAST(N'2001-06-24' AS Date), N'L', N'Jakarta', N'Kp. Rambutan', N'083647364736', NULL, NULL, 7, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (3, CAST(N'2001-06-01' AS Date), N'P', N'Jakarta', N'Jaksel', N'089392788438', NULL, NULL, 8, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (4, CAST(N'2001-02-25' AS Date), N'P', N'Bekasi', N'Jatiasih', N'089274848738', NULL, NULL, 9, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (5, CAST(N'2001-03-25' AS Date), N'L', N'Sukabumi', N'Sb', N'082322434545', NULL, NULL, 10, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (6, CAST(N'2001-06-06' AS Date), N'L', N'Jakarta', N'Cilincing', N'084734873874', NULL, NULL, 16, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (7, CAST(N'2002-06-25' AS Date), N'P', N'Bekasi', N'Bk', N'089483748374', NULL, NULL, 17, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (8, CAST(N'2001-11-25' AS Date), N'P', N'Nganjuk', N'ng', N'082323248888', NULL, NULL, 18, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (9, CAST(N'2001-12-25' AS Date), N'P', N'Bekasi', N'Bk', N'089323289483', NULL, NULL, 19, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (10, CAST(N'2001-06-14' AS Date), N'P', N'Surabaya', N'Sby', N'089284772637', NULL, NULL, 20, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (11, CAST(N'2000-02-02' AS Date), N'L', N'Bekasi', N'Bk', N'083928392732', NULL, NULL, NULL, 0)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (12, CAST(N'1999-07-06' AS Date), N'L', N'Bandung', N'Jl Pegangsaan', N'081263516239', N'<p>Berattitude baik dan semangat kerja tinggi</p>', N'260721-030157-457.pdf', 2025, 1)
INSERT [dbo].[Pelamar] ([id], [tanggal_lahir], [jenis_kelamin], [kota], [alamat], [no_telepon], [headline], [dokumen_cv], [id_user_login], [row_status]) VALUES (13, CAST(N'2001-07-11' AS Date), N'L', N'Bandung', N'Jl Pegangsaan', N'0867123873', N'<p>Berattitude baik dan semangat kerja tinggi</p>', N'270721-012715-809.sql', 2027, 1)
SET IDENTITY_INSERT [dbo].[Pelamar] OFF
GO
SET IDENTITY_INSERT [dbo].[Pendidikan] ON 

INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (1, 1, 5, N'Sistem Informasi', N'Politeknik Astra', N'2015', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (2, 1, 7, N'Teknik Informatika', N'Universitas Binus', N'2019', N'2021', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (3, 1, 8, N'Teknik Informatika', N'Universitas Indonesia', N'2022', N'2025', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (4, 1, 8, N'Teknik Informatika', N'Universitas Binus', N'2022', N'2025', 0)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (5, 1, 5, N'Sistem Informasi', N'Politeknik Negeri Jakarta', N'2015', N'2018', 0)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (6, 2, 3, N'Ilmu Komputer', N'Universitas Indonesia', N'2018', N'2020', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (7, 2, 4, N'Manajemen Informatika', N'Politeknik Sriwijaya', N'2017', N'2021', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (8, 2, 3, N'Ilmu Komputer', N'Universitas Mercubuana', N'2015', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (9, 2, 4, N'Sistem Informasi', N'Politeknik Negeri Jakarta', N'2014', N'2017', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (10, 2, 3, N'Ilmu Komputer', N'Universitas Mercubuana', N'2018', N'2020', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (11, 3, 3, N'Sistem Informasi', N'Universitas Indonesia', N'2016', N'2020', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (12, 3, 4, N'Manajemen Informatika', N'Politeknik Negeri Jakarta', N'2015', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (15, 4, 3, N'RPL', N'SMKN 1 Ponorogo', N'2016', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (16, 5, 3, N'Akuntansi', N'SMKN 1 Madiun', N'2016', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (17, 6, 3, N'IPA', N'SMAN 1 Jakarta', N'2016', N'2019', 1)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (18, 7, 4, N'IPA', N'MAN 2 Bekasi', N'2016', N'2019', NULL)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (19, 1, 3, N'asd', N'asdasd', N'2019', N'2020', 0)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (20, 12, 6, N'Sistem Informasi', N'Universitas Bina Nusantara', N'2017', N'2021', 0)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (21, 13, 4, N'IPS', N'SMA 5 ', N'2016', N'2019', 0)
INSERT [dbo].[Pendidikan] ([id], [id_pelamar], [id_jenjang], [nama_jurusan], [nama_universitas], [tahun_mulai], [tahun_selesai], [row_status]) VALUES (22, 13, 7, N'Sistem Informasi', N'Binus', N'2017', N'2020', 1)
SET IDENTITY_INSERT [dbo].[Pendidikan] OFF
GO
SET IDENTITY_INSERT [dbo].[Pengalaman] ON 

INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (1, 1, 1, 2, N'BlueBird Indonesian', CAST(N'2021-06-22' AS Date), CAST(N'2021-08-17' AS Date), NULL, NULL, 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (2, 1, 6, 1, N'Google Indonesia', CAST(N'2021-08-22' AS Date), CAST(N'2021-10-22' AS Date), NULL, NULL, 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (3, 1, 1, 3, N'GOJEK', CAST(N'2021-06-24' AS Date), CAST(N'2021-06-25' AS Date), NULL, NULL, 1)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (4, 1, 1, 1, N'BlueBird Indonesian', CAST(N'2021-06-23' AS Date), CAST(N'2021-06-23' AS Date), NULL, NULL, 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (5, 4, 3, 4, N'AstraLife', CAST(N'2018-02-02' AS Date), CAST(N'2020-02-02' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (6, 5, 3, 1, N'Astra Internasional', CAST(N'2019-01-01' AS Date), CAST(N'2021-01-01' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (7, 6, 2, 1, N'PT Paros Indonesia', CAST(N'2018-03-02' AS Date), CAST(N'2021-02-03' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (8, 7, 1, 4, N'PT United Tractor', CAST(N'2019-03-02' AS Date), CAST(N'2021-03-02' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (9, 8, 2, 2, N'PT Persero Indonesia', CAST(N'2018-01-03' AS Date), CAST(N'2020-01-03' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (10, 9, 4, 2, N'PT Awi Cikarang', CAST(N'2019-02-02' AS Date), CAST(N'2021-02-02' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (11, 10, 2, 1, N'PT Sentosa Berjaya', CAST(N'2017-09-09' AS Date), CAST(N'2020-09-09' AS Date), NULL, N'default.jpg', 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (12, 1, 7, 1, N'Traveloka', CAST(N'2021-09-21' AS Date), CAST(N'2021-11-30' AS Date), N'asd', N'210721-111519-245.pdf', 1)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (13, 1, 2, 3, N'Tokopedia', CAST(N'2021-07-13' AS Date), CAST(N'2021-07-31' AS Date), N'asd', NULL, 1)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (14, 12, 10, 4, N'Samsan Tech', CAST(N'2021-07-12' AS Date), CAST(N'2021-07-29' AS Date), N'', NULL, 0)
INSERT [dbo].[Pengalaman] ([id], [id_pelamar], [id_jabatan], [id_jenis_pegawai], [nama_perusahaan], [mulai_kerja], [terakhir_kerja], [deskripsi], [file_attachment], [row_status]) VALUES (15, 13, 10, 4, N'Samsan Tech', CAST(N'2021-07-05' AS Date), CAST(N'2021-07-31' AS Date), N'', NULL, 0)
SET IDENTITY_INSERT [dbo].[Pengalaman] OFF
GO
SET IDENTITY_INSERT [dbo].[Perusahaan] ON 

INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (1, N'Tokopedia', N'Jl. Dummyasd', N'Jakarta', N'Jakarta Utara', 1, N'tokopedia-2021.png', N'IT', 0, 11)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (2, N'PT Astra Graphia Information Technology', N'Jl. Dummy', N'Jakarta', N'Jakarta Utara', 1, N'agit-2021.png', N'Computer Networking', 0, 12)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (3, N'Babel Farma', N'Jl. Simatupang', N'Jawa Barat', N'Bekasi', 1, N'default-company.png', N'Properti', 0, 13)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (4, N'Astra Life', N'Jl. Kebayoran Lama III', N'Jawa Barat', N'Tambun', 0, N'astralife-2021.png', N'Kosmetik', -1, 14)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (5, N'Ciputat Green', N'Jl. Kembalilah', N'Jawa Barat', N'Cikarang', 0, N'default-company.png', N'Farmasi', -1, 15)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (6, N'Weezly', N'Jl. Pulang', N'Jawa Barat', N'Karawang', 0, N'default-company.png', N'Makanan', 0, 19)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (7, N'Growithu', N'Jl. Kenangan 2', N'Jawa Barat', N'Serang', 0, N'default-company.png', N'Makanan Ringan', 0, 20)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (8, N'Samsan Tech', N'Jl. samundong', N'Jawa Barat', N'Tangerang Selatan', 0, N'default-company.png', N'Minuman ', 0, 21)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (9, N'Ajaib', N'Jl. Prada', N'Jawa Barat', N'Bogor', 0, N'ajaib-2021.png', N'Investasi', 0, 26)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (10, N'Toho Animation', N'Jl. Ciputat Raya', N'Jawa Barat', N'Depok', 0, N'default-company.png', N'IT', 0, 18)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (1011, NULL, N'Jl. Sudirman 1', N'DKI Jakarta', N'Jakarta Utara', 0, NULL, N'Makanan', 1, 2024)
INSERT [dbo].[Perusahaan] ([id], [nama_perusahaan], [alamat_lengkap], [provinsi], [kota], [telah_terverifikasi], [foto_profil], [bidang_perusahaan], [row_status], [id_user_login]) VALUES (1012, NULL, N'Jl. Sudirman 1', N'Jawa Barat', N'Bandung', 0, NULL, N'Makanan', 1, 2026)
SET IDENTITY_INSERT [dbo].[Perusahaan] OFF
GO
SET IDENTITY_INSERT [dbo].[Pesan] ON 

INSERT [dbo].[Pesan] ([id], [pengirim_satu], [pengirim_dua], [pesan_terakhir]) VALUES (1, 6, 11, N'Halo')
INSERT [dbo].[Pesan] ([id], [pengirim_satu], [pengirim_dua], [pesan_terakhir]) VALUES (2, 7, 11, N'Halo 2')
INSERT [dbo].[Pesan] ([id], [pengirim_satu], [pengirim_dua], [pesan_terakhir]) VALUES (3, 8, 11, N'Halo 3')
INSERT [dbo].[Pesan] ([id], [pengirim_satu], [pengirim_dua], [pesan_terakhir]) VALUES (4, 9, 11, N'Halo 4')
SET IDENTITY_INSERT [dbo].[Pesan] OFF
GO
SET IDENTITY_INSERT [dbo].[Sertifikat] ON 

INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (1, 1, N'Fundamental Programming Beginner 1', N'2001-2021', CAST(N'2014-06-18' AS Date), CAST(N'2018-06-18' AS Date), N'fsdfdsfdsgdgdfgfg', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (2, 1, N'Fundamental Programming Beginner', N'213123', CAST(N'2014-06-18' AS Date), CAST(N'2018-06-18' AS Date), N'123', 1)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (3, 1, N'Fundamental Programming Expertz', N'1431-1233e343', CAST(N'2021-06-23' AS Date), CAST(N'2024-06-23' AS Date), N'asddsfdsgdfgdf', 1)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (4, 2, N'Fundamental Programming Expertfd', N'2001-2021', CAST(N'2021-06-23' AS Date), CAST(N'2021-06-23' AS Date), N'asddsfdsgdfgdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (5, 2, N'Fundamental Programming Beginner', N'1431-1233e87h', CAST(N'2021-06-08' AS Date), CAST(N'2024-06-08' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (6, 2, N'Fundamental Programming Beginner', N'1283-1233e398', CAST(N'2021-08-03' AS Date), CAST(N'2024-08-03' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (7, 3, N'Fundamental Programming Beginner', N'1452-1233e343', CAST(N'2021-05-09' AS Date), CAST(N'2024-05-09' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (8, 3, N'Fundamental Programming Beginner', N'1431-1233e312', CAST(N'2021-01-08' AS Date), CAST(N'2024-01-08' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (9, 3, N'Fundamental Programming Expert', N'1878-1233e347', CAST(N'2021-06-08' AS Date), CAST(N'2024-06-08' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (10, 4, N'Fundamental Programming Beginner', N'1772-1233e343', CAST(N'2021-04-09' AS Date), CAST(N'2024-04-09' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (11, 4, N'Fundamental Programming Beginner', N'1088-1233e399', CAST(N'2021-05-11' AS Date), CAST(N'2024-05-11' AS Date), N'070721-025255-333.pdf', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (1001, 1, N'Fundamental Android', N'017238712398', CAST(N'2021-07-27' AS Date), CAST(N'2021-07-29' AS Date), N'asdasd', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (1002, 12, N'Basical Programming Learner', N'8123718236', CAST(N'2021-07-05' AS Date), CAST(N'2021-07-25' AS Date), N'https://www.youtube2.com/', 0)
INSERT [dbo].[Sertifikat] ([id], [id_pelamar], [judul], [no_sertifikat], [berlaku_mulai], [berlaku_sampai], [file_attachment], [row_status]) VALUES (1003, 13, N'Programming Expert', N'561723123', CAST(N'2021-07-13' AS Date), CAST(N'2021-07-31' AS Date), N'https://web.facebook.com/?_rdc=1&_rdr', 0)
SET IDENTITY_INSERT [dbo].[Sertifikat] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (1, N'M. Rifqy Herdiyanto', N'muhrifh@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 1, 1, N'270721-011449-363.jpg')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (2, N'M. Ivan Firman', N'ivanmansyah@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (3, N'Rafli Mayori', N'rafli.mayori@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (4, N'Natasya', N'natasya@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (5, N'Suwandi', N'suwandi@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (6, N'Samodra', N'samodra.me@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 1, 1, N'240721-083233-456.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (7, N'Satria Adjie', N'satria.adjie@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (8, N'Salsabila Khroinsin', N'salsabila@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (9, N'Fayza Nurrahmi', N'fayza.nur@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (10, N'Fikri Adriansyah', N'fikri.adr@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 1, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (11, N'Tokopedia', N'hrd@tokopedia.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 1, N'tokopedia-2021.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (12, N'Agit', N'hrd@agit.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (13, N'Babel Farma', N'hrd@babel.farma.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (14, N'Astra Life', N'hrd@astra.life.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (15, N'Ciputat Green', N'hrd@ciputat.grn.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 0, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (16, N'Fio', N'fio@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 0, 0, 0, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (17, N'Firda', N'firda@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 1, 0, 0, 1, N'default-employee.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (18, N'Toho Animation', N'toho@toho.co', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 0, 0, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (19, N'Weezly', N'weezly@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 0, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (20, N'Growithu', N'growithu@gmail.com', N'$2a$10$vndr1mFEcSArOlsOiZhVteMBcTgfVSPjeMpvbuE2T4vglTn7bEleK', 2, 0, 1, 0, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (21, N'Dummy Perusahaan', N'hrd@perusahaan', N'$2a$10$NJuh2sWARqeU.Mu95SryB.TlYj0ILN9TO6hQW5wzY5wU/YkvGn92i', 2, 0, 0, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (26, N'Rudi Alamsyah', N'hijikatato23@gmail.com', N'$2a$10$A2nikAsEn.UQGGsCM.JJGejhWs8K4hi3XQLTdLRAXgYLiogIhneSm', 2, 0, 0, 1, N'default-company.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (2024, N'Indosat', N'hrd@indosat.com', N'$2a$10$t3F2cd9dmsymMdwrKQlouuKBEkOIgil7LoAWmOtBExp.JRkaFM.Z.', 2, 0, 1, 1, N'260721-024356-465.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (2025, N'Ardina Pratami', N'ardina@gmail.com', N'$2a$10$FSoBBfwkjHDiFIXq2Q5Gy.B/fdUgQ3H7oG2xd6HGzqui0K2pc4/vm', 1, 0, 1, 1, N'260721-025927-036.png')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (2026, N'Indofood', N'samodra30@gmail.com', N'$2a$10$f5.pgj2ACvnIbTXbuROB9OvccNKX9GQdbEjT67ZxZC2Ti40Vx9RB.', 2, 0, 1, 1, N'270721-011931-807.jpg')
INSERT [dbo].[UserLogin] ([id], [nama], [email], [password], [user_role], [locked], [enabled], [row_status], [foto_profil]) VALUES (2027, N'Ardhito Pranomo', N'szsamodra@gmail.com', N'$2a$10$ap.VT5oMyv9hTCVmJvwh6.iuKNK4bVhT8Kv9RKH5dgJX.Z311fVhq', 1, 0, 1, 1, N'270721-012632-006.jpg')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[VerifikasiPerusahaan] ON 

INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (1, 1, N'01.855.081.4-412.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (2, 2, N'02.155.081.4-409.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (3, 3, N'01.355.091.2-214.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (4, 4, N'03.435.081.1-416.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (5, 5, N'01.985.281.3-112.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 2, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Dokumen tidak memenuhi')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (6, 6, N'01.125.131.4-552.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-12-07' AS Date), CAST(N'2021-12-07' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (7, 7, N'02.345.081.2-332.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (8, 8, N'01.335.081.3-412.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date), N'M. Rifqy Herdiyanto', N'')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (9, 9, N'02.675.081.4-420.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (10, 10, N'03.985.121.4-322.000', N'070721-025255-333.pdf', N'070721-025255-333.pdf', 1, CAST(N'2021-07-13' AS Date), CAST(N'2021-07-13' AS Date), N'Mochammad Rifqy', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (2001, 1011, N'123812381623', N'260721-024741-991.sql', N'260721-024741-971.sql', 1, CAST(N'2021-07-26' AS Date), CAST(N'2021-07-26' AS Date), N'M. Rifqy Herdiyanto', N'Sudah baik')
INSERT [dbo].[VerifikasiPerusahaan] ([id], [id_perusahaan], [npwp], [tdp], [siu], [hasil], [created_date], [last_modified], [diverifikasi_oleh], [komentar]) VALUES (2002, 1012, N'981236786', N'270721-012031-796.sql', N'270721-012031-788.sql', 1, CAST(N'2021-07-27' AS Date), CAST(N'2021-07-27' AS Date), N'M. Rifqy Herdiyanto', N'Sudah baik')
SET IDENTITY_INSERT [dbo].[VerifikasiPerusahaan] OFF
GO
ALTER TABLE [dbo].[Notifikasi] ADD  CONSTRAINT [DF_Notifikasi_terkonfirmasi]  DEFAULT ((0)) FOR [terkonfirmasi]
GO
ALTER TABLE [dbo].[Pengalaman] ADD  CONSTRAINT [DF_Pengalaman_file_attachment]  DEFAULT ('default.jpg') FOR [file_attachment]
GO
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [DF_UserLogin_status]  DEFAULT ((1)) FOR [row_status]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_UserLogin] FOREIGN KEY([id_user_login])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_UserLogin]
GO
ALTER TABLE [dbo].[ConfirmationToken]  WITH CHECK ADD  CONSTRAINT [FK_ConfirmationToken_UserLogin] FOREIGN KEY([id_user])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[ConfirmationToken] CHECK CONSTRAINT [FK_ConfirmationToken_UserLogin]
GO
ALTER TABLE [dbo].[Lamaran]  WITH CHECK ADD  CONSTRAINT [FK_Lamaran_Lowongan] FOREIGN KEY([id_lowongan])
REFERENCES [dbo].[Lowongan] ([id])
GO
ALTER TABLE [dbo].[Lamaran] CHECK CONSTRAINT [FK_Lamaran_Lowongan]
GO
ALTER TABLE [dbo].[Lamaran]  WITH CHECK ADD  CONSTRAINT [FK_Lamaran_Pelamar] FOREIGN KEY([id_pelamar])
REFERENCES [dbo].[Pelamar] ([id])
GO
ALTER TABLE [dbo].[Lamaran] CHECK CONSTRAINT [FK_Lamaran_Pelamar]
GO
ALTER TABLE [dbo].[Lowongan]  WITH CHECK ADD  CONSTRAINT [FK_Lowongan_JenisPegawai] FOREIGN KEY([id_jenis_pegawai])
REFERENCES [dbo].[JenisPegawai] ([id])
GO
ALTER TABLE [dbo].[Lowongan] CHECK CONSTRAINT [FK_Lowongan_JenisPegawai]
GO
ALTER TABLE [dbo].[Lowongan]  WITH CHECK ADD  CONSTRAINT [FK_Lowongan_Perusahaan] FOREIGN KEY([id_perusahaan])
REFERENCES [dbo].[Perusahaan] ([id])
GO
ALTER TABLE [dbo].[Lowongan] CHECK CONSTRAINT [FK_Lowongan_Perusahaan]
GO
ALTER TABLE [dbo].[Notifikasi]  WITH CHECK ADD  CONSTRAINT [FK_Notifikasi_Lamaran] FOREIGN KEY([id_lamaran])
REFERENCES [dbo].[Lamaran] ([id])
GO
ALTER TABLE [dbo].[Notifikasi] CHECK CONSTRAINT [FK_Notifikasi_Lamaran]
GO
ALTER TABLE [dbo].[Pelamar]  WITH CHECK ADD  CONSTRAINT [FK_Pelamar_UserLogin] FOREIGN KEY([id_user_login])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[Pelamar] CHECK CONSTRAINT [FK_Pelamar_UserLogin]
GO
ALTER TABLE [dbo].[Pendidikan]  WITH CHECK ADD  CONSTRAINT [FK_Pendidikan_Jenjang] FOREIGN KEY([id_jenjang])
REFERENCES [dbo].[Jenjang] ([id])
GO
ALTER TABLE [dbo].[Pendidikan] CHECK CONSTRAINT [FK_Pendidikan_Jenjang]
GO
ALTER TABLE [dbo].[Pendidikan]  WITH CHECK ADD  CONSTRAINT [FK_Pendidikan_Pelamar] FOREIGN KEY([id_pelamar])
REFERENCES [dbo].[Pelamar] ([id])
GO
ALTER TABLE [dbo].[Pendidikan] CHECK CONSTRAINT [FK_Pendidikan_Pelamar]
GO
ALTER TABLE [dbo].[Pengalaman]  WITH CHECK ADD  CONSTRAINT [FK_Pengalaman_Jabatan] FOREIGN KEY([id_jabatan])
REFERENCES [dbo].[Jabatan] ([id])
GO
ALTER TABLE [dbo].[Pengalaman] CHECK CONSTRAINT [FK_Pengalaman_Jabatan]
GO
ALTER TABLE [dbo].[Pengalaman]  WITH CHECK ADD  CONSTRAINT [FK_Pengalaman_JenisPegawai] FOREIGN KEY([id_jenis_pegawai])
REFERENCES [dbo].[JenisPegawai] ([id])
GO
ALTER TABLE [dbo].[Pengalaman] CHECK CONSTRAINT [FK_Pengalaman_JenisPegawai]
GO
ALTER TABLE [dbo].[Pengalaman]  WITH CHECK ADD  CONSTRAINT [FK_Pengalaman_Pelamar] FOREIGN KEY([id_pelamar])
REFERENCES [dbo].[Pelamar] ([id])
GO
ALTER TABLE [dbo].[Pengalaman] CHECK CONSTRAINT [FK_Pengalaman_Pelamar]
GO
ALTER TABLE [dbo].[Perusahaan]  WITH CHECK ADD  CONSTRAINT [FK_Perusahaan_UserLogin] FOREIGN KEY([id_user_login])
REFERENCES [dbo].[UserLogin] ([id])
GO
ALTER TABLE [dbo].[Perusahaan] CHECK CONSTRAINT [FK_Perusahaan_UserLogin]
GO
ALTER TABLE [dbo].[Sertifikat]  WITH CHECK ADD  CONSTRAINT [FK_Sertifikat_Pelamar] FOREIGN KEY([id_pelamar])
REFERENCES [dbo].[Pelamar] ([id])
GO
ALTER TABLE [dbo].[Sertifikat] CHECK CONSTRAINT [FK_Sertifikat_Pelamar]
GO
ALTER TABLE [dbo].[VerifikasiPerusahaan]  WITH CHECK ADD  CONSTRAINT [FK_VerifikasiPerusahaan_Perusahaan] FOREIGN KEY([id_perusahaan])
REFERENCES [dbo].[Perusahaan] ([id])
GO
ALTER TABLE [dbo].[VerifikasiPerusahaan] CHECK CONSTRAINT [FK_VerifikasiPerusahaan_Perusahaan]
GO
/****** Object:  StoredProcedure [dbo].[eliminatePelamarByNilaiUjikom]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminatePelamarByNilaiUjikom]
@IdLowongan int,
@NilaiUjikom float
AS
UPDATE Lamaran SET status_lamaran = 3 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND nilai_uji_kompetensi < @NilaiUjikom AND status_lamaran = 2)
UPDATE Lamaran SET status_lamaran = 4 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND nilai_uji_kompetensi > @NilaiUjikom AND status_lamaran = 2)
GO
/****** Object:  StoredProcedure [dbo].[eliminatePelamarByNilaiWawancara]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminatePelamarByNilaiWawancara]
@IdLowongan int,
@NilaiWawancara float
AS
UPDATE Lamaran SET status_lamaran = 5 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND nilai_wawancara < @NilaiWawancara AND status_lamaran = 4)
UPDATE Lamaran SET status_lamaran = 6 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND nilai_wawancara > @NilaiWawancara AND status_lamaran = 4)
GO
/****** Object:  StoredProcedure [dbo].[eliminatePelamarByPendidikan]    Script Date: 8/3/2021 1:01:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminatePelamarByPendidikan] @IdLowongan int
AS
UPDATE Lamaran SET status_lamaran = 1 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND tingkatan_jenjang < jenjang_minimal AND status_lamaran = 0)
UPDATE Lamaran SET status_lamaran = 2 WHERE id IN (
            SELECT id_lamaran FROM view_LamaranPelamar WHERE id_lowongan = @IdLowongan AND tingkatan_jenjang > jenjang_minimal AND status_lamaran = 0)
GO
USE [master]
GO
ALTER DATABASE [Adagawe] SET  READ_WRITE 
GO
