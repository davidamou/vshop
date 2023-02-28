import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/style.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).colorScheme.primary;
    var divider = Expanded(
      flex: 1,
      child: Divider(
        color: primaryColor.withOpacity(0.2),
      ),
    );
    final iconButtonStyle = IconButton.styleFrom(
      side: BorderSide(
        color: primaryColor.withOpacity(0.2),
      ),
      shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
    );

    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Se connecter',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close_rounded),
              )
            ],
          ),
          const SizedBox(height: 28.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Adressse email',
            ),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Continue'),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              divider,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Or'),
              ),
              divider,
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                style: iconButtonStyle,
                icon: const Icon(Icons.facebook_rounded, color: Colors.blue),
              ),
              const SizedBox(width: 12.0),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/google.svg',
                  width: 24,
                  height: 24,
                ),
                style: iconButtonStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
