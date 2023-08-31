// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:hbapp/Models/HairSalon_Model.dart';
import 'package:http/http.dart' as http;

class HairSalonProvider {
  final String apiUrl = 'https://www.datos.gov.co/resource/e27n-di57.json';

  // Método para obtener la lista de salones de belleza desde la API
  Future<List<HairSalon>> getHairSalons() async {
    final response =
        await http.get(Uri.parse(apiUrl)); // Realizar la solicitud GET a la API

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa (código 200)
      final List<dynamic> jsonData =
          json.decode(response.body); // Decodificar el JSON de la respuesta
      List<HairSalon> hairSalons =
          jsonData.map((data) => HairSalon.fromJson(data)).toList();
      // Mapear los datos JSON a objetos HairSalon y crear una lista de HairSalons
      return hairSalons; // Devolver la lista de salones de belleza
    } else {
      // Si la respuesta no es exitosa
      throw Exception('Failed to load data from API'); // Lanzar una excepción
    }
  }
}
