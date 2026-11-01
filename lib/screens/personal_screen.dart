
import 'package:flutter/material.dart';

import '../models/persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;

  const PersonalScreen({
    super.key,
    required this.persona,
  });

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombreController;
  late TextEditingController _apellidosController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late DateTime _fechaNacimiento;

  @override
  void initState() {
    super.initState();

    _nombreController = TextEditingController(
      text: widget.persona.nombre,
    );

    _apellidosController = TextEditingController(
      text: widget.persona.apellidos,
    );

    _emailController = TextEditingController(
      text: widget.persona.email,
    );

    _passwordController = TextEditingController(
      text: widget.persona.password,
    );

    _fechaNacimiento = widget.persona.fechaNacimiento;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidosController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _seleccionarFecha() async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (fechaSeleccionada != null) {
      setState(() {
        _fechaNacimiento = fechaSeleccionada;
      });
    }
  }

  String _formatearFecha(DateTime fecha) {
    final dia = fecha.day.toString().padLeft(2, '0');
    final mes = fecha.month.toString().padLeft(2, '0');

    return '$dia/$mes/${fecha.year}';
  }

  void _guardarPerfil() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final Persona personaActualizada = Persona(
      nombre: _nombreController.text.trim(),
      apellidos: _apellidosController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      fechaNacimiento: _fechaNacimiento,
    );

    Navigator.pop(context, personaActualizada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.persona.apellidos} - Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Introduce tu nombre';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _apellidosController,
              decoration: const InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Introduce tus apellidos';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Introduce tu email';
                }

                if (!value.contains('@') || !value.contains('.')) {
                  return 'Introduce un email válido';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Introduce tu contraseña';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Fecha de nacimiento',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.calendar_month),
                suffixIcon: const Icon(Icons.edit_calendar),
                hintText: _formatearFecha(_fechaNacimiento),
              ),
              controller: TextEditingController(
                text: _formatearFecha(_fechaNacimiento),
              ),
              onTap: _seleccionarFecha,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _guardarPerfil,
              icon: const Icon(Icons.save),
              label: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
