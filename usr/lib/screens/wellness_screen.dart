import 'package:flutter/material.dart';

class WellnessScreen extends StatefulWidget {
  const WellnessScreen({super.key});

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      'role': 'assistant',
      'content': 'Hola. Este es tu espacio seguro para la reflexión y el desahogo emocional. Estoy aquí para escucharte y acompañarte con palabras de aliento y ejercicios de respiración.\n\n*Recuerda: Soy un asistente creativo, no un profesional de la salud. Para tratar el dolor físico o recibir terapia psicológica, por favor consulta siempre a un especialista médico.*'
    }
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add({'role': 'user', 'content': _controller.text});
      
      // Simulación de respuesta empática y segura
      _messages.add({
        'role': 'assistant',
        'content': 'Te escucho y comprendo cómo te sientes. Escribir sobre lo que experimentamos es un hermoso primer paso para aliviar la mente. ¿Te gustaría que probemos juntos un ejercicio breve de respiración profunda para encontrar un momento de calma, o prefieres seguir escribiendo?'
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienestar y Reflexión'),
        backgroundColor: Colors.teal.shade800,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.amber.shade100.withOpacity(0.1),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Aviso de salud: Las reflexiones y ejercicios de relajación sugeridos aquí no sustituyen el consejo, diagnóstico o tratamiento médico profesional.',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final isUser = _messages[index]['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.teal.shade700.withOpacity(0.4) : Colors.white10,
                      borderRadius: BorderRadius.circular(16).copyWith(
                        bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(16),
                        bottomLeft: !isUser ? const Radius.circular(0) : const Radius.circular(16),
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    child: Text(
                      _messages[index]['content']!,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Escribe cómo te sientes hoy...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    maxLines: 4,
                    minLines: 1,
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  backgroundColor: Colors.teal.shade600,
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
