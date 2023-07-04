import 'package:flutter/material.dart';
import 'package:healthy_life/service/polahidup_service.dart';
import 'package:healthy_life/ui/polahidup/polahidup_item.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/ui/polahidup/polahidup_page.dart';
import 'package:healthy_life/ui/polahidup/polahidup_update.dart';

class PolahidupDetail extends StatefulWidget {
  final Polahidup polahidup;

  const PolahidupDetail({Key? key, required this.polahidup}) : super(key: key);
  _PolahidupDetailState createState() => _PolahidupDetailState();
}

class _PolahidupDetailState extends State<PolahidupDetail> {
  Stream<Polahidup> getData() async* {
    Polahidup data =
        await PolahidupService().getById(widget.polahidup.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "DETAIL JADWAL POLA HIDUP",
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
                "${snapshot.data.hari}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Notoserif",
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "JADWAL",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Fonlato"),
              ),
              SizedBox(height: 20),
              Text(
                "${snapshot.data.one}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.two}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.three}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.four}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.five}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.six}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.seven}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.eight}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.nine}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${snapshot.data.ten}",
                style: TextStyle(fontSize: 20),
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
                          PolahidupUpdateForm(polahidup: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.pink),
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
                          await PolahidupService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PolahidupPage()));
                          });
                        },
                        child: const Text("YA"),
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
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
