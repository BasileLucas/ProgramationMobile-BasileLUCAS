import 'package:flutter/material.dart';
import '../res/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login or sign up',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
        )
      ),  
    ),
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            EmailField(),
            SizedBox(height: 16),
            ContinueButton(),
            SizedBox(height: 32),
            OrSeparator(),
            SizedBox(height: 32),
            ContinueWithButton(),
          ],
        ),
      ),
    );
    ;
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email Address',
        prefixIcon: const Icon(Icons.email_outlined),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Continuer');
  }
}

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Or');
  }
}

class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Continuer avec Google');
  }
}



