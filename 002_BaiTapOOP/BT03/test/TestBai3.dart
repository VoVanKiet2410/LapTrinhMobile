import '../models/NhanVien.dart';
import '../models/NhanVienBanHang.dart';

void main() {
  // Test nhân viên thường
  var nv = NhanVien('NV001', 'Nguyễn Văn A', 5000000);
  print('Thông tin nhân viên thường:');
  nv.displayInfo();

  // Test nhân viên bán hàng
  var nv_BH = NhanVienBanHang('NV002', 'Phạm Thị B', 5000000, 100000000, 0.02);
  print('\nThông tin nhân viên bán hàng:');
  nv_BH.displayInfo();

  // Test setter
  nv_BH.doanhSo = 150000000;
  print('\nSau khi tăng doanh số:');
  nv_BH.displayInfo();

  // Test tính đa hình
  List<NhanVien> danhSachNV = [nv, nv_BH];
  print('\nHiển thị danh sách nhân viên:');
  for (var nhanVien in danhSachNV) {
    nhanVien.displayInfo();
    print('');
  }
}
