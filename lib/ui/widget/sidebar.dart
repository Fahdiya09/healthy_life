import 'package:flutter/material.dart';
import 'package:healthy_life/helpers/user_info.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/ui/beranda.dart';
import 'package:healthy_life/ui/dietprogram/dietprogram_page.dart';
import 'package:healthy_life/ui/login.dart';
import 'package:healthy_life/ui/polahidup/polahidup_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0, top: 50.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo_healthylife.png'),
              ),
            ),
          ),
          Text("Admin", textAlign: TextAlign.center),
          Text("admin@gmail.com", textAlign: TextAlign.center),
          SizedBox(height: 50),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text("Pola Hidup"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PolahidupPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Diet Program"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietprogramPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Keluar"),
            onTap: () {
              UserInfo().logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
