class Item {
  final String id;
  final String productId;
  final int quantity;

  Item({required this.id, required this.productId, required this.quantity});
}

List<Item> cartItems = [];

void addItem(String productId, int quantity) {
  int index = cartItems.indexWhere((element) => element.productId == productId);
  if (index >= 0) {
    cartItems[index] = Item(
      id: cartItems[index].id,
      productId: cartItems[index].productId,
      quantity: cartItems[index].quantity + quantity,
    );
  } else {
    cartItems.add(Item(
      id: cartItems.length.toString(),
      productId: productId,
      quantity: quantity,
    ));
  }
}
