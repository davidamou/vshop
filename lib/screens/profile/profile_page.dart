import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final iconSize = 20.0;
  final trailingIcon = const Icon(
    Iconsax.arrow_right_3,
    size: 16.0,
  );

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100.0,
              title: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://images.pexels.com/photos/7985142/pexels-photo-7985142.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                    imageBuilder: (context, imageProvider) {
                      return CircleAvatar(
                        radius: 32,
                        backgroundImage: imageProvider,
                      );
                    },
                    placeholder: (context, url) {
                      return const CircleAvatar(
                        radius: 32,
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const CircleAvatar(
                        radius: 32,
                        child: Icon(Iconsax.profile),
                      );
                    },
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delali Amz',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      InkWell(
                        onTap: () {},
                        borderRadius: defaultBorderRadius,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'View profile',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //body
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListTile(
                    title: const Text('Message'),
                    onTap: () {},
                    leading: Icon(Iconsax.message, size: iconSize),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('Devises'),
                    onTap: () {},
                    leading: Icon(Iconsax.money, size: iconSize),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('My purchases'),
                    onTap: () {},
                    leading: Icon(Iconsax.shopping_bag4, size: iconSize),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('Favorite'),
                    onTap: () {},
                    leading: Icon(Iconsax.heart, size: iconSize),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: Text((user != null) ? 'Log Out' : 'Log In') ,
                    onTap: () {},
                    leading: Icon((user != null)? Iconsax.logout : Iconsax.login, size: iconSize),
                    trailing: trailingIcon,
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
