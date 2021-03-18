class Practicas{
  final int id_p;
  final String practica;
  final String imageUrl;
  final String descripcion;

  Practicas(
      {
        this.id_p,
        this.practica,
        this.imageUrl,
        this.descripcion
      }
      );

  factory Practicas.fromJson(Map<String, dynamic > item){
    return Practicas(
        id_p: item['id_p'],
        practica: item['practica'],
        imageUrl: item['imageUrl'],
        descripcion: item['descripcion']
    );
  }
}