class Computadora {
  final String modelo;
  final String? ram; // Puede ser null
  final String discoDuro;
  final String procesador;

  Computadora({
    required this.modelo,
    this.ram, // Puede ser null
    this.discoDuro = '', // Valor predeterminado vacío
    this.procesador = '',
    required id,
    required String marca, // Valor predeterminado vacío
  });

  Map<String, dynamic> toMap() {
    return {
      'modelo': modelo,
      'ram': ram,
      'discoDuro': discoDuro,
      'procesador': procesador,
    };
  }

  factory Computadora.fromMap(Map<String, dynamic> map) {
    return Computadora(
      modelo: map['modelo'] ?? '', // Asegúrate de que no sea null
      ram: map['ram'], // Puede ser null
      discoDuro: map['discoDuro'] ?? '', // Si es null, asigna un valor vacío
      procesador: map['procesador'] ?? '', id: null,
      marca: '', // Si es null, asigna un valor vacío
    );
  }

  get id => null;
}
