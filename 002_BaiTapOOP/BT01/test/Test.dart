import '../models/Class.dart';
import '../models/Student.dart';

void main() {
  var student = Student("Nguyen Van A", 22, "2180607674", 8.5);
  print('Name\'s getter: ${student.name}');
  student.name = "Nguyen Van B";
  print('After set: ${student.name}');
  print('Rank: ${student.displayRank()}');
  print("----------------------------------------------------------------");
  Class classB = Class("21DTHD5");
  classB.addStudent(Student("Nguyen Van B", 22, "2180607674", 8.5));
  classB.addStudent(Student("Nguyen Van C", 22, "2180607674", 4));
  classB.addStudent(Student("Nguyen Van D", 22, "2180607674", 5));
  classB.addStudent(Student("Nguyen Van E", 22, "2180607674", 5.5));
  classB.displayStudents();
}
