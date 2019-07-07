<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');

// 2. Chuẩn bị câu truy vấn $sqlSelect, lấy dữ liệu ban đầu của record cần update
// Lấy giá trị khóa chính được truyền theo dạng QueryString Parameter key1=value1&key2=value2...
$gy_ma = $_GET['gy_ma'];
$sqlSelect = "SELECT * FROM `gopy` WHERE gy_ma=$gy_ma;";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu ban đầu của record cần update
$resultSelect = mysqli_query($conn, $sqlSelect);
$gopyRow = mysqli_fetch_array($resultSelect, MYSQLI_ASSOC); // 1 record

// 4. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
if(isset($_POST['btnCapNhat']))
{
    // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
    $gy_ma = $_POST['gy_ma'];
    $gy_hoten = $_POST['gy_hoten'];
    $gy_email = $_POST['gy_email'];
    $gy_diachi = $_POST['gy_diachi'];
    $gy_dienthoai = $_POST['gy_dienthoai'];
    $gy_tieude = $_POST['gy_tieude'];
    $gy_noidung = $_POST['gy_noidung'];
    $gy_ngaygop = $_POST['gy_ngaygop'];
    $gy_chudegopy = $_POST['gy_chudegopy'];

    // Câu lệnh UPDATE
    $sql = "UPDATE `gopy`
            SET gy_ma='$gy_ma', gy_hoten='$gy_hoten', gy_email='$gy_email', gy_diachi='$gy_diachi', gy_dienthoai='$gy_dienthoai', gy_tieude='$gy_tieude', gy_noidung='$gy_noidung', gy_ngaygop='$gy_ngaygop'
            WHERE gy_ma=$gy_ma;";

    // Thực thi UPDATE
    mysqli_query($conn, $sql);

    // Đóng kết nối
    mysqli_close($conn);

    // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
    header('location:index.php');
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/edit.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `loaisanpham`
echo $twig->render('backend/gopy/edit.html.twig', ['gopy' => $gopyRow] );
