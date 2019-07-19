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
    $httt_ma = $_POST['httt_ma'];
    $httt_ten = $_POST['httt_ten'];

    // Kiểm tra ràng buộc dữ liệu (Validation)
    // Tạo biến lỗi để chứa thông báo lỗi
    $errors = [];
    // required
    if (empty($httt_ten))
    {
        $errors['httt_ten'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $httt_ten,
            'msg' => 'Vui lòng nhập tên Hình thức thanh toán'
        ];
    }

    // minlength 3
    if (!empty($httt_ten) && strlen($httt_ten) < 3)
    {
        $errors['httt_ten'][] = [
            'rule' => 'minlength',
            'rule_value' => 3,
            'value' => $httt_ten,
            'msg' => 'Tên Hình thức thanh toán phải có ít nhất 3 ký tự'
        ];
    }

    // maxlength 50
    if (!empty($httt_ten) && strlen($httt_ten) > 50)
    {
        $errors['httt_ten'][] = [
            'rule' => 'maxlength',
            'rule_value' => 50,
            'value' => $httt_ten,
            'msg' => 'Tên Hình thức thanh toán không được vượt quá 50 ký tự'
        ];
    }

    // dd($errors);
    if (!empty($errors))
    {
        // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
        // kèm theo dữ liệu thông báo lỗi
        echo $twig->render('backend/hinhthucthantoan/create.html.twig', [
            'errors' => $errors,
            'httt_ten_oldvalue' => $httt_ten,
        ]);
    }

    else
    {
        // Nếu không có lỗi dữ liệu sẽ thực thi câu lệnh SQL
        // Câu lệnh INSERT
        $sql = "INSERT INTO `hinhthucthanhtoan` (httt_ma, httt_ten)
        VALUES ('" . $httt_ma . "', '". $httt_ten ."');";

        // Thực thi INSERT
        mysqli_query($conn, $sql);

        // Đóng kết nối
        mysqli_close($conn);

        // Sau khi cập nhật dữ liệu, tự động điều hướng về trang Danh sách
        header('location:index.php');
    }
}

// Nếu trong SESSION không có giá trị của key 'username', chúng ta sẽ xem như người dùng chưa đăng nhập
// Điều hướng người dùng về trang Đăng nhập
if(!isset($_SESSION['username']))
{
    header('location:./../pages/login.php');
}

else
{

// Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/hinhthucthanhtoan/create.html.twig`
echo $twig->render('backend/hinhthucthanhtoan/create.html.twig');

}