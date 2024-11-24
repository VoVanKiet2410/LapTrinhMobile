import 'DienThoai.dart';

class HoaDon {
  String _maHD;
  DienThoai _dienThoai;
  DateTime _ngayBan;
  int _soLuongMua;
  double _giaBanTT;
  String _tenKH;
  String _soDTKH;

  HoaDon(
      String maHD,
      DienThoai this._dienThoai,
      DateTime this._ngayBan,
      int this._soLuongMua,
      double this._giaBanTT,
      String this._tenKH,
      String this._soDTKH)
      : this._maHD = _kiemTraMaDT(maHD)
            ? maHD
            : throw ArgumentError('Mã Hóa đơn không hợp lệ');

  String get maHD => _maHD;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  DateTime get ngayBan => _ngayBan;
  double get giaBanTT => _giaBanTT;
  String get tenKH => _soDTKH;
  String get soDTKH => _soDTKH;

  void set maHD(String maHD) {
    _maHD = maHD.startsWith('HD-') &&
            maHD.length == 6 &&
            int.tryParse(maHD.substring(3)) != null
        ? maHD
        : _maHD;
  }

  void set dienThoai(DienThoai dienThoai) {
    _dienThoai = dienThoai;
  }

  void set ngayBan(DateTime ngayBan) {
    _ngayBan = ngayBan.isAfter(DateTime.now()) ? DateTime.now() : ngayBan;
  }

  void set soLuongMua(int soLuongMua) {
    _soLuongMua = soLuongMua > 0 && soLuongMua <= _dienThoai.slt
        ? soLuongMua
        : _soLuongMua;
    _dienThoai.slt -= soLuongMua;
  }

  void set giaBanTT(double giaBanTT) {
    _giaBanTT = giaBanTT > 0 ? giaBanTT : _giaBanTT;
  }

  void set tenKH(String tenKH) {
    _tenKH = tenKH.isNotEmpty ? tenKH : _tenKH;
  }

  void set soDTKH(String soDTKH) {
    _soDTKH = soDTKH.isNotEmpty && RegExp(r"^0\d{9,10}$").hasMatch(soDTKH)
        ? soDTKH
        : _soDTKH;
  }

  double tinhTongTien() {
    return _giaBanTT * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double chiPhiNhap = _dienThoai.giaNhap * _soLuongMua;
    return tinhTongTien() - chiPhiNhap;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void displayInfo() {
    print("Mã hóa đơn: $_maHD");
    print("Ngày bán: ${_ngayBan.toLocal()}");
    print("Tên điện thoại: ${_dienThoai.tenDT}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanTT");
    print("Tên khách hàng: $_tenKH");
    print("Số điện thoại khách: $_soDTKH");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
  }

  static bool _kiemTraMaDT(String maDT) {
    // Định dạng phải là "DT-XXX" (XXX là số)
    RegExp regex = RegExp(r'^HD-\d{3}$');
    return regex.hasMatch(maDT);
  }
}
