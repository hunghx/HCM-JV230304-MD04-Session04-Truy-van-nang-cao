-- tạo csdl 
create database quanlybanhang;
use quanlybanhang;

create table phieuxuat(
        soPx int primary key auto_increment,
        ngayXuat datetime
);

create table Vattu(
        maVT int auto_increment primary key,
        TenVt varchar(255)
);

create table phieunhap(
        soPn int auto_increment primary key,
        ngaynhap datetime
);

create table PhieuxuatChitiet(
        soPX int,
        maVt int,
        dongiaXUat double,
        soluongxuat int

);
create table PhieunhapChitiet(
        soPN int,
        maVt int,
        dongiaNhap double,
        soluongnhap int

);

create table chitietdonhang(
        maVt int ,
        soDH int
);

create table DonDathang(
        soDh int auto_increment primary key,
        mancc int,
        ngayDH datetime
);

create table NhaCungCap(
        mancc int auto_increment primary key,
        tenNcc varchar(255),
        diachi varchar(255),
        sodienthoai varchar(11)
);


-- them khoa ngoai
-- Yêu cầu truy vấn dữ liệu:

-- Hiển thị tất cả vật tự dựa vào phiếu xuất có số lượng lớn hơn 10

select v.* from vattu v join phieuxuatchitiet ct
on v.mavt = ct.mavt
where ct.soluongxuat > 10;

-- Hiển thị tất cả vật tư mua vào ngày 12/2/2023

select v.* from vattu v join phieunhapchitiet ct 
on v.mavt = ct.mavt
join phieunhap p
on ct.sopn = p.sopn
where pn.ngaynhap = '2023-02-12';    

-- Hiển thị tất cả vật tư được nhập vào với đơn giá lớn hơn 1.200.000

select v.* from vattu v join phieunhapchitiet ct
on v.mavt = ct.mavt
where ct.dongianhap > 1200000;
-- Hiển thị tất cả vật tư được dựa vào phiếu xuất có số lượng lớn hơn 5

-- Hiển thị tất cả nhà cung cấp ở long biên có SoDienThoai bắt đầu với 09


-- Hiển thị đơn hàng có tổng giá tiền lớn nhất


select o.oId, o.cId, o.oDate , sum(od.odQty * p.pPrice) `tong tien tung hoa don` from `Order` o join OrderDetails od
on o.oId = od.oId
join Product p on p.pId = od.pId
group by od.oId
order by `tong tien tung hoa don` desc limit 1;


