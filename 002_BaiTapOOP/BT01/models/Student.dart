class Student {
  String _name;
  int _age;
  String _id;
  double _avgScore;

  Student(this._name, this._age, this._id, this._avgScore);

  // Getter for Student
  String get name => _name;
  int get age => _age;
  String get id => _id;
  double get avgScore => _avgScore;

  // Setter for Student
  set name(String name) {
    _name = name.isNotEmpty ? name : _name;
  }

  set age(int age) {
    _age = age > 0 ? age : _age;
  }

  set id(String id) {
    _id = id.isNotEmpty ? id : _id;
  }

  set avgScore(double avgScore) {
    _avgScore = avgScore > 0 && avgScore < 100 ? avgScore : _avgScore;
  }

  void displayStudent() {
    print("Name: $_name");
    print("Age: $_age");
    print("ID: $_id");
    print("Avg Score: $_avgScore");
  }

  String displayRank() {
    if (_avgScore >= 8.0) {
      return "Gioi";
    }
    if (_avgScore >= 6.5) {
      return "Kha";
    }
    if (_avgScore >= 5.0) {
      return "Trung Binh";
    }
    return "Yeu";
  }
}


