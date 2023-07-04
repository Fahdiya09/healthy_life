import 'package:flutter/material.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_page.dart';
import 'package:healthy_life/ui/polahidup/polahidup_item.dart';
import 'package:healthy_life/ui/polahidup/polahidup_page.dart';
import 'package:healthy_life/ui/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "H E A L T H Y   L I F E",
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
      body: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(20),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PolahidupPage()));
              },
              splashColor: Colors.pink,
              child: Center(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset("assets/images/lifestyle.jpg",
                          height: 250, width: 250),
                    ),
                    const Text(
                      'POLA HIDUP',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Fonlato",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DietprogramPage()));
              },
              splashColor: Colors.pink,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset("assets/images/dietprogram.jpg",
                          height: 250, width: 250),
                    ),
                    const Text(
                      'PROGRAM DIET',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Fonlato",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
