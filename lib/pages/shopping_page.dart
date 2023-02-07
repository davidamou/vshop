import 'package:flutter/material.dart';
import 'package:vshop/constants/function.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: back(context),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
