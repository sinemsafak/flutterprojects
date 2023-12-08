import 'package:flutter/material.dart';
import 'package:flutterprojects/models/student.dart';
import 'package:flutterprojects/validation/student_validatior.dart';

class StudentAdd extends StatefulWidget {
  const StudentAdd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  var student = Student.withoutInfo();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // Burada form başarıyla onaylandı, istediğiniz işlemleri gerçekleştirebilirsiniz.
                    // Örneğin, öğrenciyi bir listeye ekleyebilir veya başka bir işlem yapabilirsiniz.
                  }
                },
                child: const Text("Kaydet"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
