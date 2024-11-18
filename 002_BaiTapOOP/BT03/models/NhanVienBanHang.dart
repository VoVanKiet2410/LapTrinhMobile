import 'NhanVien.dart';

class NhanVienBanHang extends NhanVien {
  double _doanhSo;
  double _hoaHong;

  NhanVienBanHang(String maNV, String hoTen, double luongCoBan, this._doanhSo,
      this._hoaHong)
      : super(maNV, hoTen, luongCoBan);

  // Getters
  double get doanhSo => _doanhSo;
  double get hoaHong => _hoaHong;

  // Setters
  set doanhSo(double doanhSo) {
    if (doanhSo >= 0) {
      _doanhSo = doanhSo;
    }
  }

  set hoaHong(double hoaHong) {
    if (hoaHong >= 0 && hoaHong <= 1) {
      _hoaHong = hoaHong;
    }
  }

  @override
  double tinhLuong() {
    return luongCB + (_doanhSo * _hoaHong);
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Doanh số: $_doanhSo');
    print('Tỷ lệ hoa hồng: ${_hoaHong * 100}%');
  }
}
