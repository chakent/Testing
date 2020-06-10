import 'package:flutter/material.dart';
import 'package:try_flutter/authentication/authentication.dart';
import 'package:try_flutter/login_admin/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(
        auth: Auth(),
      ),
    );
  }
}
