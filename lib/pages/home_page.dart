import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _originController =
      TextEditingController();

  final TextEditingController _destinationController =
      TextEditingController();

  final TextEditingController _dateController =
      TextEditingController();

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text =
            '${selectedDate.day.toString().padLeft(2, '0')}/'
            '${selectedDate.month.toString().padLeft(2, '0')}/'
            '${selectedDate.year}';
      });
    }
  }

  void _searchFlights() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        '/flights',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlyGo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF00254C),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Color(0xFF00254C),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
        ],
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth > 600;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 900,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),

                        const Text(
                          'Encontre seu próximo voo',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00254C),
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Pesquise voos e encontre a melhor opção para sua viagem.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE7EBF0),
                            ),
                          ),
                          child: Column(
                            children: [
                              if (isWide)
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _originController,
                                        decoration:
                                            const InputDecoration(
                                          labelText: 'Origem',
                                          hintText:
                                              'Ex.: São Paulo',
                                          prefixIcon: Icon(
                                            Icons.flight_takeoff,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Informe a origem';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),

                                    const SizedBox(width: 15),

                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            _destinationController,
                                        decoration:
                                            const InputDecoration(
                                          labelText: 'Destino',
                                          hintText:
                                              'Ex.: Rio de Janeiro',
                                          prefixIcon: Icon(
                                            Icons.flight_land,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Informe o destino';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    TextFormField(
                                      controller:
                                          _originController,
                                      decoration:
                                          const InputDecoration(
                                        labelText: 'Origem',
                                        hintText:
                                            'Ex.: São Paulo',
                                        prefixIcon: Icon(
                                          Icons.flight_takeoff,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Informe a origem';
                                        }

                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 15),

                                    TextFormField(
                                      controller:
                                          _destinationController,
                                      decoration:
                                          const InputDecoration(
                                        labelText: 'Destino',
                                        hintText:
                                            'Ex.: Rio de Janeiro',
                                        prefixIcon: Icon(
                                          Icons.flight_land,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Informe o destino';
                                        }

                                        return null;
                                      },
                                    ),
                                  ],
                                ),

                              const SizedBox(height: 15),

                              TextFormField(
                                controller: _dateController,
                                readOnly: true,
                                onTap: _selectDate,
                                decoration:
                                    const InputDecoration(
                                  labelText: 'Data da viagem',
                                  hintText:
                                      'Selecione uma data',
                                  prefixIcon: Icon(
                                    Icons.calendar_month,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty) {
                                    return 'Selecione a data';
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 20),

                              PrimaryButton(
                                text: 'Buscar voos',
                                icon: Icons.search,
                                onPressed: _searchFlights,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        const Text(
                          'Por que viajar com o FlyGo?',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00254C),
                          ),
                        ),

                        const SizedBox(height: 15),

                        if (isWide)
                          Row(
                            children: [
                              Expanded(
                                child: _FeatureCard(
                                  icon: Icons.search,
                                  title: 'Pesquisa fácil',
                                  text:
                                      'Encontre voos de forma rápida e simples.',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _FeatureCard(
                                  icon: Icons.compare_arrows,
                                  title: 'Compare opções',
                                  text:
                                      'Visualize horários, duração e preços.',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _FeatureCard(
                                  icon: Icons.airplane_ticket,
                                  title: 'Escolha seu voo',
                                  text:
                                      'Selecione a opção que combina com sua viagem.',
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              _FeatureCard(
                                icon: Icons.search,
                                title: 'Pesquisa fácil',
                                text:
                                    'Encontre voos de forma rápida e simples.',
                              ),
                              const SizedBox(height: 12),
                              _FeatureCard(
                                icon: Icons.compare_arrows,
                                title: 'Compare opções',
                                text:
                                    'Visualize horários, duração e preços.',
                              ),
                              const SizedBox(height: 12),
                              _FeatureCard(
                                icon: Icons.airplane_ticket,
                                title: 'Escolha seu voo',
                                text:
                                    'Selecione a opção que combina com sua viagem.',
                              ),
                            ],
                          ),

                        const SizedBox(height: 30),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF3FF),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Icon(
                                Icons.format_quote,
                                size: 35,
                                color: Color(0xFF007AFF),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Viajar é descobrir novos horizontes.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '— FlyGo',
                                style: TextStyle(
                                  color: Color(0xFF007AFF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 0) {
            return;
          }

          if (index == 1) {
            Navigator.pushNamed(context, '/flights');
          }

          if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.flight_outlined),
            selectedIcon: Icon(Icons.flight),
            label: 'Voos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7EBF0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF007AFF),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF00254C),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            text,
            style: const TextStyle(
              color: Colors.black54,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}