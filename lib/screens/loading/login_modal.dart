import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/text_style.dart';

void showLoginModal(BuildContext context) {
  var primaryColor = Theme.of(context).colorScheme.primary;
  var divider = Expanded(
    flex: 1,
    child: Divider(
      color: primaryColor.withOpacity(0.2),
    ),
  );

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      )
    ),
    constraints: const BoxConstraints(
      maxHeight: 332.0,
    ),
    builder: (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Se connecter', style: titleLarge(context)),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close_rounded),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Column(
            children: [
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/google.svg',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text('witch google'),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook_rounded,
                        color: Colors.blue,
                      ),
                      label: const Text('witch facebook'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
