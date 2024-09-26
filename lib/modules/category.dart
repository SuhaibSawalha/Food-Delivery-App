class Category {
  final String name;
  final String id;
  final String image;

  Category({required this.name, required this.id, required this.image});
}

List<Category> dummyCategories = [
  Category(
      name: 'Burger', id: '0', image: 'assets/images/categories/burger.png'),
  Category(name: 'Pizza', id: '1', image: 'assets/images/categories/pizza.png'),
  Category(name: 'Pasta', id: '2', image: 'assets/images/categories/pasta.png'),
  Category(name: 'Taco', id: '3', image: 'assets/images/categories/taco.png'),
  Category(
      name: 'Chicken', id: '4', image: 'assets/images/categories/chicken.png'),
];
