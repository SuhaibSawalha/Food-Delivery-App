import 'package:flutter/material.dart';
import 'package:food_delivery/modules/cart.dart';
import 'package:food_delivery/modules/product.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, color: AppColors.green),
                Text('Nablus, Palestine',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ],
        ),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text("Your cart is empty!",
                  style: Theme.of(context).textTheme.titleLarge))
          : Stack(children: [
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your Cart!",
                                style: GoogleFonts.getFont(
                                  'Pacifico',
                                  fontSize: 32,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Total: ',
                                style: Theme.of(context).textTheme.titleLarge),
                            Text(
                                "\$${cartItems.fold(0.0, (a, b) => a + b.quantity * dummyProducts.firstWhere((product) => product.id == b.productId).price)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return itemCard(cartItems[index]);
                          },
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Center(
                              child: AlertDialog(
                                  title: const Text('Order Placed!'),
                                  content: const Text(
                                      'Your order has been placed successfully!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems.clear();
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ]),
                            ));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primaryColor,
                    child: Center(
                      child: Text('Place Order',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.white)),
                    ),
                  ),
                ),
              )
            ]),
    );
  }

  Widget itemCard(Item item) {
    Product product =
        dummyProducts.firstWhere((element) => element.id == item.productId);
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 120,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 80, child: Image.asset(product.image)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'price',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: AppColors.darkGrey),
                                          ),
                                          Text('\$${product.price}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(width: 5),
                                      const SizedBox(
                                          height: 30, child: VerticalDivider()),
                                      const SizedBox(width: 2),
                                      Column(
                                        children: [
                                          Text(
                                            'quantity',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: AppColors.darkGrey),
                                          ),
                                          Text('${item.quantity}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Total",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: AppColors.darkGrey)),
                                Text("\$${product.price * item.quantity}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Center(
                          child: AlertDialog(
                              title: const Text('Are you sure?'),
                              content: const Text(
                                  'Do you want to remove the item from the cart?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      cartItems.removeWhere(
                                          (element) => element.id == item.id);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text('Yes'),
                                ),
                              ]),
                        ));
              });
            },
            icon: const Icon(Icons.delete),
            iconSize: 22,
          ),
        ),
      ],
    );
  }
}
