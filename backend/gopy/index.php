<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database để lấy danh sách
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');

// 2. Chuẩn bị câu truy vấn $sql
$stt=1;
$sql = "select * from `gopy`";

// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu
$result = mysqli_query($conn, $sql);

// 4. Khi thực thi các truy vấn dạng SELECT, dữ liệu lấy về cần phải phân tích để sử dụng
// Thông thường, chúng ta sẽ sử dụng vòng lặp while để duyệt danh sách các dòng dữ liệu được SELECT
// Ta sẽ tạo 1 mảng array để chứa các dữ liệu được trả về
$data = [];
while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
{
    $data[] = array(
        'gopy_ma' => $row['lsp_ma'],
        'gopy_hoten' => $row['gopy_hoten'],
        'gopy_email' => $row['gopy_email'],
        'gopy_diachi' => $row['gopy_diachi'],
        'gopy_dienthoai' => $row['gopy_dienthoai'],
        'gopy_tieude' => $row['gopy_tieude'],
        'gopy_noidung' => $row['gopy_noidung'],
        'gopy_ngaygop' => $row['gopy_ngaygop'],
        'gopy_chudegopy' => $row['gopy_chudegopy'],
    );
}

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/loaisanpham.html.twig`
// với dữ liệu truyền vào file giao diện được đặt tên là `ds_loaisanpham`
echo $twig->render('backend/loaisanpham/index.html.twig', ['ds_gopy' => $data] );