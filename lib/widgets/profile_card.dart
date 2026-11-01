
import 'package:flutter/material.dart';

import '../models/persona.dart';

// StatelessWidget porque recibe una Persona
// y solamente muestra sus datos.
class ProfileCard extends StatelessWidget {
  final Persona persona;

  const ProfileCard({
    super.key,
    required this.persona,
  });

  String _formatearFecha(DateTime fecha) {
    final dia = fecha.day.toString().padLeft(2, '0');
    final mes = fecha.month.toString().padLeft(2, '0');

    return '$dia/$mes/${fecha.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              persona.nombreCompleto,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.email_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(persona.email),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.cake_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _formatearFecha(persona.fechaNacimiento),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
