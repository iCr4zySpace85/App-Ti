import 'package:flutter/material.dart';
import '../pages/regi_page.dart';
import '../utils/color.dart';
import '../widgets/btn_widget.dart';
import '../widgets/herder_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController(text: "");
    TextEditingController password = TextEditingController(text: "");
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Inicio de Sesión"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        controller: username,
                        hint: "Correo Electrónico",
                        icon: Icons.email),
                    _textInput(
                        controller: password,
                        hint: "Contraseña",
                        icon: Icons.vpn_key),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text("¿Olvidaste tu Contraseña?",
                          style: TextStyle(color: Colors.green)),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegPage()));
                          },
                          btnText: "Continuar",
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "INADA COM.MX | COMPANY",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
