import 'package:flutter/material.dart';

import 'pages/welcome_page.dart';
import 'pages/home_page.dart';
import 'pages/flights_page.dart';
import 'pages/flight_details_page.dart';
import 'pages/passenger_page.dart';
import 'pages/confirmation_page.dart';
import 'pages/profile_page.dart';
import 'pages/help_page.dart';
import 'pages/about_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FlyGoApp());
}

class FlyGoApp extends StatelessWidget {
  const FlyGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlyGo',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/flights': (context) => const FlightsPage(),
        '/passenger': (context) => const PassengerPage(),
        '/confirmation': (context) => const ConfirmationPage(),
        '/profile': (context) => const ProfilePage(),
        '/help': (context) => const HelpPage(),
        '/about': (context) => const AboutPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final flight = settings.arguments;

          return MaterialPageRoute(
            builder: (context) => FlightDetailsPage(
              flight: flight,
            ),
          );
        }

        return null;
      },
    );
  }
}