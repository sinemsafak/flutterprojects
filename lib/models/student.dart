class Student {
  int id = 0;
  String firstname = "";
  String lastname = "";
  int grade = 0;
  String _status = "";

  Student.withId(int id, String firstname, String lastname, int grade) {
    this.id = id;
    this.firstname = firstname;
    this.lastname = lastname;
    this.grade = grade;
  }

  Student(String firstname, String lastname, int grade) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.grade = grade;
  }

  Student.withoutInfo() {}

  String get getFirstName {
    return "OGR -" + this.firstname;
  }

  void set setFirstName(String value) {
    this.firstname = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade >= 40) {
      message = "bütünlemeye kaldı";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
