import 'package:flutter/material.dart';

class AgregarComputadoraScreen extends StatefulWidget {
  const AgregarComputadoraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgregarComputadoraScreenState createState() =>
      _AgregarComputadoraScreenState();
}

class _AgregarComputadoraScreenState extends State<AgregarComputadoraScreen> {
  final _ramController = TextEditingController();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();
  int ram = 0; // Valor por defecto

  void _agregarComputadora() {
    // Verificar y convertir la RAM a entero
    if (_ramController.text.isNotEmpty) {
      try {
        ram = int.parse(_ramController.text);
      } catch (e) {
        ram = 0; // Valor por defecto en caso de error
      }
    }

    // Crear la computadora con los valores ingresados
    // ignore: unused_local_variable
    final computadora = Computadora(
      marca: _marcaController.text,
      modelo: _modeloController.text,
      ram: ram,
    );

    // Llamar al método para guardar la computadora en la base de datos
    // DatabaseHelper().insertarComputadora(computadora);

    // Limpiar los campos
    _marcaController.clear();
    _modeloController.clear();
    _ramController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Computadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _marcaController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: _ramController,
              decoration: const InputDecoration(labelText: 'RAM (en GB)'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _agregarComputadora,
              child: const Text('Agregar Computadora'),
            ),
          ],
        ),
      ),
    );
  }
}

class Computadora {
  final String marca;
  final String modelo;
  final int ram;

  Computadora({
    required this.marca,
    required this.modelo,
    required this.ram,
  });

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'modelo': modelo,
      'ram': ram,
    };
  }
}
