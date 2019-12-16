select * from ThanNhan
select HoTen, HoTen as TenNGS from NhanVien where MaNV=MaNGS

--Tìm những nhân viên có lương bằng lương của ít nhất một nhân viên thuộc phòng ‘PB01’.
 select MaNV,HoTen, Luong  from NhanVien where Luong in (
	select Luong 
	from NhanVien left join PhongBan on NhanVien.MaPB = PhongBan.MaPB 
	where PhongBan.MaPB = 'PB1'
 )
 --1. Đưa ra nhân viên là người giám sát Gợi ý: Nhân viên giám sát: là những nhân viên có giá trị trong trường MaNGS
 select MaNV, HoTen from NhanVien where MaNV in (
	select distinct MaNGS from NhanVien 
 )
 select distinct NhanVien.MaNV, NhanVien.HoTen 
 from NhanVien, NhanVien as NV
 where NhanVien.MaNV = NV.MaNGS
 
 --Đưa ra nhân viên vừa là trưởng phòng vừa tham gia dự án

 select * from  ThanNhan
 select MaTP from PhongBan, NhanVien where PhongBan.MaTP = NhanVien.MaNV
 intersect
 select MaDA from DuAn, PhongBan where DuAn.MaPB = PhongBan.MaPB 
 
 select distinct MaNV, HoTen from NhanVien left join PhongBan on NhanVien.MaNV = PhongBan.MaTP
									left join DuAn on PhongBan.MaPB = DuAn.MaPB
--Tìm những nhân viên không có thân nhân nào
select NhanVien.MaNV from NhanVien left join ThanNhan on NhanVien.MaNV=ThanNhan.MaNV 
except
select MaNV from ThanNhan 		

--so luog
select count(MaNV) as quantity, PhongBan.MaPB,PhongBan.TenPB
from PhongBan, NhanVien 
where PhongBan.MaPB=NhanVien.MaPB 
group by PhongBan.MaPB, TenPB

select COUNT(MaNV) from NhanVien, PhongBan where PhongBan.MaPB=NhanVien.MaPB and PhongBan.TenPB=N'Phòng Ban 1'


--dem so luong ho khac nhau
select  COUNT(distinct ho) from NhanVien

--dem so nhan vien trong tung ho	
select count(MaNV) as SL_NV, ho from NhanVien group by NhanVien.ho

--in nhan vien nhieu tuoi nhat trong tung ho		

select * from NhanVien
select NhanVien.* from NhanVien ,(select min(NhanVien.NgaySinh) as ns, ho from NhanVien group by ho) as x
where NhanVien.ho = x.ho and NhanVien.NgaySinh = x.ns


--in ra ho co tong luong cao nhat

select max(L.sumLuong) from(select sum(NhanVien.Luong) as sumLuong, ho from NhanVien group by ho) as L
select sum(NhanVien.Luong) as sumLuong, ho from NhanVien group by ho 
--in ra nguoi co luong caco nhat tung ho	
use QLBH
go			 
select * from NHANVIEN
select max(day(GETDATE()) - day(NGVL)) as cout from NHANVIEN group by MANV
select * from NHANVIEN

use QLNV

select count(NhanVien.MaNV), PhongBan.MaPB, TenPB  from NhanVien, PhongBan 
where NhanVien.MaPB=PhongBan.MaPB 
group by PhongBan.MaPB, TenPB  
having count(NhanVien.MaNV) > 5

select * from NhanVien
--phong ban phu trach 3 du an >, mapb, ten pb solgduan
select COUNT(PhongBan.MaPB),PhongBan.MaPB, TenPB   from PhongBan, DuAn 
group by  PhongBan.MaPB, TenPB

--dua ra nhan vien co tong so gio lam viec > 10, manv tennv, tenpb, so luong du an
select NhanVien.MaNV, HoTen, TenPB, SoGio from PhanCong, NhanVien, PhongBan
where PhanCong.MaNV = NhanVien.MaNV and NhanVien.MaPB=PhongBan.MaPB
group by NhanVien.MaNV, HoTen, TenPB, SoGio
having SoGio > 10
--dua ra nhan vien co luong lon nhat cua tungpb, manvv ten nv tenpb luong

--dua ra nhan vien co nhieu than nhan, ma nv, tennv soluongthannhan
select * from ThanNhan

select top 1 NhanVien.MaNV, NhanVien.HoTen, mvc.x
from NhanVien, (select COUNT(ThanNhan.MaNV) as x, ThanNhan.MaNV  from ThanNhan group by ThanNhan.MaNV, MaNV) as mvc
where NhanVien.MaNV=mvc.MaNV
order by mvc.x desc

select * from PhanCong
select NhanVien.* from NhanVien 
where NhanVien.Luong in (
select max(NhanVien.Luong) from NhanVien, PhongBan
where NhanVien.MaPB=PhongBan.MaPB
group by PhongBan.MaPB)

s