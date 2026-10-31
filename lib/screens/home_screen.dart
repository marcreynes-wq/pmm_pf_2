import 'package:flutter/material.dart';



/* StatelessWidget es adecuado para esta pantalla cuando su contenido   
todavía no necesita gestionar cambios de estado propios.*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
      ),
      body: const Center(
        child: Text(
          'DevProfile & Widget Showcase',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}