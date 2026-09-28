import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: const Text(
          'Confirmação',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 30),

              Container(
                width: 90,
                height: 90,

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF8EF),
                  borderRadius: BorderRadius.circular(30),
                ),

                child: const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 50,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Reserva preparada!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00254C),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Confira os dados da sua viagem.',
                textAlign: TextAlign.center,
                style: TextStyle(
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
                    color: const Color(0xFFE1E6ED),
                  ),
                ),

                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [
                        _Place(
                          city: 'São Paulo',
                          code: 'GRU',
                        ),

                        Icon(
                          Icons.flight,
                          color: Color(0xFF007AFF),
                        ),

                        _Place(
                          city: 'Rio de Janeiro',
                          code: 'SDU',
                          alignEnd: true,
                        ),
                      ],
                    ),

                    const Divider(
                      height: 35,
                    ),

                    const _Detail(
                      title: 'Data',
                      value: '15/10/2026',
                    ),

                    const _Detail(
                      title: 'Horário',
                      value: '08:30 — 10:00',
                    ),

                    const _Detail(
                      title: 'Passageiro',
                      value: 'Passageiro',
                    ),

                    const _Detail(
                      title: 'Total',
                      value: 'R\$ 489,90',
                      highlight: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              PrimaryButton(
                text: 'Voltar ao início',
                icon: Icons.home_outlined,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                  );
                },
                child: const Text(
                  'Ver meu perfil',
                  style: TextStyle(
                    color: Color(0xFF007AFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Place extends StatelessWidget {
  final String city;
  final String code;
  final bool alignEnd;

  const _Place({
    required this.city,
    required this.code,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,

      children: [
        Text(
          code,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00254C),
          ),
        ),

        Text(
          city,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class _Detail extends StatelessWidget {
  final String title;
  final String value;
  final bool highlight;

  const _Detail({
    required this.title,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: highlight
                  ? const Color(0xFF007AFF)
                  : const Color(0xFF00254C),
            ),
          ),
        ],
      ),
    );
  }
}