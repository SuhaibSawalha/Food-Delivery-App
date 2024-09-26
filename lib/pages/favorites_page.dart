import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery/modules/category.dart';
import 'package:food_delivery/modules/product.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Product> subProducts = List.from(favoriteProducts),
      currentFavoriteProducts = List.from(favoriteProducts);
  int categoryIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Favorites!",
                    style: GoogleFonts.getFont(
                      'Pacifico',
                      fontSize: 32,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dummyCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (categoryIndex == index) {
                            categoryIndex = -1;
                            subProducts = currentFavoriteProducts;
                          } else {
                            categoryIndex = index;
                            subProducts = currentFavoriteProducts
                                .where((element) =>
                                    element.category == index.toString())
                                .toList();
                          }
                        });
                      },
                      child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: categoryIndex == index
                                ? AppColors.primaryColor
                                : AppColors.white,
                            border:
                                Border.all(color: AppColors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(dummyCategories[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  )))),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            subProducts.isEmpty
                ? const Text('No products found',
                    style: TextStyle(fontSize: 20))
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return productCard(subProducts[index]);
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget productCard(Product product) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product-details', arguments: product)
            .then((value) => setState(() {}));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 140,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 100, child: Image.asset(product.image)),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 220,
                      child: Row(
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
                              Text(
                                  dummyCategories[int.parse(product.category)]
                                      .name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.darkGrey,
                                  )),
                              const SizedBox(height: 10),
                              Text('\$${product.price}',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
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
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
