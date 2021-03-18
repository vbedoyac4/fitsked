class User {
  String correo;
  String password;


  User({
    this.correo,
    this.password
  });
}

class Usuario {
  String nombre;
  String password;
  String correo;
  String telefono;

  Usuario({
    this.nombre,
    this.password,
    this.correo,
    this.telefono
  });

  Map<String, dynamic> toJson(){
    return {
      "nombre": nombre,
      "password": password,
      "correo": correo,
      "telefono": telefono
    };
  }
}

