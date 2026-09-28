import 'package:flutter/material.dart';

import '../models/flight.dart';
import '../widgets/primary_button.dart';

class FlightDetailsPage extends StatelessWidget {
  final dynamic flight;

  const FlightDetailsPage({
    super.key,
    required this.flight,
  });

  @override
  Widget build(BuildContext context) {
    final Flight selectedFlight = flight as Flight;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do voo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FF),
                  borderRadius: BorderRadius.circular(22),
                ),

                child: Column(
                  children: [
                    Text(
                      selectedFlight.airline,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007AFF),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        _Location(
                          city: selectedFlight.origin,
                          code: selectedFlight.originCode,
                          time: selectedFlight.departure,
                        ),

                        const Icon(
                          Icons.flight,
                          color: Color(0xFF007AFF),
                          size: 30,
                        ),

                        _Location(
                          city: selectedFlight.destination,
                          code: selectedFlight.destinationCode,
                          time: selectedFlight.arrival,
                          alignEnd: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Informações da viagem',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00254C),
                ),
              ),

              const SizedBox(height: 16),

              _InfoRow(
                icon: Icons.access_time,
                title: 'Duração',
                value: selectedFlight.duration,
              ),

              _InfoRow(
                icon: Icons.luggage_outlined,
                title: 'Bagagem',
                value: selectedFlight.baggage,
              ),

              _InfoRow(
                icon: Icons.airplanemode_active,
                title: 'Aeronave',
                value: selectedFlight.aircraft,
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE1E6ED),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'Valor da passagem',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),

                    Text(
                      'R\$ ${selectedFlight.price.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF007AFF),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              PrimaryButton(
                text: 'Continuar',
                icon: Icons.arrow_forward,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/passenger',
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _Location extends StatelessWidget {
  final String city;
  final String code;
  final String time;
  final bool alignEnd;

  const _Location({
    required this.city,
    required this.code,
    required this.time,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,

      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00254C),
          ),
        ),

        Text(
          code,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF007AFF),
          ),
        ),

        const SizedBox(height: 3),

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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,

            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: const Color(0xFF007AFF),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF00254C),
            ),
          ),
        ],
      ),
    );
  }
}