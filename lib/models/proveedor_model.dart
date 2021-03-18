class Proveedor{
  final int id_u;
  final String imageUrl;
  final String nombre;
  final String direccion;
  final String tipo;
  final double calificacion;

  Proveedor(
  {
    this.id_u,
    this.imageUrl,
    this.nombre,
    this.direccion,
    this.tipo,
    this.calificacion
  }
  );

  factory Proveedor.fromJson(Map<String, dynamic > item){
    return Proveedor(
        id_u: item['id_u'],
        imageUrl: item['imageUrl'],
        nombre: item['nombre'],
        tipo: item['tipo'],
        calificacion: item['calificacion']
    );
  }
}

class Proveedores {
   int id_u;
   String imageUrl;
   String nombre;
   String direccion;
   String tipo;
   double calificacion;

  Proveedores(int id_u, String imageUrl, String nombre, String direccion, String tipo, double calificacion ) {
    this.id_u = id_u;
    this.imageUrl = imageUrl;
    this.nombre = nombre;
    this.direccion = direccion;
    this.tipo = tipo;
    this.calificacion = calificacion;
  }

   Proveedores.fromJson(Map json)
      : id_u = json['id_u'],
        imageUrl = json['imageUrl'],
        nombre = json['nombre'],
        direccion = json['direccion'],
        tipo = json['tipo'],
        calificacion = json['calificacion'];

  Map toJson() {
    return {'id_u': id_u, 'imageUrl': imageUrl, 'nombre': nombre, 'direccion': direccion, 'tipo': tipo, 'calificacion': calificacion};
  }
}