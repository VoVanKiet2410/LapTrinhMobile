import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCH;
  String _diaChi;
  List<DienThoai> _danhSachDT = [];
  List<HoaDon> _danhSachHD = [];

  CuaHang(this._tenCH, this._diaChi);

  String get tenCuaHang => _tenCH;
  String get diaChi => _diaChi;

  void themDienThoai(DienThoai dienThoai) {
    _danhSachDT.add(dienThoai);
  }

  void capNhatThongTinDienThoai(String maDT, DienThoai dtMoi) {
    for (var dt in _danhSachDT) {
      if (dt.maDT == maDT) {
        dt.tenDT = dtMoi.tenDT;
        dt.hangSX = dtMoi.hangSX;
        dt.giaNhap = dtMoi.giaNhap;
        dt.giaBan = dtMoi.giaBan;
        dt.slt = dtMoi.slt;
        dt.trangThai = dtMoi.trangThai;
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã: $maDT");
  }

  void ngungKinhDoanhDienThoai(String maDT) {
    for (var dt in _danhSachDT) {
      if (dt.maDT == maDT) {
        dt.trangThai = false;
        return;
      }
    }
    print("Không tìm thấy điện thoại có mã: $maDT");
  }

  List<DienThoai> timKiemDienThoai(String tuKhoa) {
    return _danhSachDT.where((dt) {
      return dt.maDT.contains(tuKhoa) ||
          dt.tenDT.contains(tuKhoa) ||
          dt.hangSX.contains(tuKhoa);
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    if (_danhSachDT.isEmpty) {
      print("Không có điện thoại nào trong danh sách.");
      return;
    }
    for (var dt in _danhSachDT) {
      dt.displayInfo();
    }
  }

  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua > hoaDon.dienThoai.slt) {
      print("Không đủ hàng tồn kho để tạo hóa đơn.");
      return;
    }
    hoaDon.dienThoai.slt -= hoaDon.soLuongMua;
    _danhSachHD.add(hoaDon);
  }

  List<HoaDon> timKiemHoaDon({String? ma, DateTime? ngay, String? khachHang}) {
    return _danhSachHD.where((hd) {
      return (ma == null || hd.maHD.contains(ma)) &&
          (ngay == null || hd.ngayBan.isAtSameMomentAs(ngay)) &&
          (khachHang == null || hd.tenKH.contains(khachHang));
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    if (_danhSachHD.isEmpty) {
      print("Không có hóa đơn nào trong danh sách.");
      return;
    }
    for (var hd in _danhSachHD) {
      hd.displayInfo();
    }
  }

  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    double S = 0.0;
    for (int i = 0; i < _danhSachHD.length; i++) {
      if (tuNgay.isBefore(_danhSachHD[i].ngayBan) &&
          denNgay.isAfter(_danhSachHD[i].ngayBan)) {
        S += _danhSachHD[i].tinhTongTien();
      }
    }
    return S;
    // return _danhSachHD
    //     .where(
    //         (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
    //     .map((hd) => hd.tinhTongTien())
    //     .reduce((a, b) => a + b);
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    double tongLoiNhuan = 0.0;
    for (int i = 0; i < _danhSachHD.length; i++) {
      var hd = _danhSachHD[i];
      if (hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay)) {
        tongLoiNhuan += hd.tinhLoiNhuanThucTe();
      }
    }
    return tongLoiNhuan;
    // Sử dụng
    // return _danhSachHD
    //     .where(
    //         (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
    //     .map((hd) => hd.tinhLoiNhuanThucTe())
    //     .reduce((a, b) => a + b);
  }

  DienThoai? thongKeTopBanChay() {
    List<DienThoai> danhSachDT = [];
    List<int> danhSachSoLuong = [];
    for (var hd in _danhSachHD) {
      int index = danhSachDT.indexOf(hd.dienThoai);
      if (index != -1) {
        danhSachSoLuong[index] += hd.soLuongMua;
      } else {
        danhSachDT.add(hd.dienThoai);
        danhSachSoLuong.add(hd.soLuongMua);
      }
    }

    if (danhSachDT.isEmpty) {
      return null;
    }
    int maxSoLuong = danhSachSoLuong[0];
    int maxIndex = 0;
    for (int i = 1; i < danhSachSoLuong.length; i++) {
      if (danhSachSoLuong[i] > maxSoLuong) {
        maxSoLuong = danhSachSoLuong[i];
        maxIndex = i;
      }
    }
    return danhSachDT[maxIndex];
    // Sử dụng Map và Arrow Syntax
    // Map<DienThoai, int> banChay = {};
    // for (var hd in _danhSachHD) {
    //   if (banChay.containsKey(hd.dienThoai)) {
    //     banChay[hd.dienThoai] = (banChay[hd.dienThoai] ?? 0) + hd.soLuongMua;
    //   } else {
    //     banChay[hd.dienThoai] = hd.soLuongMua;
    //   }
    // }
    // if (banChay.isEmpty) return null;
    // return banChay.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    // Map<DienThoai, int> banChay = {};
    // for (var hd in _danhSachHD) {
    //   if (banChay.containsKey(hd.dienThoai)) {
    //     banChay[hd.dienThoai] = (banChay[hd.dienThoai] ?? 0) + hd.soLuongMua;
    //   } else {
    //     banChay[hd.dienThoai] = hd.soLuongMua;
    //   }
    // }
    // if (banChay.isEmpty) return null;
    // return banChay.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  void thongKeTonKho() {
    print("Thống kê tồn kho:");
    for (var dt in _danhSachDT) {
      print("Tên: ${dt.tenDT}, Số lượng tồn: ${dt.slt}");
    }
  }
}
