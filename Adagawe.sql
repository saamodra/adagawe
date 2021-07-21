USE [master]
GO
/****** Object:  Database [Adagawe]    Script Date: 7/21/2021 12:14:29 PM ******/
CREATE DATABASE [Adagawe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Adagawe', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Adagawe_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Adagawe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
ALTER DATABASE [Adagawe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Adagawe] SET QUERY_STORE = OFF
GO
USE [Adagawe]
GO
/****** Object:  Table [dbo].[Lamaran]    Script Date: 7/21/2021 12:14:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pendidikan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jenjang]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelamar]    Script Date: 7/21/2021 12:14:30 PM ******/
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
	[headline] [varchar](100) NULL,
	[dokumen_cv] [varchar](100) NULL,
	[id_user_login] [int] NULL,
	[row_status] [int] NULL,
 CONSTRAINT [PK_Pelamar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lowongan]    Script Date: 7/21/2021 12:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lowongan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_perusahaan] [int] NULL,
	[id_jenis_pegawai] [int] NULL,
	[judul_lowongan] [varchar](100) NULL,
	[keterangan] [varchar](255) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_LamaranPelamar]    Script Date: 7/21/2021 12:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_LamaranPelamar]
AS
SELECT        l.id AS id_lamaran, l.status_lamaran, l.id_lowongan, lo.jenjang_minimal, l.id_pelamar, p.nama_pelamar, p.tanggal_lahir, p.jenis_kelamin, p.kota, p.alamat, p.no_telepon, p.headline, p.dokumen_cv, p.id_user_login, p.foto_profil, 
                         p.row_status, pt.pendidikan_terakhir, pt.tingkatan_jenjang, CAST(DATEDIFF(DD, p.tanggal_lahir, GETDATE()) / 365.25 AS INT) AS umur, l.nilai_uji_kompetensi, l.nilai_wawancara
FROM            dbo.Lamaran AS l INNER JOIN
                         dbo.Pelamar AS p ON l.id_pelamar = p.id INNER JOIN
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
/****** Object:  Table [dbo].[Admin]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfirmationToken]    Script Date: 7/21/2021 12:14:30 PM ******/
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
/****** Object:  Table [dbo].[Jabatan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JenisPegawai]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifikasi]    Script Date: 7/21/2021 12:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifikasi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_lamaran] [int] NULL,
	[isi] [text] NOT NULL,
	[tahap] [int] NOT NULL,
	[tanggal_tahapan] [datetime] NOT NULL,
	[hasil_tahap_sebelumnya] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Notifikasi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pengalaman]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Percakapan]    Script Date: 7/21/2021 12:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Percakapan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pesan] [int] NULL,
	[isi_pesan] [text] NULL,
	[dilihat] [text] NULL,
	[create_time] [int] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Percakapan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perusahaan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pesan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sertifikat]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerifikasiPerusahaan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pengalaman] ADD  CONSTRAINT [DF_Pengalaman_file_attachment]  DEFAULT ('default.jpg') FOR [file_attachment]
GO
ALTER TABLE [dbo].[UserLogin] ADD  CONSTRAINT [DF_UserLogin_status]  DEFAULT ((1)) FOR [row_status]
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
/****** Object:  StoredProcedure [dbo].[eliminatePelamarByPendidikan]    Script Date: 7/21/2021 12:14:30 PM ******/
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
