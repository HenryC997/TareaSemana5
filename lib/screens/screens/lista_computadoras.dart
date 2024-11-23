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
        title: const Text(
          'COMPUTADORES INGRESADOS',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: computadoras.isEmpty
          ? const Center(
              child: Text(
                'AGREGUE COMPUTADORES PARA VERLOS',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 43, 198, 245)),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: computadoras.length,
              itemBuilder: (context, index) {
                final computadora = computadoras[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.computer,
                      color: Colors.blueAccent,
                      size: 36,
                    ),
                    title: Text(
                      'Procesador: ${computadora["procesador"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Disco: ${computadora["disco"]}, RAM: ${computadora["ram"]}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          computadoras.removeAt(index); //
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregar(context);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add_box),
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
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Agregar Nuevo Computador',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Campo Procesador
                  TextField(
                    controller: procesadorController,
                    decoration: InputDecoration(
                      labelText: 'Procesador',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Campo Disco Duro
                  TextField(
                    controller: discoController,
                    decoration: InputDecoration(
                      labelText: 'Disco Duro',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Campo RAM
                  TextField(
                    controller: ramController,
                    decoration: InputDecoration(
                      labelText: 'RAM',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Botón Cancelar
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.cancel, color: Colors.white),
                        label: const Text('Cancelar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      // Botón Guardar
                      ElevatedButton.icon(
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
                            Navigator.of(context)
                                .pop(); // Cierra el cuadro de diálogo
                          }
                        },
                        icon: const Icon(Icons.save, color: Colors.white),
                        label: const Text('Guardar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
