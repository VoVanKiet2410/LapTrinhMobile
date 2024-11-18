import 'Student.dart';

class Class {
  String _nameClass;
  List<Student> _students = [];

  Class(this._nameClass);

  String get nameClass => _nameClass;
  List<Student> get students => _students;

  set nameClass(String nameClass) {
    _nameClass = nameClass.isNotEmpty ? nameClass : _nameClass;
  }

  // set nameClass(String)

  void addStudent(Student student) {
    _students.add(student);
  }

  void displayStudents() {
    print("Class: ${_nameClass}");
    for (Student student in students) {
      print("---------------------------");
      student.displayStudent();
      print("---------------------------");
    }
  }
}
