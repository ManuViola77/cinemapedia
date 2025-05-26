import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas',
      'Cocinando el pop corn',
      'Mirando Trailers',
      'Whatsapeando',
      'Buscando en internet',
      'Hablando con ChatGPT',
      'Coordinando plan con mis amigos',
      'Esto está tardando más de lo esperado...',
    ];

    return Stream.periodic(const Duration(milliseconds: 1000), (step) {
      return messages[step];
      // el take es para obtener hasta esa cantidad, despues frena
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          SizedBox(height: 20),
          const CircularProgressIndicator(strokeWidth: 3),
          SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
