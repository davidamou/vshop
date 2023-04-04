import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../constants/style.dart';
import '../../constants/text_style.dart';

const _divider = SizedBox(
  width: 80.0,
  child: Divider(
    height: 4,
    thickness: 1,
  ),
);

const _radius = Radius.circular(8.0);

void showLoginModal(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: _radius,
        topRight: _radius,
      ),
    ),
    constraints: const BoxConstraints(
      maxHeight: 286.0,
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Log In',
                  style: titleLarge(
                    context,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  borderRadius: defaultBorderRadius,
                  onTap: () => context.pop(),
                  child: const Icon(Icons.close_rounded),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            TextFormField(
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
                    label: const Text('witch google'),
                  ),
                ),
                const SizedBox(width: 16.0),
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
            const SizedBox(height: 12.0),
          ],
        ),
      );
    },
  );
}
