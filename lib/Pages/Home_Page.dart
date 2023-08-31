// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hbapp/Models/HairSalon_Model.dart';
import 'package:hbapp/Providers/Gov_Provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyHomePage> {
  final HairSalonProvider _hairSalonProvider = HairSalonProvider();
  List<HairSalon> _hairSalon = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Cargar los datos de los salones de belleza desde la API
  Future<void> _loadData() async {
    try {
      final hairSalonData = await _hairSalonProvider.getHairSalons();
      setState(() {
        _hairSalon = hairSalonData;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // El texto del título que se mostrará en la barra de acción
        title: Text(
          "Peluquerias",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.purple, // Color de fondo del cuerpo
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _hairSalon.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Card(
                color: Colors.deepPurple, // Color de fondo de la tarjeta
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Borde redondeado de la tarjeta
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: " + _hairSalon[index].razonSocial,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Direccion: " + _hairSalon[index].razonSocial,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Email: " + _hairSalon[index].razonSocial,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
