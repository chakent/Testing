import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:try_flutter/authentication/authentication.dart';

class IntroPage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignIn;

  IntroPage({this.auth, this.onSignIn});

  @override
  _IntroPageState createState() => _IntroPageState();
}

enum AuthStatus { notSignIn, signIn }

class _IntroPageState extends State<IntroPage> {
  AuthStatus _authStatus = AuthStatus.notSignIn;
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((onValue) {
      setState(() {
        print(onValue);
        _authStatus =
            onValue == 'no_login' ? AuthStatus.notSignIn : AuthStatus.signIn;
      });
    });

    //halaman intro

    // Slide pertama
    slides.add(
      Slide(
        title: 'Ingredients',
        maxLineTitle: 2,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono',
        ),
        description: "Create your own recipes",
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
        ),
        marginDescription: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 70.0,
        ),
        centerWidget: Text(
          'Slide to pass next screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundImage: 'assets/image/huevos.gif',
        onCenterItemPress: () {},
      ),
    );

    //Slide kedua
    slides.add(
      new Slide(
        title: "World Recipes",
        styleTitle: TextStyle(
            color: Colors.blueAccent,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Waffles, Desserts, Cakes, Thai Food, Arabic, Mexican, Peruvian, Italian, Argentina ...",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/images/azucar.gif",
      ),
    );

    //Slide ketiga
    slides.add(
      new Slide(
        title: "Italian pizza recipe",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Order everything before starting the preparation, let's go ahead ...",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        backgroundImage: "assets/images/pizzacaliente.gif",
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress(){
    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(auth: widget.auth, onSignIn: widget.onSignIn,)),);
  }

  Widget renderNextBtn(){
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn(){
    return Icon(
      Icons.done,
      color:  Colors.white,
    );
  }

Widget renderSkipBtn(){
  return Icon(
    Icons.skip_next,
    color:  Colors.white,
  );
}
@override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      //Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.orangeAccent,
      highlightColorSkipBtn: Color(0xff000000),

      //Next button
      renderNextBtn: this.renderNextBtn(),

      //Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.blueAccent,
      highlightColorDoneBtn: Color(0xfF69303),

      //Dot indicator
      colorDot: Colors.white,
      colorActiveDot: Colors.orangeAccent[200],
      sizeDot: 13.0,

      //show or hide status bar
      shouldHideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
}
