USE QuanLyKhuVuiChoi
GO
CREATE PROC Them_ThietBi (@MaTB VARCHAR(10),@TenTB NVARCHAR(30),@NgayBD DATE,@MaTC VARCHAR(10))
AS
BEGIN
	INSERT INTO dbo.ThietBi( Ma_TB, Ten_TB, Ngay_BD, Ma_TroChoi )
	VALUES  (@MaTB,@TenTB,@NgayBD,@MaTC)
END
GO
CREATE PROC Sua_ThietBi (@MaTB VARCHAR(10),@TenTB NVARCHAR(30),@NgayBD DATE,@MaTC VARCHAR(10))
AS
BEGIN
	UPDATE dbo.ThietBi
	SET Ten_TB = @TenTB,Ngay_BD = @NgayBD ,Ma_TroChoi = @MaTC
	WHERE Ma_TB = @MaTB
END
GO
CREATE PROC Xoa_ThietBi (@Ma VARCHAR(10))
AS
BEGIN
	DELETE dbo.ThietBi WHERE Ma_TB = @Ma
END
GO
CREATE PROC ThietBi_SelectAll
AS
BEGIN
	SELECT * FROM dbo.ThietBi
END
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
CREATE PROC TroChoi_SelectAll
AS
BEGIN
	SELECT * FROM dbo.TroChoi
END
CREATE PROC KhuVuc_SelectAll
AS
BEGIN
	SELECT * FROM dbo.KhuVuc
END
CREATE PROC VeChoi_SelectAll
AS
BEGIN
	SELECT * FROM dbo.VeChoi
END
CREATE PROC Them_VeChoi (@MaVe varchar(10),@MaKH VARCHAR(10),@TongTien int ,@MaKhu VARCHAR(10),@SoVeNL INT,@SoVeTE INT,@NgayBan DATE) 
AS
BEGIN
	INSERT INTO dbo.VeChoi
	        ( Ma_Ve ,
	          So_VeNL ,
	          So_VeTE ,
	          Ngay_Ban ,
	          Tong_Tien ,
	          Ma_KH ,
	          Ma_Khu
	        )
	VALUES  (@MaVe,@SoVeNL,@SoVeTE,@NgayBan,@TongTien,@MaKH,@MaKhu)
END
CREATE PROC Sua_VeChoi (@MaVe varchar(10),@MaKH VARCHAR(10),@TongTien int ,@MaKhu VARCHAR(10),@SoVeNL INT,@SoVeTE INT,@NgayBan DATE) 
AS
BEGIN
	UPDATE dbo.VeChoi SET So_VeNL = @SoVeNL,So_VeTE = @SoVeTE ,Ngay_Ban = @NgayBan,Tong_Tien = @TongTien ,Ma_KH = @MaKH,Ma_Khu = @MaKHu
	WHERE Ma_Ve = @MaVe
END
CREATE PROC Xoa_VeChoi(@Ma varchar(10))
AS
BEGIN
	DELETE dbo.VeChoi 
	WHERE Ma_Ve = @Ma
END
