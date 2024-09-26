import 'package:flutter/material.dart';
import 'package:food_delivery/modules/category.dart';
import 'package:food_delivery/modules/product.dart';
import 'package:food_delivery/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = -1;

  @override
  Widget build(BuildContext context) {
    List<Product> subProducts = dummyProducts
        .where((product) =>
            selectedCategory == -1 ||
            selectedCategory == int.parse(product.category))
        .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 320,
              child: Image.asset('assets/images/main.jpg', fit: BoxFit.fill),
            ),
            const SizedBox(height: 20),
            TextField(
              onSubmitted: (value) {
                Navigator.pushNamed(context, '/search', arguments: value);
              },
              decoration: InputDecoration(
                hintText: 'Search for food',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dummyCategories.map((e) => categoryCard(e)).toList(),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 12),
              itemCount: subProducts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return productCard(subProducts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(Category category) {
    int id = int.parse(category.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (selectedCategory == id) {
              selectedCategory = -1;
            } else {
              selectedCategory = id;
            }
          });
        },
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: selectedCategory == id
                    ? AppColors.primaryColor
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: selectedCategory == id ? 3 : 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image(image: AssetImage(category.image), width: 60, height: 60),
                const SizedBox(height: 10),
                Text(category.name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productCard(Product product) {
    return Stack(alignment: Alignment.center, children: [
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/product-details', arguments: product)
                .then((value) => setState(() {}));
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Image(
                    image: AssetImage(product.image), width: 100, height: 100),
                Text(product.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                Text(dummyCategories[int.parse(product.category)].name,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                        )),
                const SizedBox(height: 3),
                Text('\$${product.price}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )),
      Positioned(
        top: 0,
        right: 0,
        child: IconButton(
          onPressed: () {
            setState(() {
              if (favoriteProducts.contains(product)) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
      ),
    ]);
  }
}
