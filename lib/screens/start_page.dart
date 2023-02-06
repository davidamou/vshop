import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/start_page_string.dart';

class StartPage extends StatelessWidget {
  final _radius = const Radius.circular(32.0);

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
              SizedBox(
                width: double.infinity,
                height: height / 1.5,
                child: const Image(
                  image: AssetImage('assets/images/img_start.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.only(
                      topRight: _radius,
                      topLeft: _radius,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenu,',
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12.0),
                      const Text(welcomeMessage),
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
                          onPressed: () {},
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
