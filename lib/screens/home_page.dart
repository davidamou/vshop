import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/providers/post_provider.dart';
import 'package:vshop/providers/product_provider.dart';
import 'package:vshop/widgets/grid_adaptive.dart';
import 'package:vshop/widgets/post_view.dart';
import 'package:vshop/widgets/tab_adaptive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.search_normal_1,
                      size: 20,
                    ),
                    hintText: 'Search here',
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    StreamBuilder(
                      stream: PostProvider.ref.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return PostView(
                            post: snapshot.data!.docs.first.data(),
                          );
                        }
                        return const AspectRatio(
                          aspectRatio: 2.5,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
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
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: defaultBorderRadius,
                        color: Colors.black,
                      ),
                      tabs: const [
                        TabAdaptive(text: 'All'),
                        TabAdaptive(text: 'Vests'),
                        TabAdaptive(text: 'Blazers'),
                        TabAdaptive(text: 'Evening dress'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GridAdaptive(data: ProductProvider.ref.snapshots()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
