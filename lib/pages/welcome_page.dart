import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height - MediaQuery.of(context).padding.top,
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const SizedBox(height: 40),

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

                  const SizedBox(height: 28),

                  const Text(
                    'FlyGo',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00254C),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Seu próximo destino começa aqui.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 55),

                  const Text(
                    '"Viajar é descobrir novos horizontes."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    '— FlyGo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF007AFF),
                    ),
                  ),

                  const SizedBox(height: 60),

                  PrimaryButton(
                    text: 'Começar',
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                    child: const Text(
                      'Explorar voos',
                      style: TextStyle(
                        color: Color(0xFF007AFF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}