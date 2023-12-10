import 'package:flutter/material.dart';
import 'package:flutterprojects/models/student.dart';
import 'package:flutterprojects/validation/student_validatior.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
   List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

   _StudentAddState(List<Student> students){
    this.students=students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(), 
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci Adı: ",
        hintText: "Sinem",
      ),
      validator: validateFirstName,
      onSaved: (String? value) {
        if (value != null) {
          student.firstname = value.trim();
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci Soyadı: ",
        hintText: "Şafak",
      ),
      validator: validateLastName,
      onSaved: (String? value) {
        if (value != null) {
          student.lastname = value.trim();
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Aldığı Not: ",
        hintText: "65",
      ),
      validator: validateFirstName, // Burada doğru validator'u kullanmalısınız (validateGrade?)
      onSaved: (String? value) {
        if (value != null) {
          student.grade = int.parse(value.trim());
        }
      },
    );

  }
 Widget buildSubmitButton() {
  return ElevatedButton(
    onPressed: () {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();
        students.add(student);
        saveStudent();
        Navigator.pop(context);

      }
    },
    child: const Text("Kaydet"),
  );
}

  void saveStudent() {
    print(student.firstname);
    print(student.lastname);
    print(student.grade);
  }

}
