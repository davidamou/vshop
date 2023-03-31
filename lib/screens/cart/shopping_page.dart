import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/utils/widget_function/function.dart';
import '../../constants/style.dart';
import 'components/product_chart.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  static final List<ProductChart> chartListProduct = [];

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: back(context),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: _emptyBasket,
            icon: const Icon(Iconsax.trash),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: defaultBorderRadius,
              ),
              leading: const Icon(Iconsax.location),
              title: const Text('Delivering to'),
              subtitle: const Text('Lome, Togo, BP 5656'),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ),
            const SizedBox(height: 20.0),
            ...ShoppingPage.chartListProduct,
          ],
        ),
      ),
      bottomNavigationBar: ShoppingPage.chartListProduct.isNotEmpty? Container(
        height: 208,
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            priceDetail(label: 'Subtotal', price: _totalPrice()),
            const SizedBox(height: 24),
            priceDetail(label: 'Delivery', price: 20.0),
            const Divider(thickness: 0.1, height: 32),
            priceDetail(
              label: 'Total',
              price: _totalPrice() + 20,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ),
          ],
        ),
      ) : null,
    );
  }

  Widget priceDetail(
      {required String label, required double price, TextStyle? style}) {
    var textStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            Text(
              '\$',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '$price',
              style: (style == null) ? textStyle : style,
            ),
          ],
        ),
      ],
    );
  }

  _emptyBasket() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete"),
        content: const Text("Do you want to empty the basket"),
        actions: [
          OutlinedButton(
            onPressed: () => context.pop(),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              ShoppingPage.chartListProduct.clear();
              context.pop();
            }),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  double _totalPrice() {
    double sum = 0.0;
    for (var element in ShoppingPage.chartListProduct) {
      sum += (element.price + element.quantity);
    }
    return sum;
  }
}
