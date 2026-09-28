class Flight {
  final String airline;
  final String origin;
  final String destination;
  final String originCode;
  final String destinationCode;
  final String departure;
  final String arrival;
  final String duration;
  final double price;
  final String baggage;
  final String aircraft;

  Flight({
    required this.airline,
    required this.origin,
    required this.destination,
    required this.originCode,
    required this.destinationCode,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    required this.baggage,
    required this.aircraft,
  });
}