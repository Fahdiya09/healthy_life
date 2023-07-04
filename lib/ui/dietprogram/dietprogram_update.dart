import 'package:flutter/material.dart';
import 'package:healthy_life/model/dietprogram.dart';
import 'package:healthy_life/service/dietprogram_service.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_page.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_detail.dart';

class DietprogramUpdateForm extends StatefulWidget {
  final Dietprogram dietprogram;

  const DietprogramUpdateForm({Key? key, required this.dietprogram})
      : super(key: key);
  _DietprogramUpdateFormState createState() => _DietprogramUpdateFormState();
}

class _DietprogramUpdateFormState extends State<DietprogramUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _jenisCtrl = TextEditingController();
  final _definisiCtrl = TextEditingController();
  final _manfaatCtrl = TextEditingController();
  final _makananCtrl = TextEditingController();

  Future<Dietprogram> getData() async {
    Dietprogram data =
        await DietprogramService().getById(widget.dietprogram.id.toString());
    setState(() {
      _jenisCtrl.text = data.jenis;
      _definisiCtrl.text = data.definisi;
      _manfaatCtrl.text = data.manfaat;
      _makananCtrl.text = data.makanan;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "UBAH DIET PROGRAM",
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
              _tombolSimpan(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _fieldjenis() {
    return TextField(
      decoration: const InputDecoration(labelText: "jenis"),
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
      decoration: const InputDecoration(labelText: "mManfaat"),
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
          String id = widget.dietprogram.id.toString();
          await DietprogramService().ubah(dietprogram, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DietprogramPage()));
          });
        },
        style: ElevatedButton.styleFrom(primary: Colors.pink),
        child: const Text("Simpan Perubahan"));
  }
}
