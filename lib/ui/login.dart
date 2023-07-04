import 'package:flutter/material.dart';
import 'package:healthy_life/model/polahidup.dart';
import 'package:healthy_life/service/login_service.dart';
import 'package:healthy_life/ui/beranda.dart';
import 'package:healthy_life/ui/page_header.dart';
import 'package:healthy_life/ui/widget/sidebar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Icon icon = Icon(Icons.visibility);
  bool obscure = true;

  final usernamectrl = TextEditingController();
  final passwordctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PageHeader(),
                const Text(
                  "L O G I N",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Fonlato"),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Form(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: "Username"),
                            controller: usernamectrl,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            obscureText: obscure,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (obscure == true) {
                                        obscure = false;
                                        icon = Icon(Icons.visibility_off);
                                      } else {
                                        obscure = true;
                                        icon = Icon(Icons.visibility);
                                      }
                                    });
                                  },
                                  icon: icon),
                            ),
                            controller: passwordctrl,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                String username = usernamectrl.text;
                                String password = passwordctrl.text;
                                await LoginService()
                                    .login(username, password)
                                    .then((value) {
                                  if (value == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Beranda()));
                                  } else {
                                    AlertDialog alertDialog = AlertDialog(
                                      content: const Text(
                                          "Username atau Password Tidak Valid"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK"),
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.green),
                                        )
                                      ],
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (context) => alertDialog);
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink),
                              child: const Text("L O G I N"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
