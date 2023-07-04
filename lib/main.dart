import 'package:flutter/material.dart';
import 'package:healthy_life/helpers/user_info.dart';
import 'package:healthy_life/ui/beranda.dart';
import 'package:healthy_life/ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  runApp(MaterialApp(
    title: "HEALTHY LIFE",
    debugShowCheckedModeBanner: false,
    home: token == null ? LoginPage() : Beranda(),
  ));
}
