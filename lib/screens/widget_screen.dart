import 'package:flutter/material.dart';

// StatefulWidget porque la lista cambia al eliminar
// elementos y los ExpansionTile tienen interacción.
class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() =>
      _WidgetScreenState();
}