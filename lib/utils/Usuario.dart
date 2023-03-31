import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var url =
    'https://sensorhuella.smartresultsj.com.mx/login.php?us=iCr4zySpace85&ps=123456789';

Future<Secciones> getSecciones() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Secciones.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error al obtener usuario');
  }
}

class Usuario {
  final String id;
  final String fechaEntrada;
  final String horaEntrada;
  final String fechaSalida;
  final String horaSalida;
  final String usuario_id;

  const Usuario({
    required this.id,
    required this.fechaEntrada,
    required this.horaEntrada,
    required this.fechaSalida,
    required this.horaSalida,
    required this.usuario_id,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      fechaEntrada: json['FechaEntrada'],
      horaEntrada: json['HoraEntrada'],
      fechaSalida: json['HechaSalida'],
      horaSalida: json['HoraSalida'],
      usuario_id: json['usuario_id'],
    );
  }
}

class Secciones {
  final int acceso;
  final List<Usuario> Usuarios;

  const Secciones({
    required this.acceso,
    required this.Usuarios,
  });
  factory Secciones.fromJson(Map<String, dynamic> json) {
    var list = json['usuario'] as List;
    List<Usuario> UsList = list.map((i) => Usuario.fromJson(i)).toList();
    return Secciones(acceso: json['numeroDeSecciones'], Usuarios: UsList);
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Secciones> futureUsuario;

  @override
  void initState() {
    super.initState();
    futureUsuario = getSecciones();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumiendo api rest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Api Del mister Ivan'),
        ),
        body: Center(
          child: FutureBuilder<Secciones>(
            future: futureUsuario,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    "Id_Usuario: " + snapshot.data!.Usuarios[0].fechaEntrada);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
