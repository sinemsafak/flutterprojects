import 'package:flutter/material.dart';
import 'package:flutterprojects/models/student.dart';
import 'package:flutterprojects/screens/student_add.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Sinem", "Şafak", 40),
    Student.withId(2, "Kerem", "Varış", 65),
    Student.withId(3, "Halil", "Duymaz", 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenci Takip Sistemi"),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("İşlem Sonucu"),
          content: Text(mesaj2),
        );
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2023/11/01/11/12/hallstatt-8357170_1280.jpg"),
                ),
                title: Text("${students[index].firstname} ${students[index].lastname}"),
                subtitle: Text("Sınavdan aldığı not: ${students[index].grade} [${students[index].getStatus}]"),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedStudent = students[index];
                  });

                  print(selectedStudent.firstname);
                },
              );
            },
          ),
        ),
        Text("Seçili Öğrenci:${selectedStudent.firstname}"),
        Row(
          children: <Widget>[
            buildButton("Yeni Öğrenci", Icons.add, Colors.amberAccent, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentAdd(students)),
              );
            }),
            buildButton("Güncelle", Icons.update, Colors.blue, () {
              var mesaj = "Güncellendi";
              mesajGoster(context, mesaj);
            }),
            buildButton("Sil", Icons.delete, Colors.blueGrey, () {
              setState(() {
                students.remove(selectedStudent);
              });
              var mesaj = "Silindi${selectedStudent.firstname}";
              mesajGoster(context, mesaj);
            }),
          ],
        ),
      ],
    );
  }

  Widget buildButton(String text, IconData icon, Color color, Function() onPressed) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 4.0,
              height: 10.0,
              child: Container(
                color: color,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear);
    }
  }
}
