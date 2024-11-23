import 'package:flutter/material.dart';
// ignore: unused_import
import 'screens/bienvenida.dart'; // Verifica que la ruta sea correcta

// ignore: use_key_in_widget_constructors
class ListaComputadorasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      body: const Center(
        child: Text('Aquí estarán las computadoras'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción que se realizará al presionar el botón
          _mostrarDialogoAgregar(context);
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        tooltip: 'Agregar Computadora',
      ),
    );
  }

  // Método para mostrar un cuadro de diálogo para agregar computadoras
  void _mostrarDialogoAgregar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Computadora'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Procesador'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Disco Duro'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'RAM'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Cierra el cuadro de diálogo
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar lógica para guardar la computadora
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
