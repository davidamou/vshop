import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/text_style.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Text(
                'Enter your personal information',
                style: titleLarge(context, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 12.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(height: 12.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'New password',
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => context.go('/verify-password'),
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
