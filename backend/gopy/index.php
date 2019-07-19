<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database để lấy danh sách
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');

// 2. Chuẩn bị câu truy vấn $sql
$stt=1;
$sql = "select * from `gopy`";
// $sql1 = "select * from `chudegopy`";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result = mysqli_query($conn, $sql);

// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data = [];
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    $data[] = array(
        'gy_ma' => $row['gy_ma'],
        'gy_hoten' => $row['gy_hoten'],
        'gy_email' => $row['gy_email'],
        'gy_diachi' => $row['gy_diachi'],
        'gy_dienthoai' => $row['gy_dienthoai'],
        'cdgy_ma' => $row['cdgy_ma'],
        'gy_tieude' => $row['gy_tieude'],
        'gy_noidung' => $row['gy_noidung'],
        'gy_ngaygop' => $row['gy_ngaygop'],
    );
}

// Nếu trong SESSION không có giá trị của key 'username', chúng ta sẽ xem như người dùng chưa đăng nhập
// Điều hướng người dùng về trang Đăng nhập
// RECOMMENDED: Nên ràng buộc kỹ hơn về phân quyền,
if(!isset($_SESSION['username']))
{
    header('location:./../pages/login.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/loaisanpham.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_loaisanpham`
echo $twig->render('backend/gopy/index.html.twig', ['ds_gopy' => $data] );
