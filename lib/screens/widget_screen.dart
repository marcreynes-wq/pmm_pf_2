import 'package:flutter/material.dart';

// StatefulWidget porque la lista cambia al eliminar
// elementos y los ExpansionTile tienen interacción.
class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() =>
      _WidgetScreenState();
}



class _WidgetScreenState extends State<WidgetScreen> {
  final List<String> _tareas = [
    'Aprender Flutter',
    'Practicar Dart',
    'Crear aplicaciones móviles',
    'Estudiar widgets',
  ];

  void _eliminarTarea(int index) {
    final tareaEliminada = _tareas[index];

    setState(() {
      _tareas.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$tareaEliminada eliminada'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            setState(() {
              _tareas.insert(index, tareaEliminada);
            });
          },
        ),
      ),
    );
  }

}
