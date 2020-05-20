import 'package:flutter/material.dart';
import 'package:saltattire/constants/ColorsConstants.dart';

final swipePages = [
  splash_container('assets/img/new.jpg', Color(Colors.grey.value), "Cookie", true),
  splash_container('assets/img/2.jpg', Color(Colors.white.value), "Black Swan", true),
  splash_container('assets/img/3.jpg', Color(Colors.orange.value), "Honey \n Comb", true),
  splash_container('assets/img/1.jpg', Color(Colors.lightGreenAccent.value), "Twinkle", true),
  splash_container('assets/img/4.jpg', Color(Colors.yellowAccent.value), "Sunflower", false),
];

Container splash_container(String image, Color textColor, String name, bool visible ){
  return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          Positioned(
            bottom: 50,
            right: 20,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35, color: textColor),
            ),
          ),
          Visibility(visible: visible,
            child: Positioned(
              top: 50,
              left: 20,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Salt \n",
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Attire",
                      style: TextStyle(
                          letterSpacing: 5,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ]),
              ),
            ),
          )
        ],
      ));
}
