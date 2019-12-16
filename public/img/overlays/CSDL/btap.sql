use QLBH
go
select * from HOADON, SANPHAM, CTHD
--1. In ra danh sách các s?n ph?m ch? l?y (MASP,TENSP) do “Trung Quoc” s?n xu?t.
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM where SANPHAM.NUOCSX = 'Trung Quoc'	

--2. In ra danh sách các s?n ph?m ch? l?y (MASP, TENSP) có ??n v? tính là “cay”, ”quyen”
select SANPHAM.MASP, SANPHAM.TENSP, SANPHAM.DVT from SANPHAM where SANPHAM.DVT ='cay' or SANPHAM.DVT ='quyen'
--3. In ra danh sách các s?n ph?m (MASP,TENSP) có mã s?n ph?m b?t ??u là “B” và k?t thúc là “01”.
select SANPHAM.MASP, SANPHAM.GIA from SANPHAM where SANPHAM.MASP like 'B%01'
--4. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Qu?c” s?n xu?t có giá t? 30.000 ??n 40.000.
select SANPHAM.MASP, SANPHAM.GIA from SANPHAM where SANPHAM.NUOCSX ='Trung Quoc'and SANPHAM.GIA between 30000 and 40000
--5. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” ho?c “Viet Nam” s?n xu?t có giá t? 30.000 ??n 40.000.
select SANPHAM.MASP, SANPHAM.GIA from SANPHAM where SANPHAM.NUOCSX ='Trung Quoc' or SANPHAM.NUOCSX ='Viet Nam' and SANPHAM.GIA between 30000 and 40000
--6. In ra các s? hóa ??n, tr? giá hóa ??n bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select HOADON.SOHD, HOADON.TRIGIA, HOADON.NGHD from HOADON where HOADON.NGHD = '1/1/2007' or HOADON.NGHD = '2/1/2007'
--7. In ra các s? hóa ??n, tr? giá hóa ??n trong tháng 1/2007, s?p x?p theo ngày (t?ng d?n) và tr? giá c?a hóa ??n (gi?m d?n).
select HOADON.SOHD, HOADON.TRIGIA from HOADON where MONTH(HOADON.NGHD) = '1' and YEAR(HOADON.NGHD) = '2007' order by HOADON.NGHD asc, HOADON.TRIGIA desc
--8. In ra danh sách các khách hàng (MAKH, HOTEN) ?ã mua hàng trong ngày 1/1/2007.
select KHACHHANG.MAKH, KHACHHANG.HOTEN, HOADON.NGHD from KHACHHANG, HOADON where HOADON.NGHD = '1/1/2007'
--9. In ra s? hóa ??n, tr? giá các hóa ??n do nhân viên có tên “Nguyen Van B” l?p trong ngày 28/10/2006.
select HOADON.SOHD, HOADON.TRIGIA from HOADON, NHANVIEN where NHANVIEN.HOTEN = 'Nguyen Van B' and HOADON.NGHD = '10/28/2006' 
--10. In ra danh sách các s?n ph?m (MASP,TENSP) ???c khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
select SANPHAM.MASP, SANPHAM.TENSP from HOADON, SANPHAM, KHACHHANG where KHACHHANG.HOTEN = 'Nguyen Van A' and month(HOADON.NGHD) = '10' and YEAR(HOADON.NGHD)='2006'
--11. Tìm các s? hóa ??n ?ã mua s?n ph?m có mã s? “BB01” ho?c “BB02”.
select HOADON.SOHD from HOADON, SANPHAM where SANPHAM.MASP in ('BB01','BB02')
--12. Tìm các s? hóa ??n ?ã mua s?n ph?m có mã s? “BB01” ho?c “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
select HOADON.SOHD from HOADON, SANPHAM, CTHD where SANPHAM.MASP in ('BB01','BB02') and CTHD.SL between 10 and 20
--13. Tìm các s? hóa ??n mua cùng lúc 2 s?n ph?m có mã s? “BB01” và “BB02”, m?i s?n ph?m mua v?i s? l??ng t? 10 ??n 20.
select HOADON.SOHD from HOADON, CTHD, SANPHAM where SANPHAM.MASP = 'BB01' and SANPHAM.MASP = 'BB02' and CTHD.SL between 10 and 20
--14. In ra danh sách các s?n ph?m (MASP,TENSP) do “Trung Quoc” s?n xu?t và ???c bán ra trong ngày 1/1/2007.
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM, HOADON where SANPHAM.NUOCSX ='Trung Quoc' and HOADON.NGHD ='1/1/2007'
--15. In ra danh sách các s?n ph?m (MASP,TENSP) không bán ???c.
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM, CTHD where CTHD.SL ='0'
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM,CTHD where  CTHD.SL not in (
	select CTHD.SL from HOADON, CTHD where HOADON.SOHD = CTHD.SOHD and YEAR(HOADON.NGHD) =2006
)
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM,CTHD where  SANPHAM.MASP not in (
	select CTHD.MASP from HOADON, CTHD where HOADON.SOHD = CTHD.SOHD and YEAR(HOADON.NGHD) =2006
)
--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select * from HOADON, SANPHAM
select HOADON.* from HOADON, SANPHAM where SANPHAM.NUOCSX = 'Trung Quoc'
--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
