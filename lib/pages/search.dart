import 'package:flutter/material.dart';
import 'package:food_delivery/modules/category.dart';
import 'package:food_delivery/modules/product.dart';
import 'package:food_delivery/utils/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool matchSearch(String search, String name) {
    return name.toLowerCase().contains(search.toLowerCase().trim());
  }

  @override
  Widget build(BuildContext context) {
    final String value = ModalRoute.of(context)!.settings.arguments as String;
    List<Product> productsList = dummyProducts
        .where((product) => matchSearch(value, product.name))
        .toList();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) {
                  Navigator.pushNamed(context, '/search', arguments: value)
                      .then((value) => Navigator.pop(context));
                },
                controller: TextEditingController(text: value),
                decoration: InputDecoration(
                  hintText: 'Search for food',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              productsList.isEmpty
                  ? const Center(
                      child: Text('No products found'),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 12),
                      itemCount: productsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return productCard(productsList[index]);
                      },
                    ),
            ],
          ),
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
              Image(image: AssetImage(product.image), width: 100, height: 100),
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
        ));
  }
}
