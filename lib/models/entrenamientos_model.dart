class Entrenamientos{
  // final int id_a;
  final String fecha;
  final String hora;
  final int cupos;

  Entrenamientos(
      {
        // this.id_a,
        this.fecha,
        this.hora,
        this.cupos,
      });

  factory Entrenamientos.fromJson(Map<String, dynamic > item){
    return Entrenamientos(
      //id_a: item['id_a'],
        fecha: item['fecha'],
        hora: item['hora'],
        cupos: item['cupos']
    );
  }
}