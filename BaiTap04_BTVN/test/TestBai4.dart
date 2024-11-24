// Hàm kiểm tra lớp
import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

class TestCuaHang {
  void testQuanLyDienThoai() {
    print("\n=== Test Quản lý Điện Thoại ===");
    CuaHang cuaHang = CuaHang("Cửa Hàng ABC", "123 Đường XYZ");

    // 1. Thêm điện thoại mới
    try {
      DienThoai dt1 = DienThoai(
          "DT-001", "iPhone 14 Pro", "Apple", 20000000, 25000000, 100, true);
      cuaHang.themDienThoai(dt1);
      print("Thêm điện thoại thành công!");
    } catch (e) {
      print("Lỗi khi thêm điện thoại: $e");
    }

    // 2. Cập nhật thông tin điện thoại
    try {
      DienThoai thongTinMoi = DienThoai(
          "DT-001", "iPhone 14 Pro Max", "Apple", 22000000, 28000000, 80, true);
      cuaHang.capNhatThongTinDienThoai("DT-001", thongTinMoi);
      print("Cập nhật thông tin điện thoại thành công!");
    } catch (e) {
      print("Lỗi khi cập nhật điện thoại: $e");
    }

    // 3. Kiểm tra validation
    try {
      DienThoai dt2 = DienThoai("", "Galaxy S23", "Samsung", 15000000, 20000000,
          50, true); // Mã điện thoại rỗng
      cuaHang.themDienThoai(dt2);
    } catch (e) {
      print(e);
    }

    // Hiển thị danh sách điện thoại
    cuaHang.hienThiDanhSachDienThoai();
  }

  void testQuanLyHoaDon() {
    print("\n=== Test Quản lý Hóa Đơn ===");
    CuaHang cuaHang = CuaHang("Cửa Hàng ABC", "123 Đường XYZ");

    // Thêm điện thoại vào cửa hàng
    DienThoai dt1 = DienThoai(
        "DT-001", "iPhone 14 Pro", "Apple", 20000000, 25000000, 100, true);
    cuaHang.themDienThoai(dt1);

    // 1. Tạo hóa đơn hợp lệ
    try {
      HoaDon hd1 = HoaDon(
        "HD-001",
        dt1,
        DateTime.now(),
        10,
        25000000,
        "Nguyen Van A",
        "0123456789",
      );
      cuaHang.taoHoaDon(hd1);
      print("Tạo hóa đơn hợp lệ thành công!");
    } catch (e) {
      print("Lỗi khi tạo hóa đơn hợp lệ: $e");
    }

    // 2. Kiểm tra ràng buộc (tồn kho, validation)
    try {
      HoaDon hd2 = HoaDon(
        "HD-002",
        dt1,
        DateTime.now(),
        200, // Số lượng vượt tồn kho
        25000000,
        "Nguyen Van B",
        "0987654321",
      );
      cuaHang.taoHoaDon(hd2);
    } catch (e) {
      print("Lỗi khi kiểm tra tồn kho: $e");
    }

    // 3. Tính toán tiền và lợi nhuận
    try {
      HoaDon hd3 = HoaDon(
        "HD-003",
        dt1,
        DateTime.now(),
        5,
        25000000,
        "Nguyen Van C",
        "0901234567",
      );
      cuaHang.taoHoaDon(hd3);
      double tongTien = hd3.tinhTongTien();
      double loiNhuan = hd3.tinhLoiNhuanThucTe();
      print("Tổng tiền: $tongTien, Lợi nhuận: $loiNhuan");
    } catch (e) {
      print("Lỗi khi tính toán tiền và lợi nhuận: $e");
    }

    // Hiển thị danh sách hóa đơn
    cuaHang.hienThiDanhSachHoaDon();
  }

  void testThongKeBaoCao() {
    print("\n=== Test Thống kê Báo cáo ===");
    CuaHang cuaHang = CuaHang("Cửa Hàng ABC", "123 Đường XYZ");

    // Thêm điện thoại và hóa đơn vào cửa hàng
    DienThoai dt1 = DienThoai(
        "DT-001", "iPhone 14 Pro", "Apple", 20000000, 25000000, 100, true);
    DienThoai dt2 = DienThoai(
        "DT-002", "Galaxy S23", "Samsung", 15000000, 20000000, 50, true);
    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);

    HoaDon hd1 = HoaDon(
      "HD-001",
      dt1,
      DateTime.now().subtract(Duration(days: 2)),
      10,
      25000000,
      "Nguyen Van A",
      "0123456789",
    );
    HoaDon hd2 = HoaDon(
      "HD-002",
      dt2,
      DateTime.now().subtract(Duration(days: 1)),
      5,
      20000000,
      "Nguyen Van B",
      "0987654321",
    );
    cuaHang.taoHoaDon(hd1);
    cuaHang.taoHoaDon(hd2);

    // 1. Doanh thu theo thời gian
    try {
      DateTime tuNgay = DateTime.now().subtract(Duration(days: 3));
      DateTime denNgay = DateTime.now();
      double doanhThu = cuaHang.tinhTongDoanhThu(tuNgay, denNgay);
      print("Doanh thu từ $tuNgay đến $denNgay: $doanhThu");
    } catch (e) {
      print("Lỗi khi tính doanh thu: $e");
    }

    // 2. Lợi nhuận theo thời gian
    try {
      DateTime tuNgay = DateTime.now().subtract(Duration(days: 3));
      DateTime denNgay = DateTime.now();
      double loiNhuan = cuaHang.tinhTongLoiNhuan(tuNgay, denNgay);
      print("Lợi nhuận từ $tuNgay đến $denNgay: $loiNhuan");
    } catch (e) {
      print("Lỗi khi tính lợi nhuận: $e");
    }

    // 3. Top điện thoại bán chạy
    try {
      DienThoai? topBanChay = cuaHang.thongKeTopBanChay();
      print("Điện thoại bán chạy nhất: ${topBanChay?.tenDT}");
    } catch (e) {
      print("Lỗi khi thống kê top bán chạy: $e");
    }

    // 4. Báo cáo tồn kho
    try {
      cuaHang.thongKeTonKho();
    } catch (e) {
      print("Lỗi khi thống kê tồn kho: $e");
    }
  }
}

void main() {
  TestCuaHang test = TestCuaHang();

  // Test quản lý điện thoại
  test.testQuanLyDienThoai();

  // Test quản lý hóa đơn
  test.testQuanLyHoaDon();

  // Test thống kê báo cáo
  test.testThongKeBaoCao();
}
