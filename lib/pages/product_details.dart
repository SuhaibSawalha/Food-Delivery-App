import 'package:flutter/material.dart';
import 'package:food_delivery/modules/cart.dart';
import 'package:food_delivery/modules/category.dart';
import 'package:food_delivery/modules/product.dart';
import 'package:food_delivery/utils/app_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.bgColor,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (favoriteProducts.contains(product)) {
                    favoriteProducts.remove(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Removed from favorites'),
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 1),
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else {
                    favoriteProducts.add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to favorites'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                });
              },
              icon: Icon(favoriteProducts.contains(product)
                  ? Icons.favorite
                  : Icons.favorite_border),
              iconSize: 35,
              color: favoriteProducts.contains(product)
                  ? AppColors.primaryColor
                  : AppColors.darkGrey,
            ),
            const SizedBox(width: 10),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.bgColor,
            ),
            width: double.infinity,
            height: 320,
            child: Image.asset(product.image, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (counter > 1) {
                                  counter--;
                                }
                              });
                            }),
                        const SizedBox(width: 5),
                        Text('$counter',
                            style: Theme.of(context).textTheme.titleLarge!),
                        const SizedBox(width: 5),
                        IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            }),
                      ],
                    )
                  ],
                ),
                Text(dummyCategories[int.parse(product.category)].name,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.darkGrey)),
                const SizedBox(height: 3),
                Divider(
                  color: AppColors.grey,
                  thickness: 1.5,
                ),
                const SizedBox(height: 10),
                Text(product.description,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.darkGrey,
                        )),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, size: 25),
                        const SizedBox(width: 5),
                        Text("${product.cookTime} mins to be ready",
                            style: Theme.of(context).textTheme.titleLarge!),
                        const SizedBox(width: 5),
                        const Icon(Icons.outdoor_grill_outlined, size: 25)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        width: 230,
                        height: 1,
                        decoration:
                            BoxDecoration(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("\$${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              )),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                          onTap: () {
                            addItem(product.id, counter);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Added to Cart'),
                                    content: const Text(
                                        'Your item has been added to the cart'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                    context, '/cart')
                                                .then((value) =>
                                                    Navigator.pop(context));
                                          },
                                          child: const Text('Go to Cart')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Add to Cart',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                  const Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
