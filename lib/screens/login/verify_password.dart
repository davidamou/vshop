import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/text_style.dart';

class VerifyPassword extends StatelessWidget {
  const VerifyPassword({Key? key}) : super(key: key);

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
                'Enter your password to continue',
                style: titleLarge(context, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
