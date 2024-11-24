class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _slt;
  bool _trangThai;

  DienThoai(
      String _maDT,
      String this._tenDT,
      String this._hangSX,
      double this._giaNhap,
      double this._giaBan,
      int this._slt,
      bool this._trangThai)
      : this._maDT = _kiemTraMaDT(_maDT)
            ? _maDT
            : throw ArgumentError('Mã điện thoại không hợp lệ');

  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get slt => _slt;
  bool get trangThai => _trangThai;

  set maDT(String maDT) {
    _maDT = maDT.isNotEmpty &&
            maDT.startsWith('HD-') &&
            maDT.length == 6 &&
            int.tryParse(maDT.substring(3)) != null
        ? maDT
        : _maDT;
  }

  set tenDT(String tenDT) {
    _tenDT = tenDT.isNotEmpty ? tenDT : _tenDT;
  }

  set hangSX(String hangSX) {
    _hangSX = hangSX.isNotEmpty ? hangSX : _hangSX;
  }

  set giaNhap(double giaNhap) {
    _giaNhap = giaNhap > 0 ? giaNhap : _giaNhap;
  }

  set giaBan(double giaBan) {
    _giaBan = giaBan > 0 && giaBan > _giaNhap ? giaBan : _giaBan;
  }

  set slt(int slt) {
    _slt = slt >= 0 ? slt : _slt;
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  double tinhLoiNhuanDK() {
    return (_giaBan - _giaNhap) * _slt;
  }

  void displayInfo() {
    print('ID: $_maDT');
    print('Tên: $_tenDT');
    print('Hãng sản xuất: $_hangSX');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng: $_slt');
    print('Trạng thái: ${_trangThai ? 'Còn hàng' : 'Hết hàng'}');
    print('Lợi nhuận: ${tinhLoiNhuanDK()}');
  }

  bool coTheBan() {
    return _trangThai && _slt > 0;
  }

  static bool _kiemTraMaDT(String maDT) {
    // Định dạng phải là "DT-XXX" (XXX là số)
    RegExp regex = RegExp(r'^DT-\d{3}$');
    return regex.hasMatch(maDT);
  }
}

void main() {
  DienThoai dt1 = DienThoai(
      "DT-001", "Samsung Galaxy S21", "Samsung", 5000000, 500000, 10, true);
  dt1.displayInfo();
  dt1.maDT = "HT-029";
  dt1.displayInfo();
}
