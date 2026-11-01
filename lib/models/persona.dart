
class Persona {
  String nombre;
  String apellidos;
  String email;
  String password;
  DateTime fechaNacimiento;

  Persona({
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.password,
    required this.fechaNacimiento,
  });

  String get nombreCompleto => '$nombre $apellidos';
}
