import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const divider = Expanded(flex: 1, child: Divider());

    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.all(20.0),
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: width,
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to DavShop,',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Login to continue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
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
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                divider,
                Padding(
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
                  icon: const Icon(Icons.facebook_rounded, color: Colors.blue),
                ),
                const SizedBox(width: 12.0),
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.gallery)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
