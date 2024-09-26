class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  final double cookTime;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.cookTime,
    required this.description,
  });
}

List<Product> favoriteProducts = [];

List<Product> dummyProducts = [
  Product(
      id: '0',
      name: 'Beef Burger',
      category: '0',
      price: 10.0,
      image: 'assets/images/products/beef-burger.png',
      cookTime: 10,
      description:
          "A beef burger is a classic American dish consisting of a seasoned ground beef patty served between two halves of a soft bun. It's typically accompanied by various toppings such as lettuce, tomato, onions, cheese, pickles, and condiments like ketchup and mustard. Juicy, flavorful, and satisfyingly hearty, it's a beloved culinary staple."),
  Product(
      id: '1',
      name: 'Chicken Burger',
      category: '0',
      price: 8.0,
      image: 'assets/images/products/chicken-burger.png',
      cookTime: 10,
      description:
          "A chicken burger is a delicious alternative to the classic beef burger, featuring a tender chicken patty nestled between two soft buns. Often seasoned with herbs and spices, the chicken patty offers a lighter flavor profile while remaining juicy and satisfying. Toppings like lettuce, tomato, cheese, and sauces enhance its taste, creating a delightful culinary experience."),
  Product(
      id: '2',
      name: 'Cheese Burger',
      category: '0',
      price: 12.0,
      image: 'assets/images/products/cheese-burger.png',
      cookTime: 10,
      description:
          "A cheeseburger is a beloved classic, featuring a juicy beef patty topped with melted cheese, served between two soft buns. The combination of savory beef and creamy cheese creates a rich and satisfying flavor profile. Often accompanied by lettuce, tomato, onions, and condiments like ketchup and mustard, it's a timeless favorite among burger enthusiasts."),
  Product(
      id: '3',
      name: 'Mushroom Burger',
      category: '0',
      price: 14.5,
      image: 'assets/images/products/mushroom-burger.png',
      cookTime: 12,
      description:
          "A mushroom burger is a delicious vegetarian option, featuring a savory mushroom patty served between two soft buns. The earthy flavor of the mushrooms pairs well with a variety of toppings such as lettuce, tomato, onions, and cheese, creating a satisfying and flavorful culinary experience."),
  Product(
      id: '4',
      name: 'Chicken Pizza',
      category: '1',
      price: 20.0,
      image: 'assets/images/products/chicken-pizza.png',
      cookTime: 20,
      description:
          "Chicken pizza offers a delightful twist on the traditional pizza, featuring tender pieces of chicken as a flavorful topping. Typically accompanied by a variety of ingredients such as cheese, tomato sauce, vegetables, and herbs, chicken pizza offers a savory and satisfying flavor profile with a hint of protein richness."),
  Product(
      id: '5',
      name: 'Margreta Pizza',
      category: '1',
      price: 22.0,
      image: 'assets/images/products/margreta-pizza.png',
      cookTime: 18,
      description:
          "Margherita pizza is a classic Italian dish characterized by its simplicity and fresh ingredients. Topped with tomato sauce, slices of fresh mozzarella cheese, and whole basil leaves, it offers a harmonious blend of flavors. The vibrant colors of red, white, and green pay homage to the Italian flag, making it a visually appealing and delicious choice."),
  Product(
      id: '6',
      name: 'Mushroom Pizza',
      category: '1',
      price: 18.0,
      image: 'assets/images/products/mushroom-pizza.webp',
      cookTime: 20,
      description:
          "Mushroom pizza is a delicious vegetarian option, featuring earthy and savory mushrooms as the main topping. The mushrooms are often accompanied by cheese, tomato sauce, and a variety of herbs and spices, creating a satisfying and flavorful culinary experience."),
  Product(
      id: '7',
      name: 'Spaghetti',
      category: '2',
      price: 30.0,
      image: 'assets/images/products/spaghetti.webp',
      cookTime: 25,
      description:
          "Spaghetti is a popular Italian pasta dish made from long, thin noodles. Typically served with a variety of sauces, such as marinara (tomato-based), Bolognese (meat-based), or Alfredo (cream-based), spaghetti is versatile and comforting. It's often garnished with grated cheese, herbs, or meatballs, offering a satisfying and flavorful meal."),
  Product(
      id: '8',
      name: 'Bolognese Pasta',
      category: '2',
      price: 45.0,
      image: 'assets/images/products/bolognese-pasta.png',
      cookTime: 35,
      description:
          "Bolognese pasta is a hearty Italian dish featuring a rich, meat-based sauce served over pasta. The sauce is typically made with ground beef, tomatoes, onions, carrots, and a variety of herbs and spices. When paired with pasta such as spaghetti or fettuccine, it creates a satisfying and flavorful meal that's perfect for any occasion."),
  Product(
      id: '9',
      name: 'Lazania',
      category: '2',
      price: 30.0,
      image: 'assets/images/products/lazania.webp',
      cookTime: 25,
      description:
          "Lasagna is a classic Italian dish consisting of layers of wide, flat pasta, rich meat sauce, creamy béchamel, and melted cheese. The combination of tender pasta, savory meat, and indulgent cheese creates a comforting and satisfying flavor profile. Often baked to golden perfection, lasagna is a beloved dish that's perfect for sharing with family and friends."),
  Product(
      id: '10',
      name: 'Taco',
      category: '3',
      price: 35.0,
      image: 'assets/images/products/taco.png',
      cookTime: 8,
      description:
          "A taco is a traditional Mexican dish consisting of a corn or wheat tortilla filled with various ingredients. Common fillings include seasoned meat, beans, cheese, lettuce, and salsa. Tacos are often garnished with fresh cilantro, onions, and a squeeze of lime, offering a vibrant and flavorful culinary experience. They can be enjoyed as a handheld snack or a full meal."),
  Product(
      id: '11',
      name: 'Double Taco',
      category: '3',
      price: 35.0,
      image: 'assets/images/products/double-taco.png',
      cookTime: 12,
      description:
          "A double taco is a hearty and satisfying variation of the classic taco, featuring two layers of tortillas filled with a generous portion of seasoned meat, beans, cheese, and fresh toppings. The double layer of tortillas provides extra support for the flavorful fillings, creating a delicious and satisfying culinary experience. It's perfect for those with a hearty appetite."),
  Product(
      id: '12',
      name: 'Fried Chicken',
      category: '4',
      price: 25.0,
      image: 'assets/images/products/fried-chicken.png',
      cookTime: 15,
      description:
          "Fried chicken is a beloved dish featuring tender, juicy chicken coated in a seasoned breading and deep-fried to golden perfection. The crispy exterior gives way to succulent, flavorful meat, creating a satisfying and indulgent culinary experience. Often served with sides such as mashed potatoes, coleslaw, and biscuits, fried chicken is a timeless favorite."),
  Product(
      id: '13',
      name: 'Grilled Chicken',
      category: '4',
      price: 35.0,
      image: 'assets/images/products/grilled-chicken.webp',
      cookTime: 30,
      description:
          "Grilled chicken is a healthy and flavorful dish featuring tender, juicy chicken that's been marinated and cooked over an open flame. The grilling process imparts a smoky flavor and creates beautiful grill marks, enhancing the overall taste and presentation. Grilled chicken is a versatile dish that pairs well with a variety of sides and sauces."),
];
