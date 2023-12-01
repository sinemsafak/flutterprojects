import 'package:flutter/material.dart';
import 'package:flutterprojects/models/student.dart';

void main() {
  String mesaj = "Öğrenci Takip Sistemi";
  runApp(MaterialApp(
    home: MyApp(mesaj: mesaj),
  ));
}

class MyApp extends StatefulWidget {
  final String mesaj;
  MyApp({required this.mesaj});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String seciliOgrenci = "abc";

  List<Student> students = [
    Student("Sinem", "Şafak", 25),
    Student("Kerem", "Varış", 65),
    Student("Halil", "Duymaz", 45)
  ];

  var ogrenciler = [
    "Sinem Şafak",
    "Engin Demiroğ",
    "Berkay Bilgin",
    "Murat Kurtboğan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj2 = "";
    if (puan >= 50) {
      mesaj2 = "geçti";
    } else if (puan >= 40) {
      mesaj2 = "bütünlemeye kaldı";
    } else {
      mesaj2 = "kaldı";
    }
    return mesaj2;
  }

  void mesajGoster(BuildContext context, String mesaj2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sınav Sonucu"),
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
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2023/11/01/11/12/hallstatt-8357170_1280.jpg"),
                    ),
                    title: Text(students[index].firstname +
                        " " +
                        students[index].lastname),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        //yeniden çizme sağlanır
                        seciliOgrenci = students[index].firstname +
                            " " +
                            students[index].lastname;
                      });

                      print(seciliOgrenci);
                    },
                  );
                })),
        Text("Seçili Öğrenci:" + seciliOgrenci),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                      child: Container(
                        color: Colors.amberAccent,
                      ),
                    ),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(85);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(85);
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                      child: Container(
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text("Silme"),
                  ],
                ),
                onPressed: () {
                  var mesaj = sinavHesapla(85);
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
