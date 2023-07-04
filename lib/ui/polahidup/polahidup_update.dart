import 'package:flutter/material.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/service/polahidup_service.dart';
import 'package:healthy_life/ui/polahidup/polahidup_page.dart';
import 'polahidup_detail.dart';

class PolahidupUpdateForm extends StatefulWidget {
  final Polahidup polahidup;

  const PolahidupUpdateForm({Key? key, required this.polahidup})
      : super(key: key);
  _PolahidupUpdateFormState createState() => _PolahidupUpdateFormState();
}

class _PolahidupUpdateFormState extends State<PolahidupUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _hariCtrl = TextEditingController();
  final _oneCtrl = TextEditingController();
  final _twoCtrl = TextEditingController();
  final _threeCtrl = TextEditingController();
  final _fourCtrl = TextEditingController();
  final _fiveCtrl = TextEditingController();
  final _sixCtrl = TextEditingController();
  final _sevenCtrl = TextEditingController();
  final _eightCtrl = TextEditingController();
  final _nineCtrl = TextEditingController();
  final _tenCtrl = TextEditingController();

  Future<Polahidup> getData() async {
    Polahidup data =
        await PolahidupService().getById(widget.polahidup.id.toString());
    setState(() {
      _hariCtrl.text = data.hari;
      _oneCtrl.text = data.one;
      _twoCtrl.text = data.two;
      _threeCtrl.text = data.three;
      _fourCtrl.text = data.four;
      _fiveCtrl.text = data.five;
      _sixCtrl.text = data.six;
      _sevenCtrl.text = data.seven;
      _eightCtrl.text = data.eight;
      _nineCtrl.text = data.nine;
      _tenCtrl.text = data.ten;
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
          "UBAH JADWAL POLA HIDUP",
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
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                _fieldhari(),
                SizedBox(height: 20),
                _fieldone(),
                SizedBox(height: 20),
                _fieldtwo(),
                SizedBox(height: 20),
                _fieldthree(),
                SizedBox(height: 20),
                _fieldfour(),
                SizedBox(height: 20),
                _fieldfive(),
                SizedBox(height: 20),
                _fieldsix(),
                SizedBox(height: 20),
                _fieldseven(),
                SizedBox(height: 20),
                _fieldeight(),
                SizedBox(height: 20),
                _fieldnine(),
                SizedBox(height: 20),
                _fieldten(),
                SizedBox(height: 20),
                _tombolSimpan(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldhari() {
    return TextField(
      decoration: const InputDecoration(labelText: "Hari"),
      controller: _hariCtrl,
    );
  }

  _fieldone() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 05.00"),
      controller: _oneCtrl,
    );
  }

  _fieldtwo() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 05.10"),
      controller: _twoCtrl,
    );
  }

  _fieldthree() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 06.10"),
      controller: _threeCtrl,
    );
  }

  _fieldfour() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 07.00"),
      controller: _fourCtrl,
    );
  }

  _fieldfive() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 08.00"),
      controller: _fiveCtrl,
    );
  }

  _fieldsix() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 12.00"),
      controller: _sixCtrl,
    );
  }

  _fieldseven() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 13.00"),
      controller: _sevenCtrl,
    );
  }

  _fieldeight() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 15.00"),
      controller: _eightCtrl,
    );
  }

  _fieldnine() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 18.00"),
      controller: _nineCtrl,
    );
  }

  _fieldten() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jadwal 22.00"),
      controller: _tenCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Polahidup polahidup = new Polahidup(
              hari: _hariCtrl.text,
              one: _oneCtrl.text,
              two: _twoCtrl.text,
              three: _threeCtrl.text,
              four: _fourCtrl.text,
              five: _fiveCtrl.text,
              six: _sixCtrl.text,
              seven: _sevenCtrl.text,
              eight: _eightCtrl.text,
              nine: _nineCtrl.text,
              ten: _tenCtrl.text);
          String id = widget.polahidup.id.toString();
          await PolahidupService().ubah(polahidup, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PolahidupPage()));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
