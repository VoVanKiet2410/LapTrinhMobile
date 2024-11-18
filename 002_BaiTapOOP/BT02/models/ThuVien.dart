import 'DocGia.dart';
import 'Sach.dart';

class Thuvien {
  List<Sach> _sachs = [];
  List<Docgia> _docGias = [];

  List<Sach> get sachs => _sachs;
  List<Docgia> get docGias => _docGias;

  void addSach(Sach sach) {
    _sachs.add(sach);
  }

  void addDocGia(Docgia docGia) {
    _docGias.add(docGia);
  }

  void displaySachs() {
    print("Danh sách sách");
    if (_sachs.isEmpty) {
      print("Danh sách sách rỗng!");
    } else {
      // _sachs.forEach((sach) => print(sach.tenSach));
      for (var sach in _sachs) {
        print(sach.tenSach);
      }
    }
  }
}
