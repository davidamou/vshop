import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/text_style.dart';
import '../../constants/style.dart';
import 'login_modal.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 12.0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: defaultBorderRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenu,',
                        style: titleLarge(context),
                      ),
                      const SizedBox(height: 12.0),
                      const Text(
                          'Vous chercher a savoir ce qui est de nouveau dans la mode, alos vous etes au bon.'),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go('/home'),
                          child: const Text('Continuer'),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => showLoginModal(context),
                          child: const Text('Se connecter'),
                        ),
                      ),
                    ],
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
