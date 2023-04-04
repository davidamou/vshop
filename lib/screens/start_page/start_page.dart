import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/text_style.dart';
import 'package:vshop/utils/widget_function/function.dart';
import '../../constants/style.dart';
import '../login/login_modal.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: getScreenSize(context).height,
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage('assets/images/bg_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedBuilder(
                animation: _controller,
                child: Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: getBackgroundColor(context),
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
                builder: (context, child) {
                  return Positioned(
                    left: 0,
                    right: 0,
                    bottom: _animation.value * 24,
                    child: FadeTransition(
                      opacity: _controller,
                      child: child,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
