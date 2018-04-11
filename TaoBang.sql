CREATE DATABASE QuanLyKhuVuiChoi
go
USE QuanLyKhuVuiChoi
go
CREATE TABLE KhuVuc
(
Ma_Khu VARCHAR(10) PRIMARY KEY,
Ten_Khu NVARCHAR(50),
Ma_TruongKhu VARCHAR(10),
Chuc_Nang NVARCHAR(30),
Vi_Tri NVARCHAR(30),
Gia_NL INT,
Gia_TE INT
)
GO
CREATE TABLE KhachHang
(
Ma_KH VARCHAR(10) PRIMARY KEY,
Ten_KH NVARCHAR(50),
Nam_Sinh  INT,
Gioi_Tinh NvarCHAR(4) CHECK(Gioi_Tinh IN (N'Nam',N'Nữ')),
SDT VARCHAR(15)
)
CREATE TABLE NhanVien 
(
Ma_NV VARCHAR(10) PRIMARY KEY,
Ten_NV NVARCHAR(50),
Ma_Khu VARCHAR(10) REFERENCES dbo.KhuVuc(Ma_Khu),
Gioi_Tinh NVARCHAR(4) CHECK(Gioi_Tinh IN (N'Nam',N'Nữ')),
Ngay_Sinh Date,
DiaChi  nvarchar(50),
Luong  INT
)
CREATE TABLE VeChoi
(
Ma_Ve VARCHAR(10) PRIMARY KEY,
So_VeNL INT,
So_VeTE INT,
Ngay_Ban DATE,
Tong_Tien INT,
Ma_KH VARCHAR(10) REFERENCES dbo.KhachHang(Ma_KH),
Ma_Khu VARCHAR(10) REFERENCES dbo.KhuVuc(Ma_Khu)
)
CREATE TABLE TroChoi
(
Ma_TroChoi VARCHAR(10) PRIMARY KEY,
Ten_TroChoi NVARCHAR(50),
Ma_Khu VARCHAR(10) REFERENCES dbo.KhuVuc(Ma_Khu)
)
CREATE TABLE ThietBi
 (
Ma_TB VARCHAR(10) PRIMARY KEY,
Ten_TB NVARCHAR(50),
Ngay_BD DATE,
Ma_TroChoi VARCHAR(10) REFERENCES dbo.TroChoi (Ma_TroChoi)
)
CREATE TABLE DichVu
 (
Ma_DV VARCHAR(10) PRIMARY KEY,
Ten_DV NVARCHAR(50),
Gia_DV INT,
Ma_Khu VARCHAR(10) REFERENCES dbo.KhuVuc(Ma_Khu)
)
CREATE TABLE PhieuMua
(
Ma_Phieu VARCHAR(10) PRIMARY KEY,
Ngay_Mua DATE,
Ma_KH VARCHAR(10) REFERENCES dbo.KhachHang(Ma_KH)
)
CREATE TABLE ChiTietPhieuMua 
(
Ma_Phieu VARCHAR(10),
Ma_DV VARCHAR(10),
SoLuong   INT,
DonGia     INT,
ThanhTien   INT,
CONSTRAINT PC_SoPhieu_MaDV_PK PRIMARY KEY (Ma_Phieu,Ma_DV),
CONSTRAINT PC_MADV_FK FOREIGN KEY(Ma_DV) REFERENCES DichVu(Ma_DV),
CONSTRAINT PC_SoPhieu_FK FOREIGN KEY (Ma_Phieu) REFERENCES dbo.PhieuMua(Ma_Phieu) 
)
GO 
CREATE PROC Them_TroChoi (@MaTC VARCHAR(10),@TenTC NVARCHAR(30),@MaKhu VARCHAR(10))
AS
BEGIN
	INSERT INTO dbo.TroChoi
	        ( Ma_TroChoi, Ten_TroChoi, Ma_Khu )
	VALUES  (@MaTC,@TenTC,@MaKhu)
END
GO
CREATE PROC Sua_TroChoi (@MaTC VARCHAR(10),@TenTC NVARCHAR(30),@MaKhu VARCHAR(10))
AS
BEGIN
	UPDATE dbo.TroChoi
	SET Ten_TroChoi = @TenTC,Ma_Khu = @MaKhu
	WHERE Ma_TroChoi = @MaTC
END
GO
CREATE PROC Xoa_TroChoi (@Ma VARCHAR(10))
AS
BEGIN
	DELETE dbo.TroChoi WHERE Ma_TroChoi = @Ma
END
GO
 CREATE PROC Them_Khu (@MaKhu VARCHAR(10),@TenKhu NVARCHAR(30),@MaTK VARCHAR(10), @ChucNang NVARCHAR(30),@ViTri NVARCHAR(30),@GiaNL INT,@GiaTE INT)
AS
BEGIN
	INSERT INTO dbo.KhuVuc 
	        ( Ma_Khu , Ten_Khu , Ma_TruongKhu ,Chuc_Nang , Vi_Tri , Gia_NL , Gia_TE      )
	VALUES  ( @MaKhu,@TenKhu,@MaTK,@ChucNang,@ViTri,@GiaNL,@GiaTE)
END
GO
CREATE PROC Sua_Khu (@MaKhu VARCHAR(10),@TenKhu NVARCHAR(30),@MaTK VARCHAR(10), @ChucNang NVARCHAR(30),@ViTri NVARCHAR(30),@GiaNL INT,@GiaTE INT)
AS
BEGIN
	UPDATE dbo.KhuVuc
	SET Ten_Khu = @TenKhu,Ma_TruongKhu = @MaTK,Chuc_Nang = @ChucNang,Vi_Tri = @ViTri,Gia_NL = @GiaNL,Gia_TE=@GiaTE
	WHERE Ma_Khu = @MaKhu
END
GO
CREATE PROC Xoa_Khu (@Ma VARCHAR(10))
AS
BEGIN
	DELETE dbo.KhuVuc WHERE Ma_Khu = @Ma
END
GO

 CREATE PROC Them_KhachHang (@MaKH VARCHAR(10),@TenKH NVARCHAR(30),@SDT VARCHAR(15), @GioiTinh NVARCHAR(5),@NamSinh INT)
AS
BEGIN
	INSERT INTO dbo.KhachHang
	        ( Ma_KH ,
	          Ten_KH ,
	          Nam_Sinh ,
	          Gioi_Tinh ,
	          SDT
	        )
	VALUES  (@MaKH,@TenKH,@NamSinh,@GioiTinh,@SDT ) 
END
GO
 CREATE PROC Sua_KhachHang (@MaKH VARCHAR(10),@TenKH NVARCHAR(30),@SDT VARCHAR(15), @GioiTinh NVARCHAR(5),@NamSinh INT)
 AS
 BEGIN
	UPDATE dbo.KhachHang
	SET Ten_KH = @TenKH,Nam_Sinh = @NamSinh,Gioi_Tinh =@GioiTinh,SDT= @SDT
	WHERE Ma_KH =@MaKH
 END

 GO
  CREATE PROC Xoa_KhachHang (@Ma VARCHAR(10))
AS
BEGIN
	DELETE dbo.KhachHang WHERE Ma_KH = @Ma
END
GO
 CREATE PROC Them_NhanVien (@MaNV VARCHAR(10),@TenNV NVARCHAR(30),@MaKhu VARCHAR(10), @GioiTinh NVARCHAR(5),@NgaySinh DATE,@DiaChi NVARCHAR(30),@Luong INT)
AS
BEGIN
	INSERT INTO dbo.NhanVien
	        ( Ma_NV ,
	          Ten_NV ,
	          Ma_Khu ,
	          Gioi_Tinh ,
	          Ngay_Sinh ,
	          DiaChi ,
	          Luong
	        )
	VALUES  (@MaNV,@TenNV,@MaKhu,@GioiTinh,@NgaySinh,@DiaChi,@Luong)
END
GO
 CREATE PROC Sua_NhanVien (@MaNV VARCHAR(10),@TenNV NVARCHAR(30),@MaKhu VARCHAR(10), @GioiTinh NVARCHAR(5),@NgaySinh DATE,@DiaChi NVARCHAR(30),@Luong INT)
 AS
 BEGIN
	UPDATE dbo.NhanVien
	SET Ten_NV = @TenNV,Ma_Khu =@MaKhu,Ngay_Sinh = @NgaySinh,Gioi_Tinh =@GioiTinh,DiaChi = @DiaChi,Luong =@Luong
	WHERE Ma_NV =@MaNV
 END

 GO
  CREATE PROC Xoa_NhanVien (@Ma VARCHAR(10))
AS
BEGIN
	DELETE dbo.NhanVien WHERE Ma_NV = @Ma
END
GO
CREATE PROC ThietBi_SelectAll
AS
BEGIN
	SELECT * FROM dbo.ThietBi
END
GO

CREATE PROC ThietBi_SelectID(@Ma varchar(10))
AS
BEGIN
	SELECT * FROM dbo.ThietBi WHERE Ma_TB = @Ma
END
