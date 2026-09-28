import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ajuda',
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
              const Text(
                'Como podemos ajudar?',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00254C),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Encontre respostas para as principais dúvidas sobre o FlyGo.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 30),

              _HelpItem(
                icon: Icons.search,
                title: 'Como pesquisar um voo?',
                text:
                    'Na página inicial, informe a origem, o destino e a data da viagem. Depois, toque em "Buscar voos".',
              ),

              _HelpItem(
                icon: Icons.flight,
                title: 'Como escolher um voo?',
                text:
                    'Na lista de voos, selecione uma das opções disponíveis para visualizar seus detalhes.',
              ),

              _HelpItem(
                icon: Icons.person_outline,
                title: 'Como informar meus dados?',
                text:
                    'Depois de escolher um voo, você poderá preencher seus dados de passageiro antes de finalizar a reserva.',
              ),

              _HelpItem(
                icon: Icons.confirmation_num_outlined,
                title: 'A reserva é real?',
                text:
                    'Não. O FlyGo é um aplicativo acadêmico desenvolvido para demonstração de interface e navegação.',
              ),

              _HelpItem(
                icon: Icons.email_outlined,
                title: 'Ainda preciso de ajuda?',
                text:
                    'Entre em contato com a equipe FlyGo para obter mais informações.',
              ),

              const SizedBox(height: 25),

              Center(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF007AFF),
                  ),
                  label: const Text(
                    'Voltar',
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontWeight: FontWeight.w600,
                    ),
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

class _HelpItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _HelpItem({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7EBF0),
        ),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00254C),
                    fontSize: 16,
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
          ),
        ],
      ),
    );
  }
}