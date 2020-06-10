
import 'package:flutter/cupertino.dart';
import 'package:try_flutter/authentication/authentication.dart';

class MenuPage extends StatefulWidget {

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  MenuPage({this.auth, this.onSignedOut});
  

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}