import 'package:flutter/material.dart';

class ListaComputadorasScreen extends StatefulWidget {
  const ListaComputadorasScreen({super.key});

  @override
  _ListaComputadorasScreenState createState() =>
      _ListaComputadorasScreenState();
}

class _ListaComputadorasScreenState extends State<ListaComputadorasScreen> {
  // Lista para almacenar las computadoras
  List<Map<String, String>> computadoras = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Computadoras'),
      ),
      body: computadoras.isEmpty
          ? const Center(
              child: Text('No hay computadoras agregadas'),
            )
          : ListView.builder(
              itemCount: computadoras.length,
              itemBuilder: (context, index) {
                final computadora = computadoras[index];
                return ListTile(
                  title: Text('Procesador: ${computadora["procesador"]}'),
                  subtitle: Text(
                    'Disco: ${computadora["disco"]}, RAM: ${computadora["ram"]}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Botón de editar
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _mostrarDialogoEditar(context, index);
                        },
                      ),
                      // Botón de eliminar
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            computadoras
                                .removeAt(index); // Eliminar computadora
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregar(context);
        },
        // ignore: sort_child_properties_last
        child: const Icon(Icons.add),
        tooltip: 'Agregar Computadora',
      ),
    );
  }

  // Método para mostrar el cuadro de diálogo para agregar computadoras
  void _mostrarDialogoAgregar(BuildContext context) {
    final TextEditingController procesadorController = TextEditingController();
    final TextEditingController discoController = TextEditingController();
    final TextEditingController ramController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar Computadora'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: procesadorController,
                decoration: const InputDecoration(labelText: 'Procesador'),
              ),
              TextField(
                controller: discoController,
                decoration: const InputDecoration(labelText: 'Disco Duro'),
              ),
              TextField(
                controller: ramController,
                decoration: const InputDecoration(labelText: 'RAM'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (procesadorController.text.isNotEmpty &&
                    discoController.text.isNotEmpty &&
                    ramController.text.isNotEmpty) {
                  setState(() {
                    // Agregar la computadora a la lista
                    computadoras.add({
                      "procesador": procesadorController.text,
                      "disco": discoController.text,
                      "ram": ramController.text,
                    });
                  });
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Método para mostrar el cuadro de diálogo para editar computadoras
  void _mostrarDialogoEditar(BuildContext context, int index) {
    final TextEditingController procesadorController =
        TextEditingController(text: computadoras[index]['procesador']);
    final TextEditingController discoController =
        TextEditingController(text: computadoras[index]['disco']);
    final TextEditingController ramController =
        TextEditingController(text: computadoras[index]['ram']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Computadora'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: procesadorController,
                decoration: const InputDecoration(labelText: 'Procesador'),
              ),
              TextField(
                controller: discoController,
                decoration: const InputDecoration(labelText: 'Disco Duro'),
              ),
              TextField(
                controller: ramController,
                decoration: const InputDecoration(labelText: 'RAM'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (procesadorController.text.isNotEmpty &&
                    discoController.text.isNotEmpty &&
                    ramController.text.isNotEmpty) {
                  setState(() {
                    // Actualizar la computadora en la lista
                    computadoras[index] = {
                      "procesador": procesadorController.text,
                      "disco": discoController.text,
                      "ram": ramController.text,
                    };
                  });
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
