import '../models/DocGia.dart';
import '../models/Sach.dart';
import '../models/ThuVien.dart';

void main() {
  Thuvien thuVien = Thuvien();
  Sach sach1 = Sach("S001", "About Dart", "Nguyễn Văn A");
  Sach sach2 = Sach("S002", "About Flutter", "Nguyễn Văn B");
  Sach sach3 = Sach("S002", "About Java", "Nguyễn Văn C");

  print("Add và hiển thị danh sách sách");
  thuVien.addSach(sach1);
  thuVien.addSach(sach2);
  thuVien.addSach(sach3);
  thuVien.displaySachs();

  Docgia docGia1 = Docgia("DG001", "Nguyễn Văn C");
  Docgia docGia2 = Docgia("DG002", "Nguyễn Văn D");

  print("------Đọc giả 1 mượn sách------");
  thuVien.addDocGia(docGia1);
  docGia1.muonSach(sach1);
  docGia1.muonSach(sach2);

  print("------Đọc giả 2 mượn sách------");
  thuVien.addDocGia(docGia2);
  docGia2.muonSach(sach2);
  docGia2.muonSach(sach3);

  print("------Hiển thị thông tin 2 Đọc giả------");
  docGia1.displayInfo();
  docGia2.displayInfo();

  print("------Đọc giả 1 trả sách------");
  docGia1.traSach(sach2);

  print("------Đọc giả 2 mượn sách------");
  docGia2.muonSach(sach2);

  print("------Hiển thị thông tin 2 Đọc giả------");
  docGia1.displayInfo();
  docGia2.displayInfo();
}
