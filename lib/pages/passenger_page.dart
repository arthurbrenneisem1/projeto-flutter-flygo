import 'package:flutter/material.dart';

import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';

class PassengerPage extends StatefulWidget {
  const PassengerPage({super.key});

  @override
  State<PassengerPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cpfController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Exigência do professor:
    // mostrar os dados no console.
    print('========== DADOS DO PASSAGEIRO ==========');
    print('Nome: ${_nameController.text}');
    print('CPF: ${_cpfController.text}');
    print('E-mail: ${_emailController.text}');
    print('Telefone: ${_phoneController.text}');
    print('==========================================');

    Navigator.pushNamed(
      context,
      '/confirmation',
    );
  }

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Preencha este campo';
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Digite seu e-mail';
    }

    if (!value.contains('@')) {
      return 'Digite um e-mail válido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dados do passageiro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Quem vai viajar?',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00254C),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Preencha os dados do passageiro.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 30),

                InputField(
                  label: 'Nome completo',
                  hint: 'Digite seu nome',
                  icon: Icons.person_outline,
                  controller: _nameController,
                  validator: _validate,
                ),

                const SizedBox(height: 18),

                InputField(
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  icon: Icons.badge_outlined,
                  controller: _cpfController,
                  validator: _validate,
                ),

                const SizedBox(height: 18),

                InputField(
                  label: 'E-mail',
                  hint: 'Digite seu e-mail',
                  icon: Icons.email_outlined,
                  controller: _emailController,
                  validator: _validateEmail,
                ),

                const SizedBox(height: 18),

                InputField(
                  label: 'Telefone',
                  hint: 'Digite seu telefone',
                  icon: Icons.phone_outlined,
                  controller: _phoneController,
                  validator: _validate,
                ),

                const SizedBox(height: 30),

                PrimaryButton(
                  text: 'Continuar',
                  icon: Icons.arrow_forward,
                  onPressed: _submitForm,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}