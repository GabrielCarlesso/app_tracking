import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //Instantiating the class with the Ip and the PortNumber
  TcpSocketConnection socketConnection =
      TcpSocketConnection("192.168.100.10", 8080);

  String message = "Enviando RECEBAAA";
  late String recebida = "";

  @override
  void initState() {
    super.initState();
    startConnection();
  }

  //receiving and sending back a custom message
  void messageReceived(String msg) {
    setState(() {
      recebida = msg;
    });
    socketConnection.sendMessage("Recebaaa ");
  }

  //starting the connection and listening to the socket asynchronously
  void startConnection() async {
    socketConnection.enableConsolePrint(
        true); //use this to see in the console what's happening
    if (await socketConnection.canConnect(5000, attempts: 3)) {
      //check if it's possible to connect to the endpoint
      await socketConnection.connect(5000, messageReceived, attempts: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Test:"),
      ),
      body: Center(
        child: Text('$recebida'),
      ),
    );
  }
}
