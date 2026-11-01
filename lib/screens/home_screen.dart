
import 'package:flutter/material.dart';

import '../models/persona.dart';
import '../widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Persona persona;

  @override
  void initState() {
    super.initState();

    persona = Persona(
      name: 'Tu nombre',
      surname: 'Tus apellidos',
      email: 'tuemail@example.com',
      password: '',
      dateOfBirth: DateTime(2000, 1, 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
      ),
      body: ListView(
        children: [
          ProfileCard(persona: persona),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton.icon(
              onPressed: () {
                // Añadiremos la navegación para editar el perfil.
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () {
                // Añadiremos la navegación al catálogo de widgets.
              },
              icon: const Icon(Icons.widgets_outlined),
              label: const Text('Explore Widget Showcase'),
            ),
          ),
        ],
      ),
    );
  }
}
