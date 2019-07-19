<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');

// 2. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if(isset($_POST['btnCapNhat']))
{
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $gy_ma = $_POST['gy_ma'];
    $gy_hoten = $_POST['gy_hoten'];
    $gy_email = $_POST['gy_email'];
    $gy_diachi = $_POST['gy_diachi'];
    $gy_dienthoai = $_POST['gy_dienthoai'];
    // $cdgy_ma = $_POST['cdgy_ma'];
    $gy_tieude = $_POST['gy_tieude'];
    $gy_noidung = $_POST['gy_noidung'];
    $gy_ngaygopy = $_POST['gy_ngaygopy'];

    // Câu lệnh INSERT
    $sql = "INSERT INTO `gopy` (gy_ma, gy_hoten, gy_email,
                                gy_diachi, gy_dienthoai,
                                gy_tieude, gy_noidung, gy_ngaygopy)
            VALUES ('" . $gy_ma . "', '". $gy_hoten ."', '". $gy_email ."',
                    '". $gy_diachi ."', '". $gy_dienthoai ."',
                    '". $gy_tieude ."', '". $gy_noidung ."' ,'". gy_ngaygopy ."');";

    // Thực thi INSERT
    mysqli_query($conn, $sql);

    // Đóng kết nối
    mysqli_close($conn);

    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}

// Nếu trong SESSION không có giá trị của key 'username', chúng ta sẽ xem như người dùng chưa đăng nhập
// Điều hướng người dùng về trang Đăng nhập
// RECOMMENDED: Nên ràng buộc kỹ hơn về phân quyền,
if(!isset($_SESSION['username']))
{
    header('location:./../pages/login.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/nhasanxuat/create.html.twig`
echo $twig->render('backend/gopy/create.html.twig');
