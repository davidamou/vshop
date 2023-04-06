import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/utils/widget_function/function.dart';
import '../../constants/style.dart';

const _divider = SizedBox(
  width: 80.0,
  child: Divider(
    height: 4,
    thickness: 1,
  ),
);

void showLoginModal(BuildContext context) {
  var loginDialog = AlertDialog(
    alignment: Alignment.bottomCenter,
    contentPadding: const EdgeInsets.all(16.0),
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: defaultBorderRadius.topLeft,
        topRight: defaultBorderRadius.topRight,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Log In'),
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close_rounded),
        ),
      ],
    ),
    content: SizedBox(
      width: getScreenSize(context).width,
      height: 212,
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Adressse email',
            ),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go('/register'),
              child: const Text('Continue'),
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _divider,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Or'),
              ),
              _divider,
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
                  label: const Text('Google'),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                flex: 1,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook_rounded,
                    color: Colors.blue,
                  ),
                  label: const Text('Facebook'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => loginDialog,
  );
}
