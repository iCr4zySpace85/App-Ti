import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Image.asset(
              'images/img1.png',
              height: 300.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          _userTextField(),
          SizedBox(
            height: 15,
          ),
          _passwordTextField(),
          SizedBox(
            height: 20,
          ),
          _bottonLogin(),
          SizedBox(
            height: 20,
          ),

        ],
      )),
    ));
  }

  Widget _userTextField() {
    return StreamBuilder(builder: (BuildContext, AsyncSnapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Iniciar Sesión',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
        ),
        onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
        );},
      );
    });
  }
}

Widget _recuperar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Iniciar Sesión',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
        ),
        onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
        );},
      );
    });
  }



class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

