class NhanVien {
  String _id;
  String _hoTen;
  double _luongCB;

  NhanVien(this._id, this._hoTen, this._luongCB);

  String get id => _id;
  String get hoTen => _hoTen;
  double get luongCB => _luongCB;

  set id(String id) {
    _id = id.isNotEmpty ? id : _id;
  }

  set hoTen(String hoTen) {
    _hoTen = hoTen.isNotEmpty ? hoTen : _hoTen;
  }

  set luongCB(double luongCB) {
    _luongCB = luongCB > 0 ? luongCB : _luongCB;
  }

  double tinhLuong() {
    return _luongCB;
  }

  void displayInfo() {
    print(
        'ID: $_id --- Họ tên: $_hoTen --- Lương cơ bản: $_luongCB --- Lương: ${tinhLuong()}');
  }
}
