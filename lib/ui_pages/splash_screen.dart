import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:saltattire/constants/ColorsConstants.dart';
import 'package:saltattire/ui_pages/HomeScreen.dart';
import 'package:saltattire/ui_pages/swipePages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible = false;
  bool load = true;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUniqueData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
                waveType: WaveType.liquidReveal,
                enableLoop: true,
                enableSlideIcon: true,
                fullTransitionValue: 300,
                positionSlideIcon: 0.5,
                onPageChangeCallback: (int number) {
                  setState(() {
                    visible = number == 4 ? true : false;
                  });
                },
                pages: swipePages),
            Visibility(
              visible: load,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Visibility(
          visible: visible,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => HomePage()));
            },
            color: primaryColor,
            splashColor: Colors.black12,
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  "Sign Up ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ));
  }

  void getUniqueData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("firstTime") != null) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      sharedPreferences.setString('firstTime', "saltAttire");
      setState(() {
        load = false;
      });
    }
  }
}
