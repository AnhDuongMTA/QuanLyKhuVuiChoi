USE QuanLyKhuVuiChoi
GO

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

