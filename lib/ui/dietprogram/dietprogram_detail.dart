import 'package:flutter/material.dart';
import 'package:healthy_life/model/dietprogram.dart';
import 'package:healthy_life/service/dietprogram_service.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_update.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_item.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_page.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_update.dart';

class DietprogramDetail extends StatefulWidget {
  final Dietprogram dietprogram;

  const DietprogramDetail({Key? key, required this.dietprogram})
      : super(key: key);
  _DietprogramDetailState createState() => _DietprogramDetailState();
}

class _DietprogramDetailState extends State<DietprogramDetail> {
  Stream<Dietprogram> getData() async* {
    Dietprogram data =
        await DietprogramService().getById(widget.dietprogram.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "DETAIL DIET PROGRAM",
          style: TextStyle(color: Colors.white, fontFamily: "NotoSerif"),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.blue,
                Colors.pink,
              ])),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "${snapshot.data.jenis}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Notoserif",
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "DEFINISI",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Fonlato"),
              ),
              Text(
                "${snapshot.data.definisi}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Notoserif",
                ),
              ),
              SizedBox(height: 20),
              Text(
                "MANFAAT",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Fonlato"),
              ),
              Text(
                "${snapshot.data.manfaat}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Notoserif",
                ),
              ),
              SizedBox(height: 20),
              Text(
                "MAKANAN",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Fonlato"),
              ),
              Text(
                "${snapshot.data.makanan}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Notoserif",
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DietprogramUpdateForm(dietprogram: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await DietprogramService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DietprogramPage()));
                          });
                        },
                        child: const Text("YA"),
                        style: ElevatedButton.styleFrom(primary: Colors.pink),
                      )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
                style: ElevatedButton.styleFrom(primary: Colors.pink),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        child: const Text("Hapus"));
  }
}
