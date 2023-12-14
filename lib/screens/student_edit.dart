import 'package:flutter/material.dart';
import 'package:flutterprojects/models/student.dart';
import 'package:flutterprojects/validation/student_validatior.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(this.selectedStudent);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State<StudentEdit> with StudentValidationMixin {
   final Student selectedStudent;
  var formKey = GlobalKey<FormState>();

   _StudentAddState(this.selectedStudent);
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
      initialValue: selectedStudent.firstname,
      decoration: const InputDecoration(
        labelText: "Öğrenci Adı: ",
        hintText: "Sinem",
      ),
      validator: validateFirstName,
      onSaved: (String? value) {
        if (value != null) {
          selectedStudent.firstname = value.trim();
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastname,
      decoration: const InputDecoration(
        labelText: "Öğrenci Soyadı: ",
        hintText: "Şafak",
      ),
      validator: validateLastName,
      onSaved: (String? value) {
        if (value != null) {
          selectedStudent.lastname = value.trim();
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: const InputDecoration(
        labelText: "Aldığı Not: ",
        hintText: "65",
      ),
      validator: validateGrade, // Burada doğru validator'u kullanmalısınız (validateGrade?)
      onSaved: (String? value) {
        if (value != null) {
          selectedStudent.grade = int.parse(value.trim());
        }
      },
    );

  }
 Widget buildSubmitButton() {
  return ElevatedButton(
    onPressed: () {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();
        saveStudent();
        Navigator.pop(context);

      }
    },
    child: const Text("Kaydet"),
  );
}

  void saveStudent() {
    print(selectedStudent.firstname);
    print(selectedStudent.lastname);
    print(selectedStudent.grade);
  }

}
