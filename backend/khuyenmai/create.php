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
    $km_ma = $_POST['km_ma'];
    $km_ten = $_POST['km_ten'];
    $km_noidung = $_POST['km_noidung'];
    $km_tungay = $_POST['km_tungay'];
    $km_denngay = $_POST['km_denngay'];

    // Kiểm tra ràng buộc dữ liệu (Validation)
    // Tạo biến lỗi để chứa thông báo lỗi
    $errors = [];
    // required
    if (empty($km_ten))
    {
        $errors['km_ten'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $km_ten,
            'msg' => 'Vui lòng nhập tên Khuyến mãi'
        ];
    }
    // minlength 3
    if (!empty($km_ten) && strlen($km_ten) < 3)
    {
        $errors['km_ten'][] = [
            'rule' => 'minlength',
            'rule_value' => 3,
            'value' => $km_ten,
            'msg' => 'Tên Khuyến mãi phải có ít nhất 3 ký tự'
        ];
    }

    // maxlength 50
    if (!empty($km_ten) && strlen($km_ten) > 50)
    {
        $errors['km_ten'][] = [
            'rule' => 'maxlength',
            'rule_value' => 50,
            'value' => $km_ten,
            'msg' => 'Tên Khuyến mãi không được vượt quá 50 ký tự'
        ];
    }

    // required rules for km_noidung
    if (empty($km_noidung))
    {
        $errors['km_noidung'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $km_noidung,
            'msg' => 'Vui lòng nhập mô tả Nội dung khuyến mãi'
        ];
    }
    // minlength 3
    if (!empty($km_noidung) && strlen($km_noidung) < 3)
    {
        $errors['km_noidung'][] = [
            'rule' => 'minlength',
            'rule_value' => 3,
            'value' => $km_noidung,
            'msg' => 'Mô tả Nội dung khuyến mãi phải có ít nhất 3 ký tự'
        ];
    }
    // maxlength 255
    if (!empty($km_noidung) && strlen($km_noidung) > 255)
    {
        $errors['km_noidung'][] = [
            'rule' => 'maxlength',
            'rule_value' => 255,
            'value' => $km_noidung,
            'msg' => 'Mô tả Nội dung khuyến mãi không được vượt quá 255 ký tự'
        ];
    }

    // required rules for $km_tungay
    if (empty($km_tungay))
    {
        $errors['km_tungay'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $km_tungay,
            'msg' => 'Vui lòng nhập Ngày bắt đầu khuyến mãi'
        ];
    }
    // minlength 10
    if (!empty($km_tungay) && strlen($km_tungay) <= 10)
    {
        $errors['km_tungay'][] = [
            'rule' => 'minlength',
            'rule_value' <= 10,
            'value' => $km_tungay,
            'msg' => 'Ngày bắt đầu khuyến mãi có 10 kí tự.'
        ];
    }
    // maxlength 255
    if (!empty($km_tungay) && strlen($km_tungay) > 10)
    {
        $errors['km_tungay'][] = [
            'rule' => 'maxlength',
            'rule_value' <= 10,
            'value' => $km_tungay,
            'msg' => 'Ngày bắt đầu khuyến mãi chỉ có 10 kí tự'
        ];
    }

    // required rules for $km_denngay
    if (empty($km_denngay))
    {
        $errors['km_denngay'][] = [
            'rule' => 'required',
            'rule_value' => true,
            'value' => $km_denngay,
            'msg' => 'Vui lòng nhập Ngày kết thúc khuyến mãi'
        ];
    }
    // minlength 10
    if (!empty($km_denngay) && strlen($km_denngay) <= 10)
    {
        $errors['km_denngay'][] = [
            'rule' => 'minlength',
            'rule_value' => 10,
            'value' => $km_denngay,
            'msg' => 'Ngày kết thúc khuyến mãi có 10 kí tự.'
        ];
    }
    // maxlength 255
    if (!empty($km_denngay) && strlen($km_denngay) > 10)
    {
        $errors['km_denngay'][] = [
            'rule' => 'maxlength',
            'rule_value' => 255,
            'value' => $km_denngay,
            'msg' => 'Ngày kết thúc khuyến mãi chỉ có 10 kí tự'
        ];
    }

    // dd($errors);
    // if (!empty($errors))
    // {
    //     // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
    //     // kèm theo dữ liệu thông báo lỗi
    //     echo $twig->render('backend/khuyenmai/create.html.twig', [
    //         'errors' => $errors,
    //         '$km_ten_oldvalue' => $km_ten,
    //         'km_noidung_oldvalue' => $km_noidung,
    //         'km_tungay_oldvalue' => $km_tungay,
    //         'km_denngay_oldvalue' => $km_denngay,
    //     ]);
    // }

    else
    {
      // Nếu không có lỗi dữ liệu sẽ thực thi câu lệnh SQL
      // Câu lệnh INSERT
      $sql = "INSERT INTO `khuyenmai` (km_ten,
                                      km_noidung,
                                      km_tungay,
                                      km_denngay)
              VALUES ('" . $km_ten . "',
                       '". $km_noidung ."',
                       '" . $km_tungay . "',
                       '" . $km_denngay . "');";

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
  // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
  echo $twig->render('backend/khuyenmai/create.html.twig');

}
