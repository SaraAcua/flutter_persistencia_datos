class User {
  final String usuario;
  final String clave;
  final String acceso;
  final String color;
  final String estado;

  User({
    required this.usuario,
    required this.clave,
    required this.acceso,
    required this.color,
    required this.estado,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      usuario: json['usuario'],
      clave: json['clave'],
      acceso: json['acceso'],
      color: json['color'],
      estado: json['estado']
    );
  }
}
