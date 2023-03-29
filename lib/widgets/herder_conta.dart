import 'package:flutter/material.dart';
import '../utils/color.dart';

class HeaderConta extends StatelessWidget {
  var text = "Login";

  HeaderConta(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [whiteColor, whiteColorT],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
              right: 20,
              child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
          Center(
            child: Image.asset('lib/assets/logo.png', width: 200, height: 200),
          ),
        ],
      ),
    );
  }
}