import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/providers/post_provider.dart';
import 'package:vshop/providers/product_provider.dart';
import 'package:vshop/screens/home/components/grid_builder.dart';
import 'package:vshop/screens/home/components/home_app_bar.dart';
import 'package:vshop/screens/home/components/post_view.dart';
import 'package:vshop/screens/home/components/setting_drawer.dart';
import 'package:vshop/screens/home/components/tab_adaptive.dart';

import '../../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: homeAppBar(context),
      endDrawer: const SettingDrawer(),
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.0,
                child: StreamBuilder(
                  stream: PostProvider.ref.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return PostView(
                        post: snapshot.data!.docs.first.data(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: defaultBorderRadius,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'View all',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                labelColor: getTextColor(context),
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: defaultBorderRadius,
                  color: getPrimaryColor(context),
                ),
                tabs: const [
                  TabAdaptive(text: 'All'),
                  TabAdaptive(text: 'Vests'),
                  TabAdaptive(text: 'Blazers'),
                  TabAdaptive(text: 'Evening dress'),
                ],
              ),
              const SizedBox(height: 20),
              GridBuilder(data: ProductProvider.ref.snapshots()),
            ],
          ),
        ),
      ),
    );
  }
}
