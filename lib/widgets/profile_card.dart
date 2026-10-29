import 'package:flutter/material.dart';

import '../models/persona.dart';

class ProfileCard extends StatelessWidget{
  final Persona persona;

  const ProfileCard({
    super.key,
    required this.persona,
    });

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
                persona.fullName,
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
                      '${persona.dateOfBirth.day.toString().padLeft(2, '0')}/'
                      '${persona.dateOfBirth.month.toString().padLeft(2, '0')}/'
                      '${persona.dateOfBirth.year}',
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