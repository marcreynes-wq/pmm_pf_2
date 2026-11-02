
import 'package:flutter/material.dart';

import '../models/persona.dart';
import '../widgets/profile_card.dart';
import 'personal_screen.dart';
import 'widget_screen.dart';

// StatefulWidget porque el perfil cambia cuando
// volvemos de la pantalla de edición.
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
      nombre: 'Marc',
      apellidos: 'Reynés Avendaño',
      email: 'marcreynes@paucasesnovescifp.cat',
      password: '',
      fechaNacimiento: DateTime(2006, 5, 18),
    );
  }

  Future<void> _editarPerfil() async {
    final Persona? personaActualizada =
        await Navigator.push<Persona>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PersonalScreen(persona: persona);
        },
      ),
    );

    if (personaActualizada != null && mounted) {
      setState(() {
        persona = personaActualizada;
      });
    }
  }

  void _abrirWidgetShowcase() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const WidgetScreen();
        },
      ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: FilledButton.icon(
              onPressed: _editarPerfil,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: _abrirWidgetShowcase,
              icon: const Icon(Icons.widgets_outlined),
              label: const Text(
                'Explore Widget Showcase',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
