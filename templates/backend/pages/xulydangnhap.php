<?php
    $tendangnhap = $_POST['username'];
    $matkhau = $_POST['password'];

    if($tendangnhap == 'admin' && $matkhau == '12345') {
        echo 'Login successfully';
    } else {
        echo 'Login failed. Please check your user name or password';
    }
?>