-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2019 at 07:20 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `chudegopy`
--

CREATE TABLE `chudegopy` (
  `cdgy_ma` int(11) NOT NULL,
  `cdgy_ten` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `dh_ma` int(11) NOT NULL,
  `dh_ngaylap` datetime NOT NULL,
  `dh_ngaygiao` datetime DEFAULT NULL,
  `dh_noigiao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dh_trangthaithanhtoan` int(11) NOT NULL,
  `httt_ma` int(11) NOT NULL,
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gopy`
--

CREATE TABLE `gopy` (
  `gy_ma` int(11) NOT NULL,
  `gy_hoten` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_diachi` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_dienthoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_tieude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gy_noidung` text COLLATE utf8_unicode_ci,
  `gy_ngaygopy` datetime DEFAULT NULL,
  `cdgy_ma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hinhsanpham`
--

CREATE TABLE `hinhsanpham` (
  `hsp_ma` int(11) NOT NULL,
  `hsp_tentaptin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sp_ma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hinhsanpham`
--

INSERT INTO `hinhsanpham` (`hsp_ma`, `hsp_tentaptin`, `sp_ma`) VALUES
(39, 'product1.jpg', 1),
(41, 'product.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `hinhthucthanhtoan`
--

CREATE TABLE `hinhthucthanhtoan` (
  `httt_ma` int(11) NOT NULL,
  `httt_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `kh_tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_matkhau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_gioitinh` int(11) NOT NULL,
  `kh_diachi` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `kh_dienthoai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kh_ngaysinh` int(11) DEFAULT NULL,
  `kh_thangsinh` int(11) DEFAULT NULL,
  `kh_namsinh` int(11) NOT NULL,
  `kh_cmnd` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_makichhoat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kh_trangthai` int(11) NOT NULL,
  `kh_quantri` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`kh_tendangnhap`, `kh_matkhau`, `kh_ten`, `kh_gioitinh`, `kh_diachi`, `kh_dienthoai`, `kh_email`, `kh_ngaysinh`, `kh_thangsinh`, `kh_namsinh`, `kh_cmnd`, `kh_makichhoat`, `kh_trangthai`, `kh_quantri`) VALUES
('dinhduyvo', 'fcea920f7412b5da7be0cf42b8c93759', 'Vo Dinh Duy', 0, 'Can Tho', '07103.273.34433', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '', 1, 0),
('dnpcuong', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Dương Nguyễn Phú Cường', 0, '130 Xô Viết Nghệ Tỉnh', '0915659223', 'phucuong@ctu.edu.vn', 11, 6, 1989, '362209685', '4a5c874f8c4446145989ca515bd158669b0596c6', 1, 0),
('nta', '123', 'Nguyễn Thị A', 0, 'Số 20 - Phan Đình Phùng', '01234.234.234', 'nta@gmail.com', NULL, NULL, 1990, NULL, NULL, 1, 0),
('test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'Tester', 0, 'Can Tho', '0123123123', 'xxx@xxx.xxx', 20, 7, 2019, '', '', 1, 0),
('usermoi', 'fcea920f7412b5da7be0cf42b8c93759', 'Nguoi dung moi', 0, 'Can Tho', '07103-273.344', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', '44766fb4dd4e4977e75a9321cbc6413e', 0, 0),
('vdduy', 'fcea920f7412b5da7be0cf42b8c93759', 'Vo Dinh Duy', 0, 'Can Tho', '0975107705', 'vdduy@ctu.edu.vn', 2, 2, 1985, '', 'â€zcnl82qbuj', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `km_ma` int(11) NOT NULL,
  `km_ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km_noidung` text COLLATE utf8_unicode_ci,
  `km_tungay` date DEFAULT NULL,
  `km_denngay` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khuyenmai`
--

INSERT INTO `khuyenmai` (`km_ma`, `km_ten`, `km_noidung`, `km_tungay`, `km_denngay`) VALUES
(1, '10%', 'Giảm 10% cho ngày hội Cafe Việt Nam', '2019-07-20', '2019-08-20'),
(2, '15%', 'Giảm 15% cho thành viên ngày hội Cafe Việt Nam', '2019-07-20', '2019-08-20'),
(3, '20%', 'Giảm 20% cho thành viên VIP ngày hội Cafe Việt Nam', '2019-07-20', '2019-08-20'),
(4, '8%', 'Giảm 8% cho khách hàng mới', '2019-07-20', '2019-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `lsp_ma` int(11) NOT NULL,
  `lsp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lsp_mota` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`lsp_ma`, `lsp_ten`, `lsp_mota`) VALUES
(9, 'Trà hữu cơ', 'Trà sạch tiêu chuẩn'),
(10, 'Cafe', 'Cafe'),
(11, 'Cafe hạt', 'Cafe'),
(12, 'Cafe hoà tan', 'Cafe'),
(13, 'Cafe nguyên chất', 'Cafe'),
(14, 'Cafe sáng tạo', 'Cafe'),
(15, 'Cafe đen', 'Cafe'),
(16, 'Cafe 3 trong 1', 'Cafe'),
(17, 'Cafe mạnh', 'Cafe');

-- --------------------------------------------------------

--
-- Table structure for table `nhasanxuat`
--

CREATE TABLE `nhasanxuat` (
  `nsx_ma` int(11) NOT NULL,
  `nsx_ten` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhasanxuat`
--

INSERT INTO `nhasanxuat` (`nsx_ma`, `nsx_ten`) VALUES
(1, 'Andy'),
(2, 'Trung Nguyên'),
(3, 'Buôn Mê Thuộc');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `sp_ma` int(11) NOT NULL,
  `sp_ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sp_gia` decimal(12,2) DEFAULT NULL,
  `sp_giacu` decimal(12,2) DEFAULT NULL,
  `sp_mota_ngan` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `sp_mota_chitiet` text COLLATE utf8_unicode_ci,
  `sp_ngaycapnhat` datetime NOT NULL,
  `sp_soluong` int(11) DEFAULT NULL,
  `lsp_ma` int(11) NOT NULL,
  `nsx_ma` int(11) NOT NULL,
  `km_ma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`sp_ma`, `sp_ten`, `sp_gia`, `sp_giacu`, `sp_mota_ngan`, `sp_mota_chitiet`, `sp_ngaycapnhat`, `sp_soluong`, `lsp_ma`, `nsx_ma`, `km_ma`) VALUES
(1, 'Cafe Việt', '120000.00', '150000.00', 'Cafe hoà tan', 'Cafe mới dành cho phái mạnh', '2019-08-01 00:00:00', 200, 9, 1, NULL),
(4, 'Trà Sữa Hòa Tan Royal Myanmar Teamix Royal010600 (30 Gói)', '105000.00', '150000.00', 'Không có Cholesterol\r\n\r\nAn toàn, phù hợp cho mọi giới tuổi cả người ăn chay và trẻ em\r\n\r\nRất đượm mùi trà\r\n\r\nĐược chiết xuất từ những lá trà xanh tươi sạch\r\n\r\nTrà dạng bột', 'Trà Sữa Hòa Tan Royal Myanmar Teamix ROYAL010600 (30 Gói) không có Cholesterol, độ béo ít, sử dụng kem thực vật dẫn sữa, hàm lượng 90 Calories / gói nhỏ. An toàn, phù hợp cho mọi giới tuổi cả người ăn chay và trẻ em.\r\nRất đượm mùi trà, hơi chát đầu lưỡi, có vị béo và ngọt nhẹ của kem thực vật có vị sữa, ngon hơn bất kỳ loại trà sữa nào đang có mặt trên thị trường Việt Nam.\r\nTrà sữa được chiết xuất từ những lá trà xanh tươi sạch của Myanmar tạo nên một lại trà hòa tan ngon nhất.\r\nTrà dạng bột giúp bạn tự tay pha chế ly trà sữa thơm ngon cho bản thân và gia đình ngay tại nhà một cách đơn giản, nhanh chóng.\r\nHướng dẫn sử dụng\r\n\r\nUống nóng: ~150ml nước ấm/ 01 gói, pha thêm mật ong hoặc đường/ sữa tuỳ khẩu vị, quấy đều cho tan, 2 tay áp vào li, nâng lên gần mũi để cảm nhận mùi thơm thoảng nhẹ, thưởng thức (Nếu không thích ngọt quá, thì không cần pha thêm đường/ sữa)\r\nUống đá: ~200ml nước nóng/ 02 gói, pha thêm mật ong hoặc đường/sữa tuỳ khẩu vị, quấy đều cho tan, thêm đá ngập li, dùng muỗng đảo nhẹ, thưởng thức\r\nChỉ cần 30 giây là bạn có ngay tách trà thơm lừng để thưởng thức, lại có thể mang theo khi đi du lịch, công tác…\r\n', '2019-07-23 00:00:00', 100, 9, 1, NULL),
(5, 'Trà Sữa Kirin (1.5 lít)', '34000.00', '100000.00', 'Sản xuất theo tiêu chuẩn Nhật Bản, an toàn cho sức khỏe\r\n\r\nĐược làm từ những lá hồng trà được tuyển chọn kỹ càng\r\n\r\nHoà quyện với sữa ngọt ngào, lôi cuốn', 'Trà sữa Kirin được sản xuất theo tiêu chuẩn Nhật Bản, an toàn cho sức khỏe người sử dụng. Trà sữa được làm từ những lá hồng trà được tuyển chọn kỹ càng kết hợp hoàn hảo với sữa mang đến ly trà sữa ngọt ngào, thanh mát, hương vị hoà quyện, lôi cuốn. Trà sữa được đóng chai tiện lợi sử dụng, là thức uống giải khát, thư giãn hiệu quả.\r\nThành phần: \r\n\r\nSữa bò, đường, hồng trà, sữa bột nguyên kem, sữa bột tách béo, dextrin, muối, chất nhũ hóa, hương hồng trà tự nhiên, chất chống oxi hóa: Ascorbic Acid (L-) (E300)\r\n\r\nHướng dẫn sử dụng: \r\n\r\nLắc đều trước khi dùng. Các thành phần của sản phẩm có thể lắng đọng bên dưới, nhưng hoàn toàn không ảnh hưởng đến chất lượng sản phẩm.\r\n\r\nHướng dẫn bảo quản: \r\n\r\nBảo quản nơi thoáng mát. Tránh ánh nắng trực tiếp. BQ trong tủ lạnh sau khi mở nắp chai & nhanh chóng sử dụng hết.', '2019-08-01 00:00:00', 100, 9, 1, NULL),
(6, 'Trà Sữa Teh Tarik Malaysia (Túi 15 gói x 40g)', '129000.00', '189000.00', 'Trà sữa truyền thống Malaysia\r\n\r\nQuy trình sản xuất khép kín, vệ sinh\r\n\r\nKhông chứa chất độc hại\r\n\r\nĐạt chuẩn an toàn thực phẩm các nước', 'Trà Sữa Teh Tarik Malaysia (Túi 15 gói x 40g) là trà sữa truyền thống của Malaysia, là thức uống mới lạ, độc đáo đối với thị trường Việt Nam.\r\nTrà The Tarik là nét văn hóa độc đáo của Malaysia, trà có hương thơm dịu nhẹ lan tỏa khi pha, phù hợp với mọi đối tượng\r\nVới quy trình sản xuất khép kín hiện đại của Malaysia, sản phẩm cũng đạt tiêu chuẩn an toàn thực phẩm của các nước, không chứa các hóa chất độc hại ảnh hưởng đến sức khỏe người tiêu dùng.', '2019-08-01 00:00:00', 123, 9, 2, NULL),
(7, 'Trà đen Mtea', '55000.00', '55000.00', 'An toàn tiện lợi, dễ dàng pha chế, sử dụng tại nhà hoặc nơi công sở\r\n\r\nHương thơm tự nhiên, vị đậm đà\r\n\r\nTốt cho tim mạch, hỗ trợ tiêu hóa, giảm stress và tạo tinh thần sảng khoái.\r\n\r\nCó thể dùng nóng hoặc lạnh tùy theo ý thích', 'Trà đen được sản xuất theo quy trình ủ men để oxy hóa lá trà, làm cho trà có màu đen và nước có màu nâu đặc trưng (mọi người hay gọi là Hồng Trà).\r\nĐược lấy từ vùng trà nổi tiếng Bảo Lộc – Lâm Đồng với quy trình sản xuất đảm bảo chất lượng.\r\nTốt cho tim mạch, hỗ trợ tiêu hóa, giảm stress và tạo tinh thần sảng khoái. \r\nHướng dẫn sử dụng: Cho 30gr trà vào 700ml nước sôi, để khoảng 20-30 phút. Sau đó lọc lấy nước, cho sữa và đường vào tùy theo khẩu vị.\r\nĐể tăng sự thơm ngon nên cho vào ngăn mát tủ lạnh từ 2-3 giờ', '2019-08-02 00:00:00', 12, 9, 3, NULL),
(9, 'Cafe hạt rang bơ', '185000.00', '198000.00', 'Cafe đã thơm nay còn thơm hơn', '', '2019-07-20 10:04:45', 195, 13, 1, 3),
(10, 'Trà hoa bưởi', '115000.00', '110000.00', 'Trà hoa bưởi thiên nhiên', '', '2019-07-20 10:04:45', 200, 9, 1, 4),
(12, 'Trà Diếp Cá Mát Gan Giải Độc Orihiro (60 Túi / Gói)', '300000.00', '300000.00', 'Mang lại niềm vui mới', 'Trà diếp cá có tính hàn hơi lạnh, giúp thanh nhiệt giải độc cho cơ thể, mát gan\r\n\r\nLàm chậm quá trình lão hóa, giảm sản sinh hắc sắc tố melanin\r\n\r\nGiúp kích thích tiêu hóa, cân bằng nội tiết tố cơ thể giúp duy trì sức khoẻ, sắc đẹp', '2019-07-09 00:00:00', 54, 9, 2, NULL),
(16, 'Bộ 2 hộp Trà Lài Túi Lọc Phúc Long hộp 25 gói x 2 g', '100000.00', '100000.00', 'TRÀ LÀI là sự kết hợp hoàn hảo giữa lá trà xanh chất lượng cao và hương hoa lài.\r\n\r\nTrà có mùi thơm tự nhiên của hoa lài, màu vàng đẹp, vị ngọt của hoa lài và vị đắng nhẹ của trà\r\n\r\nTrà được đóng gói dạng túi lọc tiện lợi', 'TRÀ LÀI là sự kết hợp hoàn hảo giữa lá trà xanh chất lượng cao và hương hoa lài. Trà có mùi thơm tự nhiên của hoa lài, màu vàng đẹp, vị ngọt của hoa lài và vị đắng nhẹ của trà tạo nên cảm giác khoan khoái và thư giãn cho người dùng.\r\n\r\nTrà được đóng gói dạng túi lọc tiện lợi\r\n\r\nCách pha trà: Cho gói trà vào tách, đổ nước sôi vào. Ngâm khoảng 2 - 3 phút, nhúng gói trà 5 lần rồi lấy ra. Giờ bạn có thể thưởng thức\r\n\r\nBảo quản: Nơi khô ráo, thoáng mát', '2019-07-01 00:00:00', 56, 9, 3, 1),
(18, 'Cà Phê Hòa Tan Sữa Đá Legend Trung Nguyên (9 Gói x 25g)', '90000.00', '90000.00', 'Nguyên liệu tốt nhất tại Việt Nam: Arabica Cầu Đất + Robusta Buôn Ma Thuột', 'Cà Phê Hòa Tan Sữa Đá Legend Trung Nguyên (9 Gói x 25g) - Đúng vị cà phê sữa đá thơm ngon như cà phê sữa đá pha phin.\r\nCà phê sữa đá Trung Nguyên Legend là phiên bản đặc biệt, đóng gói công thức ly cà phê năng lượng sữa đá pha phin. Cùng với sự khác biệt, đặc biệt của hệ sản phẩm cà phê năng lượng mới. \r\nTrung Nguyên Legend Café Sữa Đá kết hợp được công nghệ rang xay nano siêu mịn cùng công nghệ sấy khô kem đặc có đường chuyên dùng cho cà phê độc quyền của Trung Nguyên Legend để tạo nên ly cà phê sữa đá đậm vị rang xay.\r\nTuyệt phẩm này được Trung Nguyên Legend nghiên cứu, phát triển dành riêng cho khách hàng khi không có thời gian đến thưởng thức tuyệt phẩm cà phê năng lượng sữa đá tại các Không gian Trung Nguyên Legend.\r\nVới tuyệt phẩm Cà phê sữa đá Trung Nguyên Legend , khách hàng có thể tự pha cho mình ly cà phê năng lượng sữa đá tuyệt ngon tại nhà, tại văn phòng làm việc hay ở bất kỳ nơi đâu. Hơn nữa, với việc đóng gói trọn vẹn hương vị của ly cà phê sữa đá nổi tiếng, niềm tự hào của Việt Nam với thế giới, tuyệt phẩm cà phê năng lượng Cà phê sữa đá Trung Nguyên Legend  sẽ là quà tặng đặc biệt dành tặng cho những người thân phương xa, bạn bè quốc tế yêu ly cà phê Việt Nam, dành tình cảm cho văn hóa, đất nước Việt Nam.', '2019-06-05 00:00:00', 100, 10, 2, 1),
(20, 'Cà Phê Sữa G7 3in1 Trung Nguyên (50 Gói)', '140000.00', '140000.00', 'Bao bì sản phẩm có thể thay đổi theo Nhà cung cấp\r\n\r\nCà phê được pha chế theo bí quyết của Trung Nguyên\r\n\r\nHương vị thơm ngon, bổ dưỡng\r\n\r\nSản phẩm dạng hòa tan pha chế nhanh chóng', 'Cà Phê Sữa G7 3in1 Trung Nguyên (50 Gói) chiết xuất trực tiếp từ những hạt cà phê sạch, thuần khiết từ vùng đất đỏ bazan huyền thoại Buôn Ma Thuột kết hợp với công nghệ rang và trung tâm điều khiển tại Đức, Trung Nguyên đã tạo ra một loại cà phê sữa G7 thứ thiệt thơm lừng, tuyệt ngon.\r\nSản phẩm đem đến cho bạn sản phẩm cà phê sữa hòa tan với vị đắng gắt, mùi thơm dịu nhẹ pha mùi thơm đậm.\r\nCái hay ho của cà phê là ở vị đắng, có lẽ thế. Vị đắng mà thậm chí con người ta có cố pha sữa vào bao nhiêu đi chăng nữa vẫn không thể làm mất đi cái mùi vị ấy.\r\nUống từ 1 đến 2 ly cà phê mỗi ngày có thể giúp cơ thể sảng khoái, linh hoạt. Thật thú vị khi cùng ngồi với vài người bạn thân bên ly cà phê bốc khói vào những buổi sáng sớm.\r\nHương thơm, vị đắng và sự ấm áp của cà phê nóng kích thích những đầu dây thần kinh từ đầu lưỡi đến dạ dày nhanh chóng lan toả cảm giác sảng khoái toàn khắp cơ thể.\r\nNhấm nháp từng ngụm cà phê, lần giở từng trang báo mới vào mỗi buổi sáng thật nhàn nhã. Sản phẩm mang đến sự tiện lợi cho người sử dụng, giúp những người thích cà phê sữa đúng vị có được một ly cà phê sữa như ý nhưng vẫn tiết kiệm được thời gian.\r\n', '2019-07-17 00:00:00', 45, 16, 2, 2),
(21, 'Cà Phê Cappuccino Hoà Tan Dừa DakMark (10 Gói x 17g)', '42000.00', '42000.00', 'Mùi vị thơm ngon đặc trưng\r\n\r\nThưởng thức cà phê tuyệt vời bất cứ nơi nào, bất cứ lúc nào\r\n\r\nĐược sản xuất trên quy trình hiện đại', 'Cà Phê Cappuccino Hoà Tan Dừa DakMark là sự kết hợp độc đáo của cà phê Tây Nguyên và dừa tươi ngon của miền Tây sống nước.\r\nCông thức chế biến đặc biệt cho ra cà phê cappuccino dừa hoà tan thơm ngon giữ được hương vị của cà phê cappuccino dừa hoà tan bắt đầu một ngày mới tràn đầy năng lượng.\r\nLà loại thức uống lý tưởng dành cho những người bận rộn. Chỉ cần một vài phút ngắn ngủi là bạn có thể dễ dàng tự pha cho mình một ly cà phê để thưởng thức hoặc chiêu đãi bạn bè, người thân.\r\nĐược đóng trong hộp nhỏ gọn, thích hợp sử dụng trong mọi gia đình, văn phòng làm việc...', '2019-05-09 00:00:00', 87, 16, 2, 3),
(22, 'Cà Phê Chế Phin 1 Trung Nguyên (500g)', '95000.00', '95000.00', 'Được làm từ hạt cà phê nguyên chất\r\n\r\nVị đậm đà, mùi thơm dịu nhẹ\r\n\r\nChuyên dùng cho các quán cà phê', 'Cà Phê Chế Phin 1 Trung Nguyên (500g) được làm từ hạt cà phê nguyên chất, có vị đắng hơi gắt, mùi thơm nhẹ. Chỉ bằng vài thao tác đơn giản, bạn có thể dễ dàng pha chế theo khẩu vị ưa thích.\r\nCà phê có màu nước nâu sánh, hương thơm lâu, vị đậm đà sẽ mang đến cho bạn tách cà phê tuyệt hảo và đáp ứng nguồn năng lượng sáng tạo để bạn thực hiện những giấc mơ.\r\nCà phê được sản xuất trên dây chuyền khép kín, đáp ứng tiêu chuẩn chất lượng cao. Sản phẩm không chứa hóa chất hay chất bảo quản, đảm bảo an toàn cho sức khỏe người dùng.', '2019-07-24 00:00:00', 123, 17, 2, 4),
(23, 'Cà Phê Chồn Túi Lọc Cacoa Indochine (Hộp 10 Gói x 15g)', '190000.00', '190000.00', 'Mùi vị thơm ngon, đậm đà\r\n\r\nHương thơm nồng nàn lan tỏa khi pha\r\n\r\nDễ pha chế và bảo quản\r\n\r\nĐảm bảo an toàn vệ sinh thực phẩm', 'Cà Phê Chồn Túi Lọc Cacoa Indochine (Hộp 10 Gói x 15g) có mùi vị thơm ngon, giàu dinh dưỡng và hương thơm nồng nàn, ngây ngất sẽ giúp bạn thư giãn tinh thần và tỉnh táo hơn.\r\nQuy trình sản xuất khép kín và độc đáo: Hạt cà phê chín và ngon nhất được chọn qua khứu giác và vị giác của những chú chồn. Dưới tác dụng lên men của các Enzym trong dạ dày của chồn, mùi vị của cà phê được biến đổi, tạo ra hương vị đậm đà, thơm ngon và khác biệt so với các loại cà phê khác.\r\nBổ sung nhiều Vitamin và khoáng chất cho cơ thể.\r\nKhông chứa đường hóa học, không sử dụng các hóa chất độc hại và đã qua kiểm nghiệm đảm bảo an toàn cho sức khỏe của người dùng.\r\nDạng túi lọc đóng hộp nhỏ gọn và tiện lợi, dễ dàng mang theo trong những chuyến dã ngoại, đi chơi hoặc sử dụng tại văn phòng.\r\n', '2019-08-01 00:00:00', 90, 12, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham_dondathang`
--

CREATE TABLE `sanpham_dondathang` (
  `sp_ma` int(11) NOT NULL,
  `dh_ma` int(11) NOT NULL,
  `sp_dh_soluong` int(11) NOT NULL,
  `sp_dh_dongia` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chudegopy`
--
ALTER TABLE `chudegopy`
  ADD PRIMARY KEY (`cdgy_ma`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`dh_ma`),
  ADD KEY `dondathang_khachhang_idx` (`kh_tendangnhap`),
  ADD KEY `dondathang_hinhthucthanhtoan_idx` (`httt_ma`);

--
-- Indexes for table `gopy`
--
ALTER TABLE `gopy`
  ADD PRIMARY KEY (`gy_ma`),
  ADD KEY `gopy_chudegopy_idx` (`cdgy_ma`);

--
-- Indexes for table `hinhsanpham`
--
ALTER TABLE `hinhsanpham`
  ADD PRIMARY KEY (`hsp_ma`),
  ADD KEY `fk_hinhsanpham_sanpham1_idx` (`sp_ma`);

--
-- Indexes for table `hinhthucthanhtoan`
--
ALTER TABLE `hinhthucthanhtoan`
  ADD PRIMARY KEY (`httt_ma`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`kh_tendangnhap`);

--
-- Indexes for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`km_ma`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`lsp_ma`);

--
-- Indexes for table `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  ADD PRIMARY KEY (`nsx_ma`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`sp_ma`),
  ADD KEY `sanpham_loaisanpham_idx` (`lsp_ma`),
  ADD KEY `sanpham_nhasanxuat_idx` (`nsx_ma`),
  ADD KEY `sanpham_khuyenmai_idx` (`km_ma`);

--
-- Indexes for table `sanpham_dondathang`
--
ALTER TABLE `sanpham_dondathang`
  ADD PRIMARY KEY (`sp_ma`,`dh_ma`),
  ADD KEY `sanpham_donhang_sanpham_idx` (`sp_ma`),
  ADD KEY `sanpham_donhang_dondathang_idx` (`dh_ma`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dondathang`
--
ALTER TABLE `dondathang`
  MODIFY `dh_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hinhsanpham`
--
ALTER TABLE `hinhsanpham`
  MODIFY `hsp_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `hinhthucthanhtoan`
--
ALTER TABLE `hinhthucthanhtoan`
  MODIFY `httt_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `km_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `lsp_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `nhasanxuat`
--
ALTER TABLE `nhasanxuat`
  MODIFY `nsx_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `sp_ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `dondathang_hinhthucthanhtoan` FOREIGN KEY (`httt_ma`) REFERENCES `hinhthucthanhtoan` (`httt_ma`),
  ADD CONSTRAINT `dondathang_khachhang` FOREIGN KEY (`kh_tendangnhap`) REFERENCES `khachhang` (`kh_tendangnhap`);

--
-- Constraints for table `gopy`
--
ALTER TABLE `gopy`
  ADD CONSTRAINT `gopy_chudegopy` FOREIGN KEY (`cdgy_ma`) REFERENCES `chudegopy` (`cdgy_ma`) ON UPDATE CASCADE;

--
-- Constraints for table `hinhsanpham`
--
ALTER TABLE `hinhsanpham`
  ADD CONSTRAINT `fk_hinhsanpham_sanpham1` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_khuyenmai` FOREIGN KEY (`km_ma`) REFERENCES `khuyenmai` (`km_ma`),
  ADD CONSTRAINT `sanpham_loaisanpham` FOREIGN KEY (`lsp_ma`) REFERENCES `loaisanpham` (`lsp_ma`),
  ADD CONSTRAINT `sanpham_nhasanxuat` FOREIGN KEY (`nsx_ma`) REFERENCES `nhasanxuat` (`nsx_ma`);

--
-- Constraints for table `sanpham_dondathang`
--
ALTER TABLE `sanpham_dondathang`
  ADD CONSTRAINT `sanpham_donhang_dondathang` FOREIGN KEY (`dh_ma`) REFERENCES `dondathang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanpham_donhang_sanpham` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
