import 'package:flutter/material.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/service/polahidup_service.dart';
import 'package:healthy_life/ui/polahidup/polahidup_form.dart';
import 'package:healthy_life/ui/polahidup/polahidup_item.dart';
import 'package:healthy_life/ui/widget/sidebar.dart';

class PolahidupPage extends StatefulWidget {
  const PolahidupPage({Key? key}) : super(key: key);

  _PolahidupPageState createState() => _PolahidupPageState();
}

class _PolahidupPageState extends State<PolahidupPage> {
  Stream<List<Polahidup>> getList() async* {
    List<Polahidup> data = await PolahidupService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "POLA HIDUP",
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
              return PolahidupItem(polahidup: snapshot.data[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PolahidupForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
