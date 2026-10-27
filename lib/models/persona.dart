class Persona {
  String name;
  String surname;
  String email;
  String password;
  DateTime dateOfBirth;

  Persona({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.dateOfBirth,
  });

  String get fullName => '$name $surname';
}