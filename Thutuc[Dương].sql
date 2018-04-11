USE QUAN_LY_KHU_VUI_CHOI
GO
CREATE TABLE NguoiDung
(
	TaiKhoan NVARCHAR(50),
	MatKhau NVARCHAR(50),
	PhanQuyen VARCHAR(20)
)
GO 
INSERT dbo.NguoiDung
        ( TaiKhoan, MatKhau, PhanQuyen )
VALUES  ( N'admin', -- TaiKhoan - nvarchar(50)
          N'admin', -- MatKhau - nvarchar(50)
          'Admin'  -- PhanQuyen - varchar(20)
          )
GO 
INSERT dbo.NguoiDung
        ( TaiKhoan, MatKhau, PhanQuyen )
VALUES  ( N'user1', -- TaiKhoan - nvarchar(50)
          N'1', -- MatKhau - nvarchar(50)
          'User'  -- PhanQuyen - varchar(20)
          )
GO 
INSERT dbo.NguoiDung
        ( TaiKhoan, MatKhau, PhanQuyen )
VALUES  ( N'user2', -- TaiKhoan - nvarchar(50)
          N'2', -- MatKhau - nvarchar(50)
          'User'  -- PhanQuyen - varchar(20)
          )
GO 

CREATE PROC DangNhap(@TaiKhoan NVARCHAR(50),@MatKhau NVARCHAR(50), @PhanQuyen NVARCHAR(50))
 AS
 BEGIN
 SELECT * FROM dbo.NguoiDung 
 WHERE TaiKhoan=@TaiKhoan AND MatKhau=@MatKhau AND PhanQuyen=@PhanQuyen
 END
 GO
 --thu tuc them nguoi dung
 CREATE PROC SP_ThemNguoiDung(@TaiKhoan NVARCHAR(50),@MatKhau NVARCHAR(50), @PhanQuyen NVARCHAR(50))
 AS
 BEGIN
 INSERT dbo.NguoiDung
 VALUES  (@TaiKhoan,@MatKhau,@PhanQuyen )
 END
 GO
 --thu thuc xem nhân viên
 CREATE PROC SP_XemThongTinNhanVien
 AS 
 BEGIN
 SELECT * FROM dbo.NhanVien
 END 
 GO
 --thủ tục thêm nhân viên
 CREATE PROC SP_ThemNhanVien(@MaNV VARCHAR(50), @TenNV NVARCHAR(50), @GioiTinh NVARCHAR(10),@Luong INT, @MaKhu VARCHAR(50), @NgaySinh DATE)
 AS 
 BEGIN
 INSERT dbo.NhanVien
 VALUES  ( @MaNV , @TenNV , @GioiTinh ,@Luong , @MaKhu , @NgaySinh)
 END
 GO
 
 --thủ tục sửa nhân viên
 CREATE PROC SP_SuaNhanVien(@MaNV VARCHAR(50), @TenNV NVARCHAR(50), @GioiTinh NVARCHAR(10),@Luong INT, @MaKhu VARCHAR(50), @NgaySinh DATE)
 AS 
 BEGIN
 UPDATE dbo.NhanVien
 SET Ten_NV=@TenNV,Gioi_Tinh=@GioiTinh,Luong=@Luong,Ma_Khu=@MaKhu,Ngay_Sinh=@NgaySinh
 WHERE Ma_NV=@MaNV
 END
 GO 
 --thủ tục sửa nhân viên
 CREATE PROC SP_XoaNhanVien(@MaNV VARCHAR(50))
 AS 
 BEGIN
 DELETE dbo.NhanVien
 WHERE Ma_NV=@MaNV
 END 

 SELECT * FROM dbo.NhanVien
 GO
 --thủ tục khách hàng
 --xem khách hàng
 CREATE PROC SP_XemKhachHang
 AS
BEGIN
	SELECT * FROM dbo.KhachHang
END
 --thêm khách hàng
 GO
 CREATE PROC SP_ThemKhachHang(@MaKhachHang VARCHAR(10), @TenKhachHang NVARCHAR(50), @NamSinh INT, @GioiTinh NVARCHAR(10))
 AS
 BEGIN
 	INSERT dbo.KhachHang
 	VALUES  ( @MaKhachHang,  @TenKhachHang,  @NamSinh,  @GioiTinh)
 END
 GO
 --Sửa khách hàng
 CREATE PROC SP_SuaKhachHang(@MaKhachHang VARCHAR(10), @TenKhachHang NVARCHAR(50), @NamSinh INT, @GioiTinh NVARCHAR(10))
 AS
 BEGIN
 	UPDATE dbo.KhachHang
	SET Ten_KH=@TenKhachHang,Nam_Sinh=@NamSinh,Gioi_Tinh=@GioiTinh
	WHERE Ma_KH=@MaKhachHang
 END
 GO 
 --Xóa khách hàng
 CREATE PROC SP_XoaKhachHang(@MaKhachHang VARCHAR(10))
 AS
 BEGIN
 UPDATE dbo.PhieuMua
 SET Ma_KH=NULL
 WHERE Ma_KH=@MaKhachHang
  UPDATE dbo.VeChoi
 SET Ma_KH=NULL
 WHERE Ma_KH=@MaKhachHang
 	DELETE dbo.KhachHang
	WHERE Ma_KH=@MaKhachHang
 END