import 'package:flutter/material.dart';

import '../models/flight.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;
  final VoidCallback onTap;

  const FlightCard({
    super.key,
    required this.flight,
    required this.onTap,
  });

  String formatPrice(double price) {
    return 'R\$ ${price.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,

                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: const Icon(
                      Icons.flight,
                      color: Color(0xFF007AFF),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      flight.airline,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00254C),
                      ),
                    ),
                  ),

                  Text(
                    formatPrice(flight.price),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  _AirportTime(
                    time: flight.departure,
                    code: flight.originCode,
                  ),

                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),

                      child: Column(
                        children: [
                          Icon(
                            Icons.flight,
                            color: Color(0xFF007AFF),
                            size: 20,
                          ),

                          SizedBox(height: 4),

                          Divider(
                            color: Color(0xFFDCE4ED),
                          ),
                        ],
                      ),
                    ),
                  ),

                  _AirportTime(
                    time: flight.arrival,
                    code: flight.destinationCode,
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    flight.duration,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    'Ver detalhes',
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 4),

                  const Icon(
                    Icons.arrow_forward,
                    size: 17,
                    color: Color(0xFF007AFF),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AirportTime extends StatelessWidget {
  final String time;
  final String code;
  final CrossAxisAlignment alignment;

  const _AirportTime({
    required this.time,
    required this.code,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,

      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00254C),
          ),
        ),

        Text(
          code,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}