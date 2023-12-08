class Student {
  int id = 0;
  String firstname = "";
  String lastname = "";
  int grade = 0;
  final String _status = "";

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

  Student.withoutInfo();

  String get getFirstName {
    return "OGR -$firstname";
  }

  set setFirstName(String value) {
    firstname = value;
  }

  String get getStatus {
    String message = "";
    if (grade >= 50) {
      message = "geçti";
    } else if (grade >= 40) {
      message = "bütünlemeye kaldı";
    } else {
      message = "kaldı";
    }
    return message;
  }
}
