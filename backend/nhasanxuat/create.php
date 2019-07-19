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

    // Kiểm tra ràng buộc dữ liệu (Validation)
    // Tạo biến lỗi để chứa thông báo lỗi
    $errors = [];
    // required
    if (empty($nsx_ten))
    {
        $errors['lsp_ten'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $nsx_ten,
            'msg' => 'Vui lòng nhập tên Nhà sản xuất'
        ];
    }

    // minlength 3
    if (!empty($nsx_ten) && strlen($nsx_ten) < 3)
    {
        $errors['lsp_ten'][] = [
            'rule' => 'minlength',
            'rule_value' => 3,
            'value' => $nsx_ten,
            'msg' => 'tên Nhà sản xuất phải có ít nhất 3 ký tự'
        ];
    }

    // maxlength 50
    if (!empty($nsx_ten) && strlen($nsx_ten) > 50)
    {
        $errors['lsp_ten'][] = [
            'rule' => 'maxlength',
            'rule_value' => 50,
            'value' => $nsx_ten,
            'msg' => 'Tên Nhà sản xuất không được vượt quá 50 ký tự'
        ];
    }

    // dd($errors);
    if (!empty($errors))
    {
        // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
        // kèm theo dữ liệu thông báo lỗi
        echo $twig->render('backend/nhasanxuat/create.html.twig', [
            'errors' => $errors,
            'nsx_ten_oldvalue' => $nsx_ten,
        ]);
    }

    else
    {
      // Nếu không có lỗi dữ liệu sẽ thực thi câu lệnh SQL
      // Câu lệnh INSERT
      $sql = "INSERT INTO `nhasanxuat` ( nsx_ten)
              VALUES ('". $nsx_ten ."');";

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
// RECOMMENDED: Nên ràng buộc kỹ hơn về phân quyền,
if(!isset($_SESSION['username']))
{
    header('location:./../pages/login.php');
}

else
{
  // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/nhasanxuat/create.html.twig`
  echo $twig->render('backend/nhasanxuat/create.html.twig');

}
