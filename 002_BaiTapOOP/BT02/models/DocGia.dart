import 'Sach.dart';

class Docgia {
  String _id;
  String _tenDG;
  List<Sach> _sachMuon = [];

  Docgia(this._id, this._tenDG);

  String get id => _id;
  String get tenDG => _tenDG;

  set id(String id) {
    _id = id.isNotEmpty ? id : _id;
  }

  set tenDG(String tenDG) {
    _tenDG = tenDG.isNotEmpty ? tenDG : _tenDG;
  }

  void muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print("Sách ${sach.tenSach} đã được mượn");
    } else {
      _sachMuon.add(sach);
      sach.trangThaiMuon = true;
      print("Đã mượn sách ${sach.tenSach}");
    }
  }

  void traSach(Sach sach) {
    if (_sachMuon.contains(sach)) {
      _sachMuon.remove(sach);
      sach.trangThaiMuon = false;
      print("Đã trả sách ${sach.tenSach}");
    } else {
      print("Không tìm thấy sách ${sach.tenSach} trong danh sách mượn");
    }
  }

  void displayInfo() {
    print("ID: $_id ------ Tên: $_tenDG");
    if (_sachMuon.isEmpty) {
      print("Danh sách mượn rỗng");
    } else {
      print("Danh sách mượn:");
      _sachMuon.forEach((sach) => print(sach.tenSach));
    }
  }
}
