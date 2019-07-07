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
    $nsx_ma = $_POST['nsx_ma'];
    $nsx_ten = $_POST['nsx_ten'];

    // Câu lệnh INSERT
    $sql = "INSERT INTO `nhasanxuat` (nsx_ma, nsx_ten)
            VALUES ('" . $nsx_ten . "', '". $nsx_ma ."');";

    // Thực thi INSERT
    mysqli_query($conn, $sql);

    // Đóng kết nối
    mysqli_close($conn);

    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/nhasanxuat/create.html.twig`
echo $twig->render('backend/nhasanxuat/create.html.twig');
