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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Showcase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Dismissible',
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Desliza una tarea hacia un lado para eliminarla.',
          ),
          const SizedBox(height: 12),
          if (_tareas.isEmpty)
            const Center(
              child: Text('No quedan tareas'),
            ),
          ..._tareas.asMap().entries.map((entry) {
            final index = entry.key;
            final tarea = entry.value;

            return Dismissible(
              key: ValueKey(tarea),
              direction: DismissDirection.horizontal,
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (_) {
                _eliminarTarea(index);
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.task),
                  title: Text(tarea),
                  subtitle: const Text(
                    'Desliza para eliminar',
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          Text(
            'ExpansionTile',
            style: Theme.of(context)
                .textTheme
                .titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Pulsa para mostrar u ocultar información.',
          ),
          const SizedBox(height: 12),
          const ExpansionTile(
            leading: Icon(Icons.flutter_dash),
            title: Text('Flutter'),
            subtitle: Text('Framework de desarrollo'),
            children: [
              ListTile(
                title: Text(
                  'Permite crear aplicaciones multiplataforma.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            leading: Icon(Icons.code),
            title: Text('Dart'),
            subtitle: Text('Lenguaje de programación'),
            children: [
              ListTile(
                title: Text(
                  'Es el lenguaje utilizado por Flutter.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            leading: Icon(Icons.widgets),
            title: Text('Widgets'),
            subtitle: Text('Componentes de Flutter'),
            children: [
              ListTile(
                title: Text(
                  'Permiten construir la interfaz de usuario.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
