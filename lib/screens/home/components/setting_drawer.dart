import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/text_style.dart';
import '../../../utils/widget_function/function.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  final listTitlePadding = const EdgeInsets.symmetric(
    horizontal: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 64.0,
              child: DrawerHeader(
                curve: Curves.linear,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Settings',
                      style: titleLarge(context, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 12,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: listTitlePadding,
                    minVerticalPadding: 0,
                    leading: const Icon(Iconsax.sun_1),
                    title: const Text('Theme Mode'),
                    subtitle: const Text('Light'),
                    onTap: () => changeThemeMode(context),
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 12,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: listTitlePadding,
                    minVerticalPadding: 0,
                    leading: const Icon(Iconsax.language_circle),
                    title: const Text('Language'),
                    subtitle: const Text('English'),
                    onTap: () {},
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 12,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: listTitlePadding,
                    minVerticalPadding: 0,
                    leading: const Icon(Iconsax.sms_notification),
                    title: const Text('Notification management'),
                    subtitle: const Text('active'),
                    onTap: () {},
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 12,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: listTitlePadding,
                    minVerticalPadding: 0,
                    leading: const Icon(Icons.new_releases_outlined),
                    title: const Text('New collection Notification'),
                    subtitle: const Text('active'),
                    onTap: () {},
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 12,
                    visualDensity: VisualDensity.comfortable,
                    contentPadding: listTitlePadding,
                    minVerticalPadding: 0,
                    leading: const Icon(Icons.share),
                    title: const Text('Share app'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
