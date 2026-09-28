import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre o FlyGo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const SizedBox(height: 20),

              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FF),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: const Icon(
                  Icons.flight_takeoff,
                  size: 52,
                  color: Color(0xFF007AFF),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'FlyGo',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00254C),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Seu próximo destino começa aqui.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 35),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFE7EBF0),
                  ),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Sobre o aplicativo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00254C),
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'O FlyGo é um aplicativo de passagens aéreas desenvolvido como projeto acadêmico para a disciplina de Desenvolvimento para Dispositivos Móveis.',
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 14),

                    Text(
                      'O aplicativo apresenta uma experiência de pesquisa e seleção de voos, utilizando componentes de interface, formulários, navegação entre páginas e layout responsivo.',
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FF),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Column(
                  children: [
                    Icon(
                      Icons.code,
                      color: Color(0xFF007AFF),
                      size: 32,
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Tecnologia',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00254C),
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      'Desenvolvido utilizando Flutter e Dart.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                '"Viajar é descobrir novos horizontes."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                '— FlyGo',
                style: TextStyle(
                  color: Color(0xFF007AFF),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Versão 1.0.0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}