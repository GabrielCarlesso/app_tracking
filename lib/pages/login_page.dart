import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app_tracking/pages/map_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 70.0,
              child: Image(image: AssetImage("assets/images/login_photo.png")),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    color: Colors.black87,
                    width: 0.5,
                    style: BorderStyle.solid),
              )),
              child: TextFormField(
                controller: _ipController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.dns_outlined, color: Colors.black87),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "IP:194.16.254.1",
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                    color: Colors.black87,
                    width: 0.5,
                    style: BorderStyle.solid),
              )),
              child: TextFormField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.view_list_outlined, color: Colors.black87),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "ID: 0000",
                    hintStyle: TextStyle(color: Colors.black38)),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      _logando(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(240, 124, 187, 0), // foreground
                      padding: const EdgeInsets.all(15),
                      elevation: 2,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    icon: const Icon(Icons.input, size: 18),
                    label: const Text("Login"))),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _logando(BuildContext context) {
    String ip = _ipController.text;
    String id = _idController.text;
    debugPrint('ip: $ip e id: $id');
    log('log : id:$id e ip:$id');

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const MapPage(),
    ));
  }
}
