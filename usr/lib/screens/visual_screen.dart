import 'package:flutter/material.dart';

class VisualScreen extends StatelessWidget {
  const VisualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visión y Arte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.pinkAccent, size: 32),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Describe la escena o el sentimiento. Generaremos imágenes o videos que transmitan la emoción deseada con un toque genuino.',
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _CreationCard(icon: Icons.image, title: 'Generar Imagen', color: Colors.pinkAccent),
                  _CreationCard(icon: Icons.movie, title: 'Crear Video', color: Colors.purpleAccent),
                  _CreationCard(icon: Icons.brush, title: 'Pintura Expresiva', color: Colors.tealAccent),
                  _CreationCard(icon: Icons.camera_alt, title: 'Fotografía', color: Colors.lightBlueAccent),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _CreationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _CreationCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
