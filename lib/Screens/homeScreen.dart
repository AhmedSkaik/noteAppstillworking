import 'package:flutter/material.dart';
import 'package:trainingproj/sharedprefrancess/shared_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
          IconButton(
              onPressed: () async {
                await logoutMethod();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(),
    );
  }

  Future<void> logoutMethod() async {
    await SharedPrefController().clear();
    Navigator.pushReplacementNamed(context, '/loginScreen');
  }
}
