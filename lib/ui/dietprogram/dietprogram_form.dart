import 'package:flutter/material.dart';
import 'package:healthy_life/model/dietprogram.dart';
import 'package:healthy_life/service/dietprogram_service.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_page.dart';

class DietprogramForm extends StatefulWidget {
  const DietprogramForm({Key? key}) : super(key: key);
  _DietprogramFormState createState() => _DietprogramFormState();
}

class _DietprogramFormState extends State<DietprogramForm> {
  final _formKey = GlobalKey<FormState>();
  final _jenisCtrl = TextEditingController();
  final _definisiCtrl = TextEditingController();
  final _manfaatCtrl = TextEditingController();
  final _makananCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "TAMBAH DIET PROGRAM",
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              _fieldjenis(),
              SizedBox(height: 20),
              _fielddefinisi(),
              SizedBox(height: 20),
              _fieldmanfaat(),
              SizedBox(height: 20),
              _fieldmakanan(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldjenis() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jenis"),
      controller: _jenisCtrl,
    );
  }

  _fielddefinisi() {
    return TextField(
      decoration: const InputDecoration(labelText: "Definisi"),
      controller: _definisiCtrl,
    );
  }

  _fieldmanfaat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Manfaat"),
      controller: _manfaatCtrl,
    );
  }

  _fieldmakanan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Makanan"),
      controller: _makananCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Dietprogram dietprogram = new Dietprogram(
            jenis: _jenisCtrl.text,
            definisi: _definisiCtrl.text,
            manfaat: _manfaatCtrl.text,
            makanan: _makananCtrl.text,
          );
          await DietprogramService().simpan(dietprogram).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DietprogramPage()));
          });
        },
        child: const Text("Simpan"));
  }
}
