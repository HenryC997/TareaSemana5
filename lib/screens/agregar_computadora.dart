import 'package:flutter/material.dart';

class AgregarComputadoraScreen extends StatelessWidget {
  final TextEditingController procesadorController = TextEditingController();
  final TextEditingController discoDuroController = TextEditingController();
  final TextEditingController ramController = TextEditingController();

  AgregarComputadoraScreen({super.key});

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
              controller: procesadorController,
              decoration: const InputDecoration(
                labelText: 'Procesador',
              ),
            ),
            TextField(
              controller: discoDuroController,
              decoration: const InputDecoration(
                labelText: 'Disco Duro',
              ),
            ),
            TextField(
              controller: ramController,
              decoration: const InputDecoration(
                labelText: 'RAM',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Crear un mapa con la información ingresada
                final nuevaComputadora = {
                  'procesador': procesadorController.text,
                  'discoDuro': discoDuroController.text,
                  'ram': ramController.text,
                };
                // Regresar la computadora al Navigator
                Navigator.pop(context, nuevaComputadora);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
