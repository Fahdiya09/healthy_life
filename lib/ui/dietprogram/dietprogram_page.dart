import 'package:flutter/material.dart';
import 'package:healthy_life/model/dietprogram.dart';
import 'package:healthy_life/service/dietprogram_service.dart';
import 'package:healthy_life/ui/page_header.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_detail.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_form.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_item.dart';
import 'package:healthy_life/ui/widget/sidebar.dart';

class DietprogramPage extends StatefulWidget {
  const DietprogramPage({Key? key}) : super(key: key);

  _DietprogramPageState createState() => _DietprogramPageState();
}

class _DietprogramPageState extends State<DietprogramPage> {
  Stream<List<Dietprogram>> getList() async* {
    List<Dietprogram> data = await DietprogramService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "DIET PROGRAM",
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
      drawer: Sidebar(),
      body: StreamBuilder(
        stream: getList(),
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
            return Text('Data Kosong');
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return DietprogramItem(dietprogram: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DietprogramForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
