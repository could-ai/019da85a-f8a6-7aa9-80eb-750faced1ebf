import 'package:flutter/material.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voz y Música'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orangeAccent.withOpacity(0.2),
                  border: Border.all(color: Colors.orangeAccent, width: 2),
                ),
                child: const Icon(Icons.mic, size: 64, color: Colors.orangeAccent),
              ),
              const SizedBox(height: 32),
              const Text(
                'Toca para hablar',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Te escucharé y responderé con una voz natural y expresiva, como un buen locutor.\nTambién podemos crear música juntos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AudioToolButton(icon: Icons.music_note, label: 'Música', onTap: () {}),
                  _AudioToolButton(icon: Icons.record_voice_over, label: 'Locución', onTap: () {}),
                  _AudioToolButton(icon: Icons.headset, label: 'Escuchar', onTap: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AudioToolButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _AudioToolButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32),
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white10,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
