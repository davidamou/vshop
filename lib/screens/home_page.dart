import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/style.dart';

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
                    hintText: 'Rechercher',
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AspectRatio(
                      aspectRatio: 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://lh3.googleusercontent.com/blW4GclSAHEPQ085bQ9fooIfONvoURw6d7WNNvayv8b9BQClAm9LnNwK3jk9yhBSZBtz7KJNDhZksKYTSFIYslysqblMavdG5PtgA--9APecfenDaB3f5SevzrKcC19W98liD6zEU56l9cWZf5f0eOxnpx3XPFpXRSX3S4H1l206-aUZvEPY_rivOyXzZsSca28q_WqJx2V29aNywtdo5Qes2TmbUsBxEZvcuolAwkyeJ8765qzGnaHQ4MRncFDbbCSzm4igFeZOKOImLfmOdltMnMuhsv8GBzGxqZCOzF7GBGQNzFNFIGsDHv8f7vI5dLN1bm35ce77o-jtKU66-euwUOHnvpnDp2M675lFCvUUizI28I66UYtTiZFURfodRsPnatZnMyfEsmeQQVpekzkIfecM5Ltm9mBQCf2b76zem9xQP4-EjnG7Wtw7qnLeDHkR8rMdAgycBkx2Ej0yENHuUVvRUwTJLdYwR1ujoUkBy8-d5hk_uqzQOZDlYfCAoFgwwMW3c5HeoxDsMXkqLfjmaxLrOKLOZLuazdnnBknRhi8eFY8lJGzzxj9jtdo2H28D1Jo-5TxElz9AjNJS-KcirQyfzF7EgWMIfKcqvjD-p7JcFyn0Y1MNGaDrIt7cSS_6GSiXEP-L9AdtawUq8H3fVr4W4ERz0P-VOU3ksPiqE3uEI8gxDIvFnu5Zpum7ogBdej3iLkzCPieM8u97eggOSmcs_s5RsqQx1SAYqnlse9BTfvrGW-cF2WdXIBWCg5JKrh6ygqk0ntYMW_fBZH_fRRxswtWJvQ_KvrKtxmPbJwValx7y7Fcap3sBH4f4l4_4kDIupdd3hviXDx7RR4xd2XFMiPkpG3EjW6RyvYTzSDrOBSl-SEoYsuZrnnoc0quek2ItO2l9_dznsWGAzl6mAesftacb2a65k-X7Z5z4r1an_k1CKxqX6j9NJ_PdmW1vDOl2XKSqcWxWdMNodCqi8M5pP-4oWmp1WmfdgITm54PhVfOxMSyv=w1399-h933-no?authuser=0',
                        imageBuilder: (context, imageProvider) => Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: defaultBorderRadius,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categorie',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Affichier plus',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Noveaute'),
                        Tab(text: 'Veste'),
                        Tab(text: 'Robe de soire'),
                      ],
                    ),

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
