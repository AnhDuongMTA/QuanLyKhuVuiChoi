USE QuanLyKhuVuiChoi
GO
--Dịch Vụ--
CREATE PROC XemDV
AS
BEGIN
	SELECT * FROM dbo.DichVu
END

GO

CREATE PROC ThemDV (@madv VARCHAR(10),@tendv NVARCHAR(50),@giadv INT,@makhu VARCHAR(10))
AS
BEGIN
	INSERT dbo.DichVu
	        ( Ma_DV, Ten_DV, Gia_DV, Ma_Khu )
	VALUES  ( @madv,@tendv,@giadv,@makhu)
END
GO

CREATE PROC SuaDV (@madv VARCHAR(10),@tendv NVARCHAR(50),@giadv INT,@makhu VARCHAR(10))
AS
BEGIN
	UPDATE dbo.DichVu SET Ten_DV=@tendv,Gia_DV=@giadv,Ma_Khu=@makhu
	WHERE Ma_DV=@madv
END
 
GO
CREATE PROC XoaDV(@madv VARCHAR(10))
AS
BEGIN
	DELETE dbo.DichVu WHERE Ma_DV=@madv
END

--Phiếu Mua--
GO

ALTER PROC XemPM
AS
BEGIN
	SELECT * FROM PhieuMua
END

GO
ALTER PROC ThemPM(@maphieu VARCHAR(10),@ngaymua DATE,@makh VARCHAR(10))
AS
BEGIN
	INSERT PhieuMua(Ma_Phieu,Ngay_Mua,Ma_KH)
	VALUES (@maphieu,@ngaymua,@makh)
END

GO
ALTER PROC SuaPM(@maphieu VARCHAR(10),@ngaymua DATE,@makh VARCHAR(10))
AS
BEGIN
	UPDATE PhieuMua SET Ngay_Mua=@ngaymua,Ma_KH=@makh
	WHERE Ma_Phieu=@maphieu
END

GO
ALTER PROC XoaPM(@maphieu VARCHAR(10))
AS
BEGIN
	DELETE PhieuMua
	WHERE Ma_Phieu=@maphieu
END
