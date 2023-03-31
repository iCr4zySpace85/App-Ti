import 'package:flutter/material.dart';

class Registros extends StatefulWidget {
  String _user;
  String _pass;
  Registros(this._user, this._pass, {super.key});

  @override
  State<Registros> createState() => _MyAppState(_user, _pass);
}

class _MyAppState extends State<Registros> {}
