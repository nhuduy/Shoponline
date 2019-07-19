<?php
// Include file cấu hình ban đầu của `Twig`
require_once __DIR__.'/../../bootstrap.php';

// Truy vấn database
// 1. Include file cấu hình kết nối đến database, khởi tạo kết nối $conn
include_once(__DIR__.'/../../dbconnect.php');

// 2. Chuẩn bị câu truy vấn $sqlSelect, lấy dữ liệu ban đầu của record cần update
// Lấy giá trị khóa chính được truyền theo dạng QueryString Parameter key1=value1&key2=value2...
$lsp_ma = $_GET['lsp_ma'];
$sqlSelect = "SELECT * FROM `loaisanpham`
              WHERE lsp_ma=$lsp_ma;";



// 3. Thực thi câu truy vấn SQL để lấy về dữ liệu ban đầu của record cần update
$resultSelect = mysqli_query($conn, $sqlSelect);
$loaisanphamRow = mysqli_fetch_array($resultSelect, MYSQLI_ASSOC); // 1 record

// 4. Nếu người dùng có bấm nút Đăng ký thì thực thi câu lệnh UPDATE
// Kiểm tra ràng buộc dữ liệu (Validation)
// Tạo biến lỗi để chứa thông báo lỗi
$errors = [];

if(isset($_POST['btnCapNhat']))
{
  // Lấy dữ liệu người dùng hiệu chỉnh gởi từ REQUEST POST
  $tenLoai = $_POST['lsp_ten'];
  $mota = $_POST['lsp_mota'];

  // Kiểm tra ràng buộc dữ liệu (Validation)
  // Tạo biến lỗi để chứa thông báo lỗi
  $errors = [];
  // required
  if (empty($tenLoai))
  {
      $errors['lsp_ten'][] = [
          'rule' => 'required',
          'rule_value' => true,
          'value' => $tenLoai,
          'msg' => 'Vui lòng nhập tên Loại sản phẩm'
      ];
  }
  // minlength 3
  if (!empty($tenLoai) && strlen($tenLoai) < 3)
  {
      $errors['lsp_ten'][] = [
          'rule' => 'minlength',
          'rule_value' => 3,
          'value' => $tenLoai,
          'msg' => 'Tên Loại sản phẩm phải có ít nhất 3 ký tự'
      ];
  }
  // maxlength 50
  if (!empty($tenLoai) && strlen($tenLoai) > 50)
  {
      $errors['lsp_ten'][] = [
          'rule' => 'maxlength',
          'rule_value' => 50,
          'value' => $tenLoai,
          'msg' => 'Tên Loại sản phẩm không được vượt quá 50 ký tự'
      ];
  }

  // required
  if (empty($mota))
  {
      $errors['lsp_mota'][] = [
          'rule' => 'required',
          'rule_value' => true,
          'value' => $mota,
          'msg' => 'Vui lòng nhập mô tả Loại sản phẩm'
      ];
  }
  // minlength 3
  if (!empty($mota) && strlen($mota) < 3)
  {
      $errors['lsp_mota'][] = [
          'rule' => 'minlength',
          'rule_value' => 3,
          'value' => $mota,
          'msg' => 'Mô tả loại sản phẩm phải có ít nhất 3 ký tự'
      ];
  }
  // maxlength 255
  if (!empty($mota) && strlen($mota) > 255)
  {
      $errors['lsp_mota'][] = [
          'rule' => 'maxlength',
          'rule_value' => 255,
          'value' => $mota,
          'msg' => 'Mô tả loại sản phẩm không được vượt quá 255 ký tự'
      ];
  }

  // dd($errors);
  if (!empty($errors))
  {
      // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/create.html.twig`
      // kèm theo dữ liệu thông báo lỗi
      echo $twig->render('backend/loaisanpham/create.html.twig', [
          'errors' => $errors,
          'lsp_ten_oldvalue' => $tenLoai,
          'lsp_mota_oldvalue' => $mota
      ]);
  }
  else
  {
    // Câu lệnh UPDATE
    $sql = "UPDATE `loaisanpham`
            SET lsp_ten='$tenLoai', lsp_mota='$mota'
            WHERE lsp_ma=$lsp_ma;";

    // Thực thi UPDATE
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
  // Yêu cầu `Twig` vẽ giao diện được viết trong file `backend/loaisanpham/edit.html.twig`
  // với dữ liệu truyền vào file giao diện được đặt tên là `loaisanpham`
  echo $twig->render('backend/loaisanpham/edit.html.twig', ['loaisanpham' => $loaisanphamRow] );
}
