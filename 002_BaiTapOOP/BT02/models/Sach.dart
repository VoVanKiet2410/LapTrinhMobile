class Sach {
  String _id;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon = false;

  Sach(this._id, this._tenSach, this._tacGia);

  String get id => this._id;
  String get tenSach => this._tenSach;
  String get tacGia => this._tacGia;
  bool get trangThaiMuon => this._trangThaiMuon;

  set id(String id) {
    _id = id.isNotEmpty ? id : _id;
  }

  set tenTacGia(String tenTacGia) {
    _tacGia = tenTacGia.isNotEmpty ? tenTacGia : _tacGia;
  }

  set tenSach(String tenSach) {
    _tenSach = tenSach.isNotEmpty ? tenSach : _tenSach;
  }

  set trangThaiMuon(bool trangThaiMuon) {
    _trangThaiMuon = trangThaiMuon;
  }

  void displaySach() {
    print('ID: $_id');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái mượn: ${_trangThaiMuon ? 'Đã mượn' : 'Chưa mượn'}');
  }
}
